package com.fangke.domain;

public class message {

    private String userId;
    private String createTime;
    private String messageType;
    private String isread;
    private String orderstateId;

    public void setOrderstateId(String orderstateId) {
        this.orderstateId = orderstateId;
    }

    public String getMessageType() {
        return messageType;
    }

    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getIsread() {
        return isread;
    }

    public void setIsread(String isread) {
        this.isread = isread;
    }


    public String getRead() {
        return isread;
    }

    public void setRead(String read) {
        this.isread = read;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }


}
