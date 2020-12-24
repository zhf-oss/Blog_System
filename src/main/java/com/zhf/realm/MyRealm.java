package com.zhf.realm;

import com.zhf.entity.Blogger;
import com.zhf.service.BloggerService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;

public class MyRealm extends AuthorizingRealm {

    @Resource
    private BloggerService bloggerService;

    /**
     * 为当前的登录的用户角色和权限
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    /**
     * 验证当前登录的用户
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // 可以获取到用户登录时的用户名
        String userName = (String) token.getPrincipal();
        // 用户登录时的用户名放到数据库查询
        Blogger blogger = bloggerService.getByUserName(userName);
        if(blogger!=null){
            // 把当前用户信息存到session中
            SecurityUtils.getSubject().getSession().setAttribute("currentUser",blogger);
            // 用户登录时的用户名 与 数据库里的用户名对比，有则比较密码，对则返回true，密码不一致报错
            AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(blogger.getUserName(),blogger.getPassword(),"xxx");
            return authcInfo;
        }else{
            return null;
        }
    }
}
