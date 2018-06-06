package com.fangke.domain;

import java.util.Date;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-19.
 */
public class CategoryDevice {

    /**
     * 主键
     */
    private Long id;

    /**
     * 类目id
     */
    private Long categoryId;

    /**
     * 设备id
     */
    private Long deviceId;

    /**
     * 创建时间
     */
    private Date createDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Long deviceId) {
        this.deviceId = deviceId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "CategoryDevice{" +
                "id=" + id +
                ", categoryId=" + categoryId +
                ", deviceId=" + deviceId +
                ", createDate=" + createDate +
                '}';
    }
}
