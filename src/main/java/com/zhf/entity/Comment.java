package com.zhf.entity;

import java.util.Date;

public class Comment {

    private Integer id; // 编号
    private String content; // 评论内容
    private String ip; // 评论人的ip
    private Integer blogId; // 评论哪章博客
    private String date; // 评论日期
    private int state; // 评论审核：1.通过 0.不通过
    private Blog blog; // 博客文章

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

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

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
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

}
