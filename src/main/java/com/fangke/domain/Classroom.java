package com.fangke.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-19.
 */
public class Classroom {

    /**
     * 主键
     */
    private Long id;

    /**
     * 教室号
     */
    private Integer classroomNo;

    /**
     * 仪器id
     */
    private Long deviceId;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date createDate;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date updateDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getClassroomNo() {
        return classroomNo;
    }

    public void setClassroomNo(Integer classroomNo) {
        this.classroomNo = classroomNo;
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

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    @Override
    public String toString() {
        return "Classroom{" +
                "id=" + id +
                ", classroomNo=" + classroomNo +
                ", deviceId=" + deviceId +
                ", createDate=" + createDate +
                ", updateDate=" + updateDate +
                '}';
    }
}
