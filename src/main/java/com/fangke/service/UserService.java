package com.fangke.service;


import com.fangke.domain.Base;
import com.fangke.domain.User;
import com.fangke.domain.message;
import com.fangke.result.BaseResult;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-15.
 */
public interface UserService {

    /**
     * 注册
     *
     * @param user 用户实体
     * @return
     */
    BaseResult register(User user) throws Exception;

    /**
     * 登录
     *
     * @param mobile   手机号
     * @param password 密码
     * @return
     */
    BaseResult login(String mobile, String password, HttpServletRequest request, String authority) throws Exception;

    /**
     * 修改个人信息
     *
     * @param user 用户
     * @return
     */
    BaseResult modifyUserInfo(User user);

    /**
     * 注销
     *
     * @param mobile 手机号
     * @return
     */
    BaseResult logout(String mobile, HttpServletRequest request);

    BaseResult getUserInfo(String categoryId);

    BaseResult changeUserStatus(String userId, String status);

    BaseResult changeIsRead(String userId);

    List<Base> getMessage(String userId);

    List<message> getIsRead(String userId);

    /**
     * 系统管理员添加用户
     *
     * @param user
     * @return
     */
    BaseResult addUser(User user) throws Exception;

    /**
     * 获得所有实验室管理员和老师列表
     *
     * @return
     */
    BaseResult getAllUser();

    /**
     * 改变学生的状态
     *
     * @param userId
     * @param status
     * @return
     */
    BaseResult changeUserStateOnStudent(String userId, String status);

    /**
     * 获得所有订单(按星期显示)
     *
     * @return
     */
    BaseResult getAllOrder(Integer categoryId, Integer deviceId);

    /**
     * 根据设备id来查所有预约的设备
     *
     * @param categoryId
     * @return
     */
    BaseResult getAllByDeviceId(Long categoryId);

    BaseResult getTeacherStuClass(Integer categoryId, Integer userId, String authority);
}
