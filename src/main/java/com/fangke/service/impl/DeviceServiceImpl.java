package com.fangke.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSONObject;
import com.fangke.domain.*;
import com.fangke.mapper.DeviceMapper;
import com.fangke.result.BaseResult;
import com.fangke.result.PageResult;
import com.fangke.service.DeviceService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-19.
 */
@Service
public class DeviceServiceImpl implements DeviceService {

    @Autowired
    private DeviceMapper deviceMapper;

    /**
     * 分页查询设备
     *
     * @param pageNo     当前页
     * @param pageSize   页数
     * @param categoryId 目录id
     * @return
     */
    @Override
    public PageResult findByDevice(Integer pageNo, Integer pageSize, Long categoryId) {
        //开始分页
        PageHelper.startPage(pageNo, pageSize);
        Page<Device> page = deviceMapper.findByDevice(categoryId);
        return new PageResult(page);
    }

    /**
     * 模糊查询
     *
     * @param pageNo    当前页
     * @param pageSize  页数
     * @param searchKey 模糊Key
     * @return
     */
    @Override
    public PageResult findBySearchKey(Integer pageNo, Integer pageSize, String searchKey) {
        PageHelper.startPage(pageNo, pageSize);
        if (StringUtils.isEmpty(searchKey)) {
            searchKey = null;
        }
        if (!StringUtils.isEmpty(searchKey)) {
            searchKey = "%" + searchKey + "%";
        }
        Page<Device> page = deviceMapper.findBySearchKey(searchKey);
        return new PageResult(page);
    }

    /**
     * 类目列表
     *
     * @return
     */
    @Override
    public PageResult find(Integer pageNo, Integer pageSize, String status, Integer loginCategoryId) {
        //PageHelper.startPage(pageNo, pageSize);
        Page<Category> page = deviceMapper.find(status, loginCategoryId);
        return new PageResult(page);
    }

    @Override
    public BaseResult appointment(Long id, Long userId, String message) {
        Device device = deviceMapper.findByDetail(id);
        if (device == null) {
            return BaseResult.error("ERROR", "查询设备失败");
        }
        String deviceName = device.getDeviceName();
        Long result = deviceMapper.appointment(id, userId, message, deviceName);
        if (result < 0) {
            return BaseResult.error("ERROR", "预约失败");
        }
        return BaseResult.success("预约成功");
    }

    public JSONObject findByDetail(Long deviceId, Long categoryId) {
        JSONObject result = new JSONObject();
        Device device = deviceMapper.findByDetail(deviceId);
        deviceMapper.changeVisiTotal(deviceId, (device.getVisitTotal() + 1));
        device.setVisitTotal(device.getVisitTotal() + 1);
        result.put("device", device);
        List<MallImg> mallImgList = deviceMapper.findMallImgByDID(deviceId);
        result.put("mallImg", mallImgList);
        List<Device> deviceList = deviceMapper.getOtherDevice(categoryId, deviceId);
        result.put("deviceList", deviceList);
        return result;
    }

    public List<Device> getVisitTotal(Integer loginCategoryId) {
        List<Device> deviceList = deviceMapper.getVisitTotal(loginCategoryId);
        return deviceList;
    }

    public JSONObject getOrderInfo(Integer categoryId, String deviceName) {
        JSONObject result = new JSONObject();
        List<Device> deviceList = new ArrayList<>();
        if (deviceName.equals("")) {
            deviceList = deviceMapper.getDevice(categoryId);
        } else {
            deviceList = deviceMapper.getDeviceByName(categoryId, deviceName);
        }
        Map<Integer, List<Base>> orderMap = new HashMap<>();
        Integer flag = 0;
        for (Device device : deviceList) {
            List<Base> order = deviceMapper.getOrder(device.getId(), categoryId);
            for (Base base : order) {
                if (base.getDaytime().equals("1")) {
                    base.setCourse("第一节课-第二节课");
                } else if (base.getDaytime().equals("2")) {
                    base.setCourse("第三节课-第四节课");
                } else if (base.getDaytime().equals("3")) {
                    base.setCourse("第五节课-第六节课");
                } else if (base.getDaytime().equals("4")) {
                    base.setCourse("第七节课-第八节课");
                }
                if (base.getDeleteId() == -1) {
                    device.setShow("存在刚提交未同意的预订信息");
                }
            }
            orderMap.put(flag, order);
            flag++;
        }
        result.put("device", deviceList);
        result.put("order", orderMap);
        return result;
    }


    public PageResult search(String deviceName, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        Page<Device> page = deviceMapper.search(deviceName);
        return new PageResult(page);
    }

    public List<Device> getDeviceList(Integer loginCategoryId) {
        return deviceMapper.getDeviceList(loginCategoryId);
    }

}
