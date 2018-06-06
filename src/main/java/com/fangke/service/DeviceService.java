package com.fangke.service;


import com.alibaba.fastjson.JSONObject;
import com.fangke.domain.Category;
import com.fangke.domain.Device;
import com.fangke.result.BaseResult;
import com.fangke.result.PageResult;

import java.util.List;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-19.
 */
public interface DeviceService {

    /**
     * 分页查询设备
     *
     * @param pageNo     当前页
     * @param pageSize   页数
     * @param categoryId 目录id
     * @return
     */
    PageResult findByDevice(Integer pageNo, Integer pageSize, Long categoryId);

    List<Device> getVisitTotal(Integer loginCategoryId);

    /**
     * 模糊查询
     *
     * @param pageNo    当前页
     * @param pageSize  页数
     * @param searchKey 模糊Key
     * @return
     */
    PageResult findBySearchKey(Integer pageNo, Integer pageSize, String searchKey);

    /**
     * 类目列表
     *
     * @return
     */
    PageResult find(Integer pageNo, Integer pageSize, String status, Integer loginCategoryId);

    BaseResult appointment(Long id, Long userId, String message);

    JSONObject findByDetail(Long deviceId, Long categoryId);

    JSONObject getOrderInfo(Integer categoryId, String deviceName);

    PageResult search(String deviceName, Integer pageNo, Integer pageSize);

    List<Device> getDeviceList(Integer loginCategoryId);
}
