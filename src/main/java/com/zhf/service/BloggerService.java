package com.zhf.service;

import com.zhf.entity.Blogger;

public interface BloggerService {

    /**
     * 通过用户名查找用户
     * @param userName
     * @return
     */
    public Blogger getByUserName(String userName);

    /**
     * 用于前端主页个人信息的展示
     * @return
     */
    public Blogger findMessage();

    /**
     * 修改密码
     * @param blogger
     * @return
     */
    public int modifyPassword(Blogger blogger);

    /**
     * 修改博主信息
     * @param blogger
     * @return
     */
    public int update(Blogger blogger);
}
