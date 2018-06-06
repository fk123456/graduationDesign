package com.fangke.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.fangke.Utils.EncryptUtil;
import com.fangke.constant.Constant;
import com.fangke.domain.Base;
import com.fangke.domain.Order;
import com.fangke.domain.User;
import com.fangke.domain.message;
import com.fangke.mapper.UserMapper;
import com.fangke.result.BaseResult;
import com.fangke.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;


/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-15.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 注册
     *
     * @param user 用户实体
     * @return
     */
    @Override
    public BaseResult register(User user) throws Exception {
        if (user.getCertificateId().length() < Constant.MOBILE_LENGTH) {
            return BaseResult.error("ERROR", "学号不能小于15位");
        }
        if (StringUtils.isEmpty(user.getPassword())) {
            return BaseResult.error("ERROR", "密码不能为空");
        }
        if (StringUtils.isEmpty(user.getName())) {
            return BaseResult.error("ERROR", "姓名不能为空");
        }

        if (user.getMobile().length() < Constant.MOBILE_LENGTH2) {
            return BaseResult.error("ERROR", "手机号不能小于11位");
        }

        if (user.getPassword().length() < Constant.PASSWORD_MIN_LENGTH) {
            return BaseResult.error("ERROR", "密码不能小于6位");
        }
        //校验
        Integer certificateId = userMapper.findByCertificateId(user.getCertificateId(), user.getCardId(), user.getMobile(), user.getName(), "UN_NORMAL");
        if (certificateId <= 0) {
            Integer value = userMapper.findByCertificateId(user.getCertificateId(), user.getCardId(), user.getMobile(), user.getName(), "NORMAL");
            if (value > 0) {
                return BaseResult.error("ERROR", "您已注册!");
            }
            return BaseResult.error("ERROR", "信息匹配不正确,请联系实验室管理员!");
        }

        //密码加密
        String encryptPassword = EncryptUtil.encryptMD5(user.getPassword());
        user.setPassword(encryptPassword);
        Integer result = userMapper.register(user);
        if (result < 0) {
            return BaseResult.error("ERROR", "注册失败");
        }
        return BaseResult.success("注册成功");

    }

    /**
     * 登录
     *
     * @param mobile   手机号
     * @param password 密码
     * @return
     */
    @Override
    public BaseResult login(String mobile, String password, HttpServletRequest request, String authority) throws Exception {

        if (StringUtils.isEmpty(mobile) || StringUtils.isEmpty(password)) {
            return BaseResult.error("ERROR", "学号或密码不能为空");
        }
        //判断手机号位数
        if (authority.equals("3")) {
            if (mobile.length() != Constant.MOBILE_LENGTH) {
                return BaseResult.error("ERROR", "学号长度不对");
            }
        } else {
            if (mobile.length() != Constant.PASSWORD_MIN_LENGTH) {
                return BaseResult.error("ERROR", "账号长度不对");
            }
        }

        //加密登录
        String encryptPassword = EncryptUtil.encryptMD5(password);

        //学生登录
        User user = new User();
        List<User> userList = new ArrayList<>();
        if (authority.equals("3")) {
            userList = userMapper.stuLogin(mobile, encryptPassword);
        } else {
            userList = userMapper.manageLogin(mobile, encryptPassword, authority);
        }

        if (userList.size() == 0) {
            return BaseResult.error("ERROR", "登录失败");
        }
        user = userList.get(0);
        HttpSession session = request.getSession();
        session.setAttribute("loginName", user.getName());
        session.setAttribute("loginId", user.getId());
        session.setAttribute("loginAuthority", authority);
        session.setAttribute("loginCategoryId", user.getCategoryId());
        session.setAttribute("loginAccount", mobile);

        //设置redis
        //启动 redis-server.exe redis.windows.conf
        /*redisTemplate.opsForValue().set("Login" + user.getMobile(), user.toString(), 30, TimeUnit.MINUTES);*/
        return BaseResult.success(user);
    }

    /**
     * 修改个人信息
     *
     * @param user 用户
     * @return
     */
    @Override
    public BaseResult modifyUserInfo(User user) {
        if (user.getId() == null) {
            return BaseResult.error("ERROR", "id不能为空");
        }
        Integer result = userMapper.modifyUserInfo(user);
        if (result < 0) {
            return BaseResult.error("ERROR", "修改个人信息出错");
        }
        return BaseResult.success("修改个人信息成功");
    }

    /**
     * 注销
     *
     * @param mobile 手机号
     * @return
     */
    @Override
    public BaseResult logout(String mobile, HttpServletRequest request) {
        //从缓存区移除当前账号
        /*Boolean result = redisTemplate.hasKey("Login" + mobile);
        if (result) {
            redisTemplate.delete("Login" + mobile);
            return BaseResult.success("注销成功");
        }*/
        HttpSession session = request.getSession();
        session.invalidate();
        return BaseResult.success("注销成功");
    }

    @Override
    public BaseResult getUserInfo(String categoryId) {

        List<User> userList = userMapper.getUserInfo(categoryId);
        if (userList.size() > 0) {
            return BaseResult.success(userList);
        } else {
            return BaseResult.error("error", "error");
        }
    }

    /**
     * 改变老师和管理员的状态
     *
     * @param userId
     * @param status
     * @return
     */
    @Override
    public BaseResult changeUserStatus(String userId, String status) {
        Long result = 0L;
        result = userMapper.changeUserStatus(userId, status);
        if (result > 0) {
            return BaseResult.success("success");
        }
        return BaseResult.error("error", "error");
    }

    @Override
    public BaseResult changeIsRead(String userId) {
        Long result = 0L;
        result = userMapper.changeIsRead(userId);
        if (result > 0) {
            return BaseResult.success("success");
        }
        return BaseResult.error("error", "error");
    }

    @Override
    public List<Base> getMessage(String userId) {
        List<Base> messageList = userMapper.getMessage(userId);

        for (Base base : messageList) {

            if (base.getMessageType().equals("1")) {
                String info = "";
                if (Long.parseLong(base.getOne()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getTwo()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getThree()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getFour()) > 0) {
                    info = "第一节课-第二节课";
                }
                base.setMessage(base.getCreateTime().substring(0, 16) + "   " + "<br>你成功预约了" + base.getBook() + "台" + base.getDeviceName() + "<br>预约时间：" + base.getAppointTime() + " " + info + "<br>地点：" + base.getClassroom() + "教室");
            } else if (base.getMessageType().equals("0")) {
                String info = "";
                if (Long.parseLong(base.getOne()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getTwo()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getThree()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getFour()) > 0) {
                    info = "第一节课-第二节课";
                }
                base.setMessage(base.getCreateTime().substring(0, 16) + "   " + "<br>管理员取消了你预约的" + base.getBook() + "台" + base.getDeviceName() + "<br>预约时间：" + base.getAppointTime() + " " + info + "<br>地点：" + base.getClassroom() + "教室");
            } else if (base.getMessageType().equals("3")) {
                String info = "";
                if (Long.parseLong(base.getOne()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getTwo()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getThree()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getFour()) > 0) {
                    info = "第一节课-第二节课";
                }
                base.setMessage(base.getCreateTime().substring(0, 16) + "   " + "<br>你修改为" + base.getBook() + "台" + base.getDeviceName() + "<br>预约时间：" + base.getAppointTime() + " " + info + "<br>地点：" + base.getClassroom() + "教室");
            } else if (base.getMessageType().equals("4")) {
                String info = "";
                if (Long.parseLong(base.getOne()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getTwo()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getThree()) > 0) {
                    info = "第一节课-第二节课";
                }
                if (Long.parseLong(base.getFour()) > 0) {
                    info = "第一节课-第二节课";
                }
                base.setMessage(base.getCreateTime().substring(0, 16) + "   " + "<br>你取消了你预约的" + base.getBook() + "台" + base.getDeviceName() + "<br>预约时间：" + base.getAppointTime() + " " + info + "<br>地点：" + base.getClassroom() + "教室");
            } else if (base.getMessageType().equals("2")) {
                base.setMessage(base.getCreateTime().substring(0, 16) + "   " + "<br>预约失败");
            }
        }
        return messageList;
    }

    @Override
    public List<message> getIsRead(String userId) {
        List<message> messageList = userMapper.getIsRead(userId);
        return messageList;
    }

    /**
     * 系统管理员添加用户
     *
     * @param user
     * @return
     */
    @Override
    public BaseResult addUser(User user) throws Exception {
        //密码加密
        String encryptPassword = EncryptUtil.encryptMD5(user.getPassword());
        user.setPassword(encryptPassword);
        Integer result = userMapper.addUser(user);
        if (result < 0) {
            return BaseResult.error("ERROR", "添加失败");
        }
        return BaseResult.success("添加用户成功!");
    }

    /**
     * 获得所有实验室管理员和老师列表
     *
     * @return
     */
    @Override
    public BaseResult getAllUser() {
        List<User> list = userMapper.getAllUser();
        if (list.size() > 0) {
            return BaseResult.success(list);
        }
        return BaseResult.error("ERROR", "获取列表出错");
    }

    /**
     * 改变学生的状态
     *
     * @param userId
     * @param status
     * @return
     */
    @Override
    public BaseResult changeUserStateOnStudent(String userId, String status) {
        Long result = 0L;
        result = userMapper.changeUserStateOnStudent(userId, status);
        if (result > 0) {
            return BaseResult.success("success");
        }
        return BaseResult.error("error", "error");
    }

    /**
     * 获得所有订单(按星期显示)
     *
     * @return
     */
    @Override
    public BaseResult getAllOrder(Integer categoryId, Integer deviceId) {
        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar cal = Calendar.getInstance();
        Date date = new Date();
        cal.setTime(date);
        int week = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (week < 0) {
            week = 0;
        }
        List<Base> result = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String str = sdf.format(date.getTime());

        for (int i = 0; i < 7; i++) {
            Base baseResult = new Base();
            cal.setTime(date);
            if (i == 0) {
                cal.add(Calendar.DAY_OF_MONTH, 0);
            } else {
                cal.add(Calendar.DAY_OF_MONTH, 1);
            }
            date = cal.getTime();
            cal.setTime(date);
            week = cal.get(Calendar.DAY_OF_WEEK) - 1;
            if (week < 0) {
                week = 0;
            }
            String weekValue = "";
            switch (week) {
                case 1:
                    weekValue = "<br>星期一";
                    break;
                case 2:
                    weekValue = "<br>星期二";
                    break;
                case 3:
                    weekValue = "<br>星期三";
                    break;
                case 4:
                    weekValue = "<br>星期四";
                    break;
                case 5:
                    weekValue = "<br>星期五";
                    break;
                case 6:
                    weekValue = "<br>星期六";
                    break;
                case 0:
                    weekValue = "<br>星期日";
                    break;
            }
            str = sdf.format(date.getTime());
            baseResult.setTime(str);
            baseResult.setWeek(weekValue);
            List<Base> order = userMapper.getAllOrderByClass(str, categoryId, deviceId);
            for (Base base : order) {
                switch (base.getDaytime()) {
                    case "1":
                        baseResult.setOne("<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "）<br>");
                        break;
                    case "2":
                        baseResult.setTwo("<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "）<br>");
                        break;
                    case "3":
                        baseResult.setThree("<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "）<br>");
                        break;
                    case "4":
                        baseResult.setFour("<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "）<br>");
                        break;
                }
            }
            List<Base> admin = userMapper.getOrderClassByAdmin(str, categoryId, deviceId);
            List<Base> stu = userMapper.getOrderClassByStu(str, categoryId, deviceId);
            String one = "";
            String two = "";
            String three = "";
            String four = "";
            for (Base adm : admin) {
                switch (adm.getDaytime()) {
                    case "1":
                        one += "<b>管理员预约</b><br>(实验室管理员：" + adm.getName() + "，仪器：" + adm.getDeviceName() + "，预约数量：" + adm.getBook() + "）<br>";
                        break;
                    case "2":
                        two += "<b>管理员预约</b><br>(实验室管理员：" + adm.getName() + "，仪器：" + adm.getDeviceName() + "，预约数量：" + adm.getBook() + "）<br>";
                        break;
                    case "3":
                        three += "<b>管理员预约</b><br>(实验室管理员：" + adm.getName() + "，仪器：" + adm.getDeviceName() + "，预约数量：" + adm.getBook() + "）<br>";
                        break;
                    case "4":
                        four += "<b>管理员预约</b><br>(实验室管理员：" + adm.getName() + "，仪器：" + adm.getDeviceName() + "，预约数量：" + adm.getBook() + "）<br>";
                        break;
                }
            }
            for (Base st : stu) {
                switch (st.getDaytime()) {
                    case "1":
                        one += "<b>学生预约</b><br>(学生：" + st.getName() + "，仪器：" + st.getDeviceName() + "，实验室：" + st.getClassroomNo() + "，预约数量：" + st.getBook() + "）<br>";
                        break;
                    case "2":
                        two += "<b>学生预约</b><br>(学生：" + st.getName() + "，仪器：" + st.getDeviceName() + "，实验室：" + st.getClassroomNo() + "，预约数量：" + st.getBook() + "）<br>";
                        break;
                    case "3":
                        three += "<b>学生预约</b><br>(学生：" + st.getName() + "，仪器：" + st.getDeviceName() + "，实验室：" + st.getClassroomNo() + "，预约数量：" + st.getBook() + "）<br>";
                        break;
                    case "4":
                        four += "<b>学生预约</b><br>(学生：" + st.getName() + "，仪器：" + st.getDeviceName() + "，实验室：" + st.getClassroomNo() + "，预约数量：" + st.getBook() + "）<br>";
                        break;
                }
            }
            if (one != "") {
                baseResult.setOne(one);
            }
            if (two != "") {
                baseResult.setTwo(two);
            }
            if (three != "") {
                baseResult.setThree(three);
            }
            if (four != "") {
                baseResult.setFour(four);
            }
            result.add(baseResult);
        }
        return BaseResult.success(result);
    }

    /**
     * 根据设备id来查所有预约的设备
     *
     * @param categoryId
     * @return
     */
    @Override
    public BaseResult getAllByDeviceId(Long categoryId) {
        List<Base> list = userMapper.getAllByDeviceId(categoryId);
        return BaseResult.success(list);
    }

    @Override
    public BaseResult getTeacherStuClass(Integer categoryId, Integer userId, String authority) {
        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar cal = Calendar.getInstance();
        Date date = new Date();
        cal.setTime(date);
        int week = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (week < 0) {
            week = 0;
        }
        List<Base> result = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String str = sdf.format(date.getTime());
        if (authority.equals("1")) {//教师
            for (int i = 0; i < 7; i++) {
                Base baseResult = new Base();
                cal.setTime(date);
                if (i == 0) {
                    cal.add(Calendar.DAY_OF_MONTH, 0);
                } else {
                    cal.add(Calendar.DAY_OF_MONTH, 1);
                }
                date = cal.getTime();
                cal.setTime(date);
                week = cal.get(Calendar.DAY_OF_WEEK) - 1;
                if (week < 0) {
                    week = 0;
                }
                String weekValue = "";
                switch (week) {
                    case 1:
                        weekValue = "<br>星期一";
                        break;
                    case 2:
                        weekValue = "<br>星期二";
                        break;
                    case 3:
                        weekValue = "<br>星期三";
                        break;
                    case 4:
                        weekValue = "<br>星期四";
                        break;
                    case 5:
                        weekValue = "<br>星期五";
                        break;
                    case 6:
                        weekValue = "<br>星期六";
                        break;
                    case 0:
                        weekValue = "<br>星期日";
                        break;
                }
                str = sdf.format(date.getTime());
                baseResult.setTime(str);
                baseResult.setWeek(weekValue);
                List<Base> order = userMapper.getTeacherClass(str, userId);
                for (Base base : order) {
                    switch (base.getDaytime()) {
                        case "1":
                            baseResult.setOne("<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "<br>");
                            break;
                        case "2":
                            baseResult.setTwo("<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "<br>");
                            break;
                        case "3":
                            baseResult.setThree("<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "<br>");
                            break;
                        case "4":
                            baseResult.setFour("<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "<br>");
                            break;
                    }
                }
                result.add(baseResult);
            }
        } else if (authority.equals("3")) {
            for (int i = 0; i < 7; i++) {
                Base baseResult = new Base();
                cal.setTime(date);
                if (i == 0) {
                    cal.add(Calendar.DAY_OF_MONTH, 0);
                } else {
                    cal.add(Calendar.DAY_OF_MONTH, 1);
                }
                date = cal.getTime();
                cal.setTime(date);
                week = cal.get(Calendar.DAY_OF_WEEK) - 1;
                if (week < 0) {
                    week = 0;
                }
                String weekValue = "";
                switch (week) {
                    case 1:
                        weekValue = "<br>星期一";
                        break;
                    case 2:
                        weekValue = "<br>星期二";
                        break;
                    case 3:
                        weekValue = "<br>星期三";
                        break;
                    case 4:
                        weekValue = "<br>星期四";
                        break;
                    case 5:
                        weekValue = "<br>星期五";
                        break;
                    case 6:
                        weekValue = "<br>星期六";
                        break;
                    case 0:
                        weekValue = "<br>星期日";
                        break;
                }
                str = sdf.format(date.getTime());
                baseResult.setTime(str);
                baseResult.setWeek(weekValue);
                List<Base> order = userMapper.getStuClass(str, userId);
                String one = "";
                String two = "";
                String three = "";
                String four = "";
                for (Base base : order) {
                    switch (base.getDaytime()) {
                        case "1":
                            one += "<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "）<br>";
                            break;
                        case "2":
                            two += "<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "）<br>";
                            break;
                        case "3":
                            three += "<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "）<br>";
                            break;
                        case "4":
                            four += "<b>教学安排</b><br>（教师：" + base.getName() + "，仪器：" + base.getDeviceName() + "，实验室：" + base.getClassroomNo() + "，预约数量：" + base.getBook() + "）<br>";
                            break;
                    }
                }
                List<Base> stu = userMapper.getStuOrder(str, userId);
                for (Base st : stu) {
                    switch (st.getDaytime()) {
                        case "1":
                            one += "<b>学生预约</b><br>（学生：" + st.getName() + "，仪器：" + st.getDeviceName() + "，实验室：" + st.getClassroomNo() + "，预约数量：" + st.getBook() + "）<br>";
                            break;
                        case "2":
                            two += "<b>学生预约</b><br>（学生：" + st.getName() + "，仪器：" + st.getDeviceName() + "，实验室：" + st.getClassroomNo() + "，预约数量：" + st.getBook() + "）<br>";
                            break;
                        case "3":
                            three += "<b>学生预约</b><br>（学生：" + st.getName() + "，仪器：" + st.getDeviceName() + "，实验室：" + st.getClassroomNo() + "，预约数量：" + st.getBook() + "）<br>";
                            break;
                        case "4":
                            four += "<b>学生预约</b><br>（学生：" + st.getName() + "，仪器：" + st.getDeviceName() + "，实验室：" + st.getClassroomNo() + "，预约数量：" + st.getBook() + "）<br>";
                            break;
                    }
                }
                if (one != "") {
                    baseResult.setOne(one);
                }
                if (two != "") {
                    baseResult.setTwo(two);
                }
                if (three != "") {
                    baseResult.setThree(three);
                }
                if (four != "") {
                    baseResult.setFour(four);
                }
                result.add(baseResult);
            }
        }

        return BaseResult.success(result);
    }
}
