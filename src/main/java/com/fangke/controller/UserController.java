package com.fangke.controller;

import com.fangke.domain.Base;
import com.fangke.domain.User;
import com.fangke.domain.message;
import com.fangke.result.BaseResult;
import com.fangke.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-15.
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 注册
     *
     * @param user 用户实体
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST, consumes = "application/json")
    public Map<String, Object> register(@RequestBody User user) throws Exception {
        BaseResult result = userService.register(user);
        Map map = new HashMap();
        map.put("info", result);
        return map;
    }

    /**
     * 登录
     *
     * @param mobile   手机号
     * @param password 密码
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    public Map<String, Object> login(@RequestParam(value = "mobile") String mobile,
                                     @RequestParam(value = "password") String password,
                                     @RequestParam(value = "authority") String authority,
                                     HttpServletRequest request) throws Exception {
        BaseResult result = userService.login(mobile, password, request, authority);
        Map map = new HashMap();
        map.put("info", result);
        return map;
    }

    /**
     * 修改个人信息
     *
     * @param user 用户
     * @return
     */
    @PostMapping(value = "/modifyUserInfo")
    public BaseResult modifyUserInfo(@RequestBody User user) {
        return userService.modifyUserInfo(user);
    }

    /**
     * 用户注销
     *
     * @param mobile 手机号
     * @return
     */
    @GetMapping(value = "logout")
    public BaseResult logout(@RequestParam(value = "mobile") String mobile,
                             HttpServletRequest request) {
        return userService.logout(mobile, request);
    }

    @GetMapping(value = "getUserInfo")
    public BaseResult getUserInfo(String categoryId) {
        return userService.getUserInfo(categoryId);
    }

    /**
     * 改变老师和管理员的状态
     *
     * @param userId
     * @param status
     * @return
     */
    @GetMapping(value = "changeUserState")
    public BaseResult changeUserStatus(@RequestParam("userId") String userId, @RequestParam("status") String status) {
        return userService.changeUserStatus(userId, status);
    }

    /**
     * 改变学生的状态
     *
     * @param userId
     * @param status
     * @return
     */
    @GetMapping(value = "changeUserStateOnStudent")
    public BaseResult changeUserStateOnStudent(@RequestParam("userId") String userId, @RequestParam("status") String status) {
        return userService.changeUserStateOnStudent(userId, status);
    }

    /**
     * 系统管理员添加用户
     *
     * @param user 用户
     * @return
     */
    @PostMapping(value = "/addUser")
    public BaseResult addUser(@RequestBody User user) throws Exception {
        return userService.addUser(user);
    }

    /**
     * 获得所有实验室管理员和老师列表
     *
     * @return
     */
    @GetMapping(value = "/getAllUser")
    public BaseResult getAllUser() {
        return userService.getAllUser();
    }

    /**
     * 获得所有订单(按星期显示)
     *
     * @return
     */
    @GetMapping(value = "/getAllOrder")
    public BaseResult getAllOrder(@RequestParam(value = "categoryId") Integer categoryId, @RequestParam(value = "deviceId") Integer deviceId) {
        return userService.getAllOrder(categoryId, deviceId);
    }

    /**
     * 获得老师  学生课表(按星期显示)
     *
     * @return
     */
    @GetMapping(value = "/getTeacherStuClass")
    public BaseResult getTeacherStuClass(@RequestParam(value = "categoryId") Integer categoryId, @RequestParam(value = "userId") Integer userId, @RequestParam(value = "authority") String authority) {
        return userService.getTeacherStuClass(categoryId, userId, authority);
    }

    /**
     * 根据设备id来查所有预约的设备
     *
     * @param categoryId
     * @return
     */
    @GetMapping(value = "/getAllByDeviceId")
    public BaseResult getAllByDeviceId(@RequestParam(value = "categoryId") Long categoryId) {
        return userService.getAllByDeviceId(categoryId);
    }
}
