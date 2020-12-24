package com.zhf.entity;

public class Message {

    private Integer id; // 编号
    private String content; // 评论内容
    private String date; // 评论日期
    private int state; // 评论审核：1.通过 0.不通过
    private String commentName; // 评论人的名字
    private String email; // 评论人的邮件
    private String sizeUrl; // 评论人的个人站点

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getCommentName() {
        return commentName;
    }

    public void setCommentName(String commentName) {
        this.commentName = commentName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSizeUrl() {
        return sizeUrl;
    }

    public void setSizeUrl(String sizeUrl) {
        this.sizeUrl = sizeUrl;
    }
}
