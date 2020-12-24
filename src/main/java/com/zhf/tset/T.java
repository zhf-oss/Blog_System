package com.zhf.tset;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class T {

    ApplicationContext ap;

    @Before
    public void before(){
        ap = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
    }

    @Test
    public void t(){
        Object o = ap.getBean("dataSource");
        System.out.println(o.getClass());
    }

}
