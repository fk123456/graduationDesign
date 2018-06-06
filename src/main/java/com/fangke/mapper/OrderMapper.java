package com.fangke.mapper;

import com.fangke.domain.Base;
import com.fangke.domain.Classroom;
import com.fangke.domain.Order;
import com.fangke.domain.OrderState;
import com.fangke.result.BaseResult;
import com.fangke.result.PageResult;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by ${fk}
 * on 12:43 2018/3/24
 */
@Mapper
public interface OrderMapper {
    /**
     * 查询订单信息
     *
     * @param userId 用户id
     * @return
     */
    Page<Order> findByOrder(@Param("userId") Long userId);

    /**
     * 更新订单
     *
     * @param order
     * @return
     */
    Integer updateByOrder(Order order);

    /**
     * 删除订单
     *
     * @param id
     * @return
     */
    Long deleteById(@Param("id") Long id);

    List<OrderState> getBook(@Param("deviceId") String deviceId, @Param("appointTime") String appointTime, @Param("daytime") String daytime, @Param("authority") String authority);

    List<OrderState> getBookByOne(@Param("deviceId") String deviceId, @Param("appointTime") String appointTime);

    List<OrderState> getBookByTwo(@Param("deviceId") String deviceId, @Param("appointTime") String appointTime);

    List<OrderState> getBookByThree(@Param("deviceId") String deviceId, @Param("appointTime") String appointTime);

    List<OrderState> getBookByFour(@Param("deviceId") String deviceId, @Param("appointTime") String appointTime);

    List<Classroom> getClassroomNo();

    List<OrderState> loadClass(@Param("appointTime") String appointTime, @Param("deviceId") String deviceId);

    List<OrderState> loadBook(@Param("appointTime") String appointTime, @Param("deviceId") String deviceId, @Param("classNo") String classNo);

    void appointment(@Param("orderState") OrderState orderState);

    Long cancelAppoint(@Param("orderId") String orderId);


    Page<Base> getOrderList(@Param("userId") String userId, @Param("authority") String authority);

    Integer updateBook(@Param("id") String id, @Param("book") String book, @Param("deleteId") Long deleteId);

    Long updateState(@Param("id") String id, @Param("deleteId") Long deleteId);


    /**
     * 学生订单列表
     *
     * @param userId
     * @return
     */
    Page<Base> getOrderListByStu(@Param("userId") String userId);
}
