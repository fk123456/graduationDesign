package com.fangke.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.fangke.domain.Base;
import com.fangke.domain.Classroom;
import com.fangke.domain.Order;
import com.fangke.domain.OrderState;
import com.fangke.mapper.OrderMapper;
import com.fangke.mapper.UserMapper;
import com.fangke.result.BaseResult;
import com.fangke.result.PageResult;
import com.fangke.service.OrderService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by ${fk}
 * on 12:43 2018/3/24
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private UserMapper userMapper;

    /**
     * 查询订单信息
     *
     * @param pageNo   当前页
     * @param pageSize 页数
     * @param userId   用户id
     * @return
     */
    @Override
    public PageResult findByOrder(Integer pageNo, Integer pageSize, Long userId) {
        PageHelper.startPage(pageNo, pageSize);
        Page<Order> page = orderMapper.findByOrder(userId);
        return new PageResult(page);
    }

    /**
     * 更新订单
     *
     * @param order
     * @return
     */
    @Override
    public BaseResult updateByOrder(Order order) {
        Integer result = orderMapper.updateByOrder(order);
        if (result < 0) {
            return BaseResult.error("ERROR", "订单没找到");
        }
        return BaseResult.success("更新成功");
    }

    /**
     * 删除订单
     *
     * @param id
     * @return
     */
    @Override
    public BaseResult deleteById(Long id) {
        Long result = orderMapper.deleteById(id);
        if (result < 0) {
            return BaseResult.error("ERROR", "删除失败");
        }
        return BaseResult.success("删除成功");
    }


    @Override
    public JSONObject loadReserveInfo(String deviceId, String appointTime, Integer classNo, Integer sum) {
        JSONObject result = new JSONObject();
        List<OrderState> inventoryState = new ArrayList<>();
        String classNoValue = "";
        switch (classNo) {
            case 1:
                inventoryState = orderMapper.getBookByOne(deviceId, appointTime);
                break;
            case 2:
                inventoryState = orderMapper.getBookByTwo(deviceId, appointTime);
                break;
            case 3:
                inventoryState = orderMapper.getBookByThree(deviceId, appointTime);
                break;
            case 4:
                inventoryState = orderMapper.getBookByFour(deviceId, appointTime);
                break;
        }
        //获取库存
        for (OrderState orderState : inventoryState) {
            sum = sum - orderState.getBook();
        }
        result.put("inventory", sum);
        //获取教室
        List<Classroom> classroomState = orderMapper.getClassroomNo();
        if (classroomState.size() > 0) {
            result.put("classroom", classroomState);
        }
        return result;
    }

    @Override
    public JSONObject loadClass(String appointTime, String deviceId, Integer sum) {
        JSONObject result = new JSONObject();
        List<OrderState> orderStateList = orderMapper.loadClass(appointTime, deviceId);
        Integer count = 0;
        Integer first = 0;
        Integer classNo[] = null;
        Integer classNoNo[] = null;
        Integer all[][] = {{1, 0}, {2, 0}, {3, 0}, {4, 0}};
        if (orderStateList.size() > 0) {
            classNo = new Integer[orderStateList.size()];
            classNoNo = new Integer[4 - orderStateList.size()];
            for (OrderState orderState : orderStateList) {
                classNo[count] = orderState.getDayTime();
                count++;
            }
            for (int i = 0; i < all.length; i++) {
                for (int k = 0; k < all[i].length; k++) {
                    for (int j = 0; j < classNo.length; j++) {
                        if (all[i][0] == classNo[j]) {
                            all[i][1] = 1;
                        }
                    }
                }
            }
            for (int i = 0; i < all.length; i++) {
                if (classNo[classNo.length - 1] == 4) {
                    if (all[i][0] != classNo[i]) {
                        first = all[i][0];
                        List<OrderState> bookList = orderMapper.loadBook(appointTime, deviceId, first.toString());
                        for (OrderState orderState : bookList) {
                            sum = sum - orderState.getBook();
                        }
                        result.put("all", all);
                        result.put("first", first);
                        result.put("inventory", sum);
                        return result;

                    }
                } else if (classNo.length > 0) {
                    if (classNo[0] != 1) {
                        first = 1;
                    } else if (classNo.length > 1 && classNo[1] != 2) {
                        first = 2;
                    } else if (classNo.length > 2 && classNo[2] != 3) {
                        first = 3;
                    } else {
                        first = classNo.length + 1;
                    }

                    List<OrderState> bookList = orderMapper.loadBook(appointTime, deviceId, first.toString());
                    for (OrderState orderState : bookList) {
                        sum = sum - orderState.getBook();
                    }
                    result.put("all", all);
                    result.put("first", first);
                    result.put("inventory", sum);
                    return result;
                }


            }
        }
        if (classNo == null) {
            first = 1;
        }
        List<OrderState> bookList = orderMapper.loadBook(appointTime, deviceId, first.toString());
        for (OrderState orderState : bookList) {
            sum = sum - orderState.getBook();
        }
        result.put("all", all);
        result.put("first", first);
        result.put("inventory", sum);

        return result;
    }


    @Override
    public JSONObject selectClass(String appointTime, String deviceId, String classNo, Integer sum) {
        JSONObject result = new JSONObject();
        List<OrderState> bookList = orderMapper.loadBook(appointTime, deviceId, classNo);
        for (OrderState orderState : bookList) {
            sum = sum - orderState.getBook();
        }
        result.put("inventory", sum);
        return result;
    }

    @Override
    public JSONObject getClassRoom() {
        //获取教室
        JSONObject result = new JSONObject();
        List<Classroom> classroomState = orderMapper.getClassroomNo();
        if (classroomState.size() > 0) {
            result.put("classroom", classroomState);
        }
        return result;
    }


    @Override
    public BaseResult appointment(String deviceId, String authority, Integer classNo, Integer userId, String appointTime, Integer book, HttpServletRequest request) {
        Long result = 0L;
        OrderState orderState = new OrderState();
        orderState.setDeviceId(deviceId);
        orderState.setAuthority(authority);
        orderState.setUserId(userId);
        orderState.setAppointTime(appointTime);
        orderState.setBook(book);
        orderState.setDayTime(classNo);
        if (authority.equals("3")) {
            orderState.setDeleteId(-1);
        } else if (authority.equals("0")) {
            orderState.setDeleteId(0);
        }
        orderMapper.appointment(orderState);
        if (orderState.getId() > 0) {
            return BaseResult.success("success");
        }
        return BaseResult.error("error", "error");
    }


    @Override
    public BaseResult cancelAppoint(String orderId, Long deleteId) {
        Long result = orderMapper.updateState(orderId, deleteId);
        if (result > 0) {
            return BaseResult.success("success");
        }
        return BaseResult.error("error", "error");
    }

    @Override
    public PageResult getOrderList(String userId, Integer pageNo, Integer pageSize, String authority, String account) {
        PageHelper.startPage(pageNo, pageSize);
        Page<Base> page = orderMapper.getOrderList(userId, authority);
        PageResult pageResult = new PageResult(page);
        List<Base> baseList = pageResult.getList();
        for (Base base : baseList) {
            Integer sum = base.getTotal();
            JSONObject result = new JSONObject();
            List<OrderState> inventoryState = orderMapper.getBook(base.getDeviceId(), base.getAppointTime(), base.getDaytime(), authority);
            //获取库存
            for (OrderState orderState : inventoryState) {
                sum = sum - orderState.getBook();
            }
            base.setMaxBook(sum + Integer.parseInt(base.getBook()));
            if (base.getDaytime().equals("1")) {
                base.setCourse("第一节课-第二节课");
            }
            if (base.getDaytime().equals("2")) {
                base.setCourse("第三节课-第四节课");
            }
            if (base.getDaytime().equals("3")) {
                base.setCourse("第五节课-第六节课");
            }
            if (base.getDaytime().equals("4")) {
                base.setCourse("第七节课-第八节课");
            }
            if (base.getDeleteId() == 0) {
                if (authority.equals("0")) {
                    base.setStateInfo("预约中");
                } else {
                    base.setStateInfo("管理员同意预约");
                }
            } else if (base.getDeleteId() == -1) {
                base.setStateInfo("等待管理员同意");
            } else if (base.getDeleteId() > 0) {
                if (account.equals(base.getDeleteId().toString())) {
                    base.setStateInfo("本人已取消预约");
                } else {
                    base.setStateInfo("实验室管理员取消其预约");
                }
            }
        }
        return pageResult;
    }

    /**
     * 学生订单列表
     *
     * @param userId
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public PageResult getOrderListByStu(String userId, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        Page<Base> page = orderMapper.getOrderListByStu(userId);
        PageResult pageResult = new PageResult(page);
        List<Base> baseList = pageResult.getList();
        for (Base base : baseList) {
            Integer sum = base.getTotal();
            JSONObject result = new JSONObject();
            List<OrderState> inventoryState = new ArrayList<>();
            String classNoValue = "";
            if (Integer.parseInt(base.getOne()) > 0)
                inventoryState = orderMapper.getBookByOne(base.getDeviceId(), base.getAppointTime());
//            if(Integer.parseInt(base.getTwo())>0)
//                inventoryState=orderMapper.getBookByTwo(base.getDeviceId(),base.getAppointTime());
//            if(Integer.parseInt(base.getThree())>0)
//                inventoryState=orderMapper.getBookByThree(base.getDeviceId(),base.getAppointTime());
//            if(Integer.parseInt(base.getFour())>0)
//                inventoryState=orderMapper.getBookByFour(base.getDeviceId(),base.getAppointTime());
            //获取库存
            for (OrderState orderState : inventoryState) {
                sum = sum - orderState.getBook();
            }
            base.setMaxBook(sum);

            if (base.getState().equals("0")) {
                base.setStateInfo("预订成功");
            } else if (base.getState().equals("1")) {
                base.setStateInfo("管理员取消预订");
            } else if (base.getState().equals("2")) {
                base.setStateInfo("已取消");
            }
        }
        return pageResult;
    }

    @Override
    public BaseResult updateBook(String id, String book, String userId, String authority) {
        Integer result = 0;
        if (authority.equals("3")) {
            result = orderMapper.updateBook(id, book, -1L);
        } else if (authority.equals("3")) {
            result = orderMapper.updateBook(id, book, 0L);
        }
        if (result > 0) {
            return BaseResult.success("success");
        }
        return BaseResult.error("error", "error");
    }

    @Override
    public BaseResult updateState(String id, String deleteId) {
        Long result = orderMapper.updateState(id, Long.parseLong(deleteId));
        if (result > 0) {
            return BaseResult.success("success");
        }
        return BaseResult.error("error", "error");
    }

}