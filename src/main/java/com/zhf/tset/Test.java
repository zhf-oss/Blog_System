package com.zhf.tset;

import java.lang.reflect.Constructor;

public class Test {
    public static void main(String[] args) {
        Class<?> c=null;
        try {
            c=Class.forName("com.zhf.tset.Student");
            System.out.println(c.getName());
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }




        Constructor<?> cons[]= c.getConstructors();

        for (Constructor<?> con : cons) {
            System.out.println("构造方法" + con);
        }
    }
}