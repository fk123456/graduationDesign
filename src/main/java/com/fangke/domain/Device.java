package com.fangke.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-17.
 */
public class Device {

    /**
     * 主键
     */
    private Long id;
    private String classroomNo;
    private String show;


    /**
     * 类目id
     */
    private Long categoryId;

    private String cateName;

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    /**
     * 商品名字
     */
    private String deviceName;

    /**
     * 商品描述
     */
    private String description;

    /**
     * 是否预约
     * APPOINTMENT 已预约
     * UN_APPOINTMENT  未预约
     */
    private String appointment;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date createDate;

    /**
     * 最后更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GTM+8")
    private Date lastUpdateDate;

    /**
     * 浏览量
     */
    private Integer visitTotal;

    /**
     * 商品编码
     */
    private String deviceNo;

    /**
     * 主图地址
     */
    private String mainImageUrl;

    /**
     * 状态
     * NORMAL 正常
     * UN_NORMAL 非正常
     */
    private String status;

    /**
     * 商品描述富文本
     */
    private String richContent;


    private String categoryName;

    private String seo;

    private Integer total;


    public String getShow() {
        return show;
    }

    public void setShow(String show) {
        this.show = show;
    }

    public String getClassroomNo() {
        return classroomNo;
    }

    public void setClassroomNo(String classroomNo) {
        this.classroomNo = classroomNo;
    }


    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    /**
     * 搜索字段
     */


    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

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

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAppointment() {
        return appointment;
    }

    public void setAppointment(String appointment) {
        this.appointment = appointment;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public Integer getVisitTotal() {
        return visitTotal;
    }

    public void setVisitTotal(Integer visitTotal) {
        this.visitTotal = visitTotal;
    }

    public String getDeviceNo() {
        return deviceNo;
    }

    public void setDeviceNo(String deviceNo) {
        this.deviceNo = deviceNo;
    }

    public String getMainImageUrl() {
        return mainImageUrl;
    }

    public void setMainImageUrl(String mainImageUrl) {
        this.mainImageUrl = mainImageUrl;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRichContent() {
        return richContent;
    }

    public void setRichContent(String richContent) {
        this.richContent = richContent;
    }

    public String getSeo() {
        return seo;
    }

    public void setSeo(String seo) {
        this.seo = seo;
    }

    @Override
    public String toString() {
        return "Device{" +
                "id=" + id +
                ", categoryId=" + categoryId +
                ", deviceName='" + deviceName + '\'' +
                ", description='" + description + '\'' +
                ", appointment='" + appointment + '\'' +
                ", createDate=" + createDate +
                ", lastUpdateDate=" + lastUpdateDate +
                ", visitTotal=" + visitTotal +
                ", deviceNo='" + deviceNo + '\'' +
                ", mainImageUrl='" + mainImageUrl + '\'' +
                ", status='" + status + '\'' +
                ", richContent='" + richContent + '\'' +
                ", seo='" + seo + '\'' +
                '}';
    }
}
