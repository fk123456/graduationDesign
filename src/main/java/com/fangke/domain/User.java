package com.fangke.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-15.
 */
public class User {
    //教师、管理员
    private Integer account;
    private String authority;
    private String title;
    private String office;


    private String categoryName;

    /**
     * 主键
     */
    private Long id;
    /**
     * 姓名
     */
    private String name;

    /**
     * 手机号
     */
    private String mobile;

    /**
     * 手机号
     */
    private String password;

    /**
     * 出生日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date bornDate;

    /**
     * 性别
     * MALE 男
     * FEMALE 女
     */
    private String sex;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 电子邮件
     */
    private String email;

    /**
     * 地址
     */
    private String address;

    /**
     * 头像
     */
    private String headPicture;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 学号
     */
    private String certificateId;

    /**
     * 状态
     * NORMAL 正常
     * UN_NORMAL 非正常
     */
    private String status;

    private String theClass;
    private String depart;
    private String grade;

    private String categoryId;

    public String getCategoryId() {
        return categoryId;
    }

    private Integer cardId;

    public Integer getAccount() {
        return account;
    }

    public void setAccount(Integer account) {
        this.account = account;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOffice() {
        return office;
    }

    public void setOffice(String office) {
        this.office = office;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getTheClass() {
        return theClass;
    }

    public void setTheClass(String theClass) {
        this.theClass = theClass;
    }

    public String getDepart() {
        return depart;
    }

    public void setDepart(String depart) {
        this.depart = depart;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }


    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date createDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBornDate() {
        return bornDate;
    }

    public void setBornDate(Date bornDate) {
        this.bornDate = bornDate;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHeadPicture() {
        return headPicture;
    }

    public void setHeadPicture(String headPicture) {
        this.headPicture = headPicture;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getCertificateId() {
        return certificateId;
    }

    public void setCertificateId(String certificateId) {
        this.certificateId = certificateId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


    public Integer getCardId() {
        return cardId;
    }


    public void setCardId(Integer cardId) {
        this.cardId = cardId;
    }


    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "User{" +
                "account=" + account +
                ", authority=" + authority +
                ", title='" + title + '\'' +
                ", office='" + office + '\'' +
                ", categoryName='" + categoryName + '\'' +
                ", id=" + id +
                ", name='" + name + '\'' +
                ", mobile='" + mobile + '\'' +
                ", password='" + password + '\'' +
                ", bornDate=" + bornDate +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", headPicture='" + headPicture + '\'' +
                ", nickName='" + nickName + '\'' +
                ", certificateId='" + certificateId + '\'' +
                ", status='" + status + '\'' +
                ", theClass='" + theClass + '\'' +
                ", depart='" + depart + '\'' +
                ", grade='" + grade + '\'' +
                ", categoryId='" + categoryId + '\'' +
                ", cardId=" + cardId +
                ", createDate=" + createDate +
                '}';
    }
}
