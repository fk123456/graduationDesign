package com.fangke.controller;

import com.alibaba.fastjson.JSONObject;
import com.fangke.domain.Category;
import com.fangke.domain.Device;
import com.fangke.result.BaseResult;
import com.fangke.result.PageResult;
import com.fangke.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-19.
 */
@RestController
@RequestMapping("device")
public class DeviceController {

    @Autowired
    private DeviceService deviceService;

    /**
     * 分页查询设备
     *
     * @param pageNo     当前页
     * @param pageSize   页数
     * @param categoryId 目录id
     * @return
     */
    @GetMapping(value = "/findByDevice")
    public PageResult findByDevice(@RequestParam(value = "pageNo", required = false) Integer pageNo,
                                   @RequestParam(value = "pageSize", required = false) Integer pageSize,
                                   @RequestParam(value = "categoryId") Long categoryId) {
        return deviceService.findByDevice(pageNo, pageSize, categoryId);
    }

    @GetMapping(value = "/getVisitTotal")
    public List<Device> getVisitTotal(@RequestParam(value = "loginCategoryId", required = false) Integer loginCategoryId) {
        return deviceService.getVisitTotal(loginCategoryId);
    }

    /**
     * 模糊查询
     *
     * @param pageNo    当前页
     * @param pageSize  页数
     * @param searchKey 模糊Key
     * @return
     */
    @GetMapping(value = "/findBySearchKey")
    public PageResult findBySearchKey(@RequestParam(value = "pageNo") Integer pageNo,
                                      @RequestParam(value = "pageSize") Integer pageSize,
                                      @RequestParam(value = "searchKey") String searchKey) {
        return deviceService.findBySearchKey(pageNo, pageSize, searchKey);
    }

    /**
     * 类目列表
     *
     * @return
     */
    @RequestMapping(value = "/find")
    public PageResult find(@RequestParam(value = "pageNo", required = false) Integer pageNo,
                           @RequestParam(value = "pageSize", required = false) Integer pageSize,
                           @RequestParam(value = "status") String status,
                           @RequestParam(value = "loginCategoryId") Integer loginCategoryId) {
        return deviceService.find(pageNo, pageSize, status, loginCategoryId);
    }

    @GetMapping("/appointment")
    public BaseResult appointment(@RequestParam(value = "id") Long id,
                                  @RequestParam(value = "userId") Long userId,
                                  @RequestParam(value = "message") String message) {
        return deviceService.appointment(id, userId, message);
    }

    @GetMapping("/details")
    public JSONObject details(@RequestParam(value = "deviceId") Long deviceId, @RequestParam(value = "categoryId") Long categoryId) {
        return deviceService.findByDetail(deviceId, categoryId);
    }

    @GetMapping("/getOrderInfo")
    public JSONObject getOrderInfo(@RequestParam(value = "deviceName", defaultValue = "") String deviceName,
                                   @RequestParam(value = "categoryId") Integer categoryId) {
        return deviceService.getOrderInfo(categoryId, deviceName);
    }

    @GetMapping("/search")
    public PageResult search(@RequestParam(value = "pageNo") Integer pageNo,
                             @RequestParam(value = "pageSize") Integer pageSize,
                             @RequestParam(value = "deviceName") String deviceName) {
        return deviceService.search(deviceName, pageNo, pageSize);
    }

    @GetMapping("/getDeviceList")
    public List<Device> getDeviceList(@RequestParam(value = "loginCategoryId") Integer loginCategoryId) {
        return deviceService.getDeviceList(loginCategoryId);
    }
}
