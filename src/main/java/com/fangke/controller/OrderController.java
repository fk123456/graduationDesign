package com.fangke.controller;

import com.alibaba.fastjson.JSONObject;
import com.fangke.domain.Order;
import com.fangke.result.BaseResult;
import com.fangke.result.PageResult;
import com.fangke.service.OrderService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.ValidationEventLocator;

/**
 * Created by ${fk}
 * on 12:41 2018/3/24
 */
@RestController
@RequestMapping("order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    /**
     * 查询订单信息
     *
     * @param pageNo   当前页
     * @param pageSize 页数
     * @param userId   用户id
     * @return
     */
    @GetMapping(value = "/findByOrder")
    public PageResult findByOrder(@RequestParam(value = "pageNo", required = false) Integer pageNo,
                                  @RequestParam(value = "pageSize", required = false) Integer pageSize,
                                  @RequestParam(value = "userId") Long userId) {
        return orderService.findByOrder(pageNo, pageSize, userId);
    }

    /**
     * 更新订单
     *
     * @param order 订单
     * @return
     */
    @PostMapping(value = "/updateByOrder")
    public BaseResult updateByOrder(@RequestBody Order order) {
        return orderService.updateByOrder(order);
    }

    /**
     * 删除订单
     *
     * @param id
     * @return
     */
    @GetMapping(value = "/deleteById")
    public BaseResult deleteById(@RequestParam(value = "id") Long id) {
        return orderService.deleteById(id);
    }

    @GetMapping(value = "/loadBook")
    public JSONObject loadReserveInfo(@RequestParam(value = "appointTime") String appointTime,
                                      @RequestParam(value = "deviceId") String deviceId,
                                      @RequestParam(value = "classNo") Integer classNo,
                                      @RequestParam(value = "sum") Integer sum) {
        return orderService.loadReserveInfo(deviceId, appointTime, classNo, sum);
    }

    @GetMapping(value = "/loadClassRoom")
    public JSONObject loadClassRoom() {
        return orderService.getClassRoom();
    }

    @GetMapping(value = "/loadClass")
    public JSONObject loadClass(@RequestParam(value = "appointTime") String appointTime,
                                @RequestParam(value = "deviceId") String deviceId,
                                @RequestParam(value = "sum") Integer sum) {
        return orderService.loadClass(appointTime, deviceId, sum);
    }

    @GetMapping(value = "/selectClass")
    public JSONObject selectClass(@RequestParam(value = "appointTime") String appointTime,
                                  @RequestParam(value = "deviceId") String deviceId,
                                  @RequestParam(value = "classNo") String classNo,
                                  @RequestParam(value = "sum") Integer sum) {
        return orderService.selectClass(appointTime, deviceId, classNo, sum);
    }

    @GetMapping(value = "/appointment")
    public BaseResult appointment(
            @RequestParam(value = "deviceId") String deviceId,
            @RequestParam(value = "authority") String authority,
            @RequestParam(value = "classNo") Integer classNo,
            @RequestParam(value = "userId") Integer userId,
            @RequestParam(value = "book") Integer book,
            @RequestParam(value = "appointTime") String appointTime,
            HttpServletRequest request) {
        return orderService.appointment(deviceId, authority, classNo, userId, appointTime, book, request);
    }

    @GetMapping(value = "/cancelAppoint")
    public BaseResult cancelAppoint(@RequestParam(value = "orderId") String orderId, @RequestParam(value = "deleteId") Long deleteId) {
        return orderService.cancelAppoint(orderId, deleteId);
    }

    @GetMapping(value = "/getOrderList")
    public PageResult getOrderList(@RequestParam(value = "userId") String userId, @RequestParam(value = "pageNo") Integer pageNo, @RequestParam(value = "pageSize") Integer pageSize, @RequestParam(value = "authority") String authority, @RequestParam(value = "account") String account) {
        return orderService.getOrderList(userId, pageNo, pageSize, authority, account);
    }

    /**
     * 学生订单列表
     *
     * @param userId
     * @param pageNo
     * @param pageSize
     * @return
     */
    @GetMapping(value = "/getOrderListByStu")
    public PageResult getOrderListByStu(@RequestParam(value = "userId") String userId, @RequestParam(value = "pageNo") Integer pageNo, @RequestParam(value = "pageSize") Integer pageSize) {
        return orderService.getOrderListByStu(userId, pageNo, pageSize);
    }

    @GetMapping(value = "/updateBook")
    public BaseResult updateBook(@RequestParam(value = "id") String id, @RequestParam(value = "book") String book, @Param("userId") String userId, @Param("authority") String authority) {
        return orderService.updateBook(id, book, userId, authority);
    }

    @GetMapping(value = "/updateState")
    public BaseResult updateState(@RequestParam(value = "id") String id, @Param("deleteId") String deleteId) {
        return orderService.updateState(id, deleteId);
    }
}
