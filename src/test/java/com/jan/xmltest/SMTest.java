package com.jan.xmltest;

import org.junit.Before;
import org.junit.Test;
/** 
* @author ����: JanLiao
* @date ʱ��: 2020��5��12�� ����12:26:07
*/

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jan.dao.UserDao;
import com.jan.entity.Users;

public class SMTest {

    private ApplicationContext context = null;
    private UserDao userDao = null;

    @Before
    public void init() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        userDao = (UserDao) context.getBean("userDao");
    }

    @Test
    public void testInsert() {
        System.out.println(userDao.insert(new Users("luoxn28", 23)));
    }

    @Test
    public void testUpdate() {
        System.out.println(userDao.update(new Users(10, "luoxn28", 22)));
    }

    @Test
    public void testDelete() {
        System.out.println(userDao.delete(10));
    }

    @Test
    public void testGetById() {
        System.out.println(userDao.getById(10));
    }

    @Test
    public void getGetAll() {
        System.out.println(userDao.getAll());
    }
}
