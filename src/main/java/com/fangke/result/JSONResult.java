package com.fangke.result;


import com.alibaba.fastjson.JSONObject;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-15.
 */
public class JSONResult {
    public static String fillResultString(Integer status, String message, Object result) {
        JSONObject jsonObject = new JSONObject() {{
            put("status", status);
            put("message", message);
            put("result", result);
        }};

        return jsonObject.toString();
    }
}
