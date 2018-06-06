package com.fangke.service;

import com.alibaba.fastjson.JSONObject;
import com.fangke.domain.Order;
import com.fangke.result.BaseResult;
import com.fangke.result.PageResult;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ${fk}
 * on 12:42 2018/3/24
 */
public interface OrderService {
    /**
     * 查询订单信息
     *
     * @param pageNo   当前页
     * @param pageSize 页数
     * @param userId   用户id
     * @return
     */
    PageResult findByOrder(Integer pageNo, Integer pageSize, Long userId);

    /**
     * 更新订单
     *
     * @param order
     * @return
     */
    BaseResult updateByOrder(Order order);

    /**
     * 删除订单
     *
     * @param id
     * @return
     */
    BaseResult deleteById(Long id);


    BaseResult appointment(String deviceId, String classroomNo, Integer classNo, Integer userId, String appointTime, Integer book, HttpServletRequest request);


    JSONObject loadReserveInfo(String deviceId, String appointTime, Integer classNo, Integer sum);

    JSONObject loadClass(String appointTime, String deviceId, Integer sum);

    JSONObject selectClass(String appointTime, String deviceId, String classNo, Integer sum);

    JSONObject getClassRoom();

    BaseResult cancelAppoint(String orderId, Long deleteId);


    PageResult getOrderList(String userId, Integer pageNo, Integer pageSize, String authority, String account);


    BaseResult updateBook(String id, String book, String userId, String authority);

    BaseResult updateState(String id, String deleteId);

    /**
     * 学生订单列表
     *
     * @param userId
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageResult getOrderListByStu(String userId, Integer pageNo, Integer pageSize);
}
