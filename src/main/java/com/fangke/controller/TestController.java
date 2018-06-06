package com.fangke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ${fk}
 * on 20:12 2018/3/12
 */
@Controller
public class TestController {

    @RequestMapping("/about")
    public String about(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "about";
    }

    @RequestMapping("/stuTeaclassShow")
    public String stuTeaclassShow(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "stuTeaclassShow";
    }

    @RequestMapping("/contact")
    public String contact(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "contact";
    }

    @RequestMapping("/hot_pro")
    public String hot_pro(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "hot_pro";
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "index";
    }

    @RequestMapping("/join")
    public String join(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "join";
    }

    @RequestMapping("/message")
    public String news(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "message";
    }

    @RequestMapping("/systemManager")
    public String systemManager(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "systemManager";
    }

    @RequestMapping("/pro_a")
    public String pro_a(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "pro_a";
    }

    @RequestMapping("/pro_d")
    public String pro_d(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "pro_d";
    }

    @RequestMapping("/product")
    public String product(@RequestParam(value = "categoryId", defaultValue = "") String categoryId,
                          @RequestParam(value = "deviceId", defaultValue = "") String deviceId,
                          @RequestParam(value = "cateName", defaultValue = "") String cateName,
                          HttpServletRequest request) {
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("deviceId", deviceId);
        request.setAttribute("cateName", cateName);
        return "product";
    }

    @RequestMapping("/pro_c")
    public String pro_c(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "pro_c";
    }


    @RequestMapping("/userManage")
    public String service(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "userManage";
    }

    @RequestMapping("/classShow")
    public String classShow(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "classShow";
    }

    @RequestMapping("/deviceManage")
    public String my(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "deviceManage";
    }

    @RequestMapping("/orderList")
    public String orderList(HttpServletRequest request, @RequestParam(value = "num", defaultValue = "") String num) {
        request.setAttribute("num", num);
        return "orderList";
    }
}
