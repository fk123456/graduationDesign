package com.fangke.mapper;

import com.fangke.domain.Base;
import com.fangke.domain.User;
import com.fangke.domain.message;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-15.
 */
@Mapper
public interface UserMapper {

    /**
     * 判断昵称是否存在
     *
     * @param nickName 昵称
     * @return
     */
    Integer findByNickName(@Param("nickName") String nickName);

    /**
     * 判断手机号是否存在
     *
     * @param certificateId 手机号
     * @return
     */
    Integer findByCertificateId(@Param("certificateId") String certificateId, @Param("cardId") Integer cardId, @Param("mobile") String mobile, @Param("name") String name, @Param("status") String status);

    /**
     * 注册
     *
     * @param user 用户实体
     * @return
     */
    Integer register(User user);

    /**
     * 登录
     *
     * @param mobile   手机号
     * @param password 加密密码
     * @return
     */
    List<User> stuLogin(@Param("mobile") String mobile,
                        @Param("password") String password);

    List<User> manageLogin(@Param("account") String mobile,
                           @Param("password") String password,
                           @Param("authority") String authority);

    /**
     * 修改个人信息
     *
     * @param user 用户
     * @return
     */
    Integer modifyUserInfo(User user);


    List<User> getUserInfo(@Param("categoryId") String categoryId);

    /**
     * 改变老师和管理员的状态
     *
     * @param userId
     * @param status
     * @return
     */
    Long changeUserStatus(@Param("userId") String userId, @Param("status") String status);


    List<Base> getMessage(@Param("userId") String userId);

    List<message> getIsRead(@Param("userId") String userId);

    Long changeIsRead(@Param("userId") String userId);

    Long message(@Param("userId") String userId, @Param("messageType") String messageType, @Param("createTime") String createTime, @Param("isread") String isread, @Param("orderstateId") String orderstateId);

    User findByCardId(@Param("cardId") Integer cardId);

    /**
     * 系统管理员添加用户
     *
     * @param user
     * @return
     */
    Integer addUser(User user);

    /**
     * 获得所有实验室管理员和老师列表
     *
     * @return
     */
    List<User> getAllUser();

    /**
     * 改变学生的状态
     *
     * @param userId
     * @param status
     * @return
     */
    Long changeUserStateOnStudent(@Param("userId") String userId, @Param("status") String status);

    /**
     * 获得所有课程安排订单(按星期显示)
     *
     * @return
     */
    List<Base> getAllOrderByClass(@Param("str") String str, @Param("categoryId") Integer categoryId, @Param("deviceId") Integer deviceId);

    List<Base> getOrderClassByAdmin(@Param("str") String str, @Param("categoryId") Integer categoryId, @Param("deviceId") Integer deviceId);

    List<Base> getOrderClassByStu(@Param("str") String str, @Param("categoryId") Integer categoryId, @Param("deviceId") Integer deviceId);

    List<Base> getTeacherClass(@Param("str") String str, @Param("userId") Integer userId);

    List<Base> getStuClass(@Param("str") String str, @Param("userId") Integer userId);

    List<Base> getStuOrder(@Param("str") String str, @Param("userId") Integer userId);

    /**
     * 获得所有预约订单(按星期显示)
     *
     * @return
     */
    Base getAllOrderByAppoint();

    /**
     * 根据设备id来查所有预约的设备
     *
     * @param categoryId
     * @return
     */
    List<Base> getAllByDeviceId(@Param("categoryId") Long categoryId);
}
