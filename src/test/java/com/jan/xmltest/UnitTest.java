package com.jan.xmltest;

import org.junit.After;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jan.entity.User;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月9日 下午12:58:23
*/

public class UnitTest {
	@Autowired
	private User user;
	
	@Test
	public void test() {
		System.out.println(user);
		System.out.println("test is running");
	}
	
	@After
	public void after() {
		System.out.println("test over!");
	}
}
