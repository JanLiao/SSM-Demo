package com.jan.xmltest;

import java.io.IOException;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月22日 上午10:18:43
*/

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jan.dubbo.TestService;
import com.jan.service.UserService;


@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("classpath:spring/application.xml")
@ContextConfiguration("classpath:spring/spring-context.xml")
public class DubboServer {

	@Autowired
	private TestService testService;

	@Test
	public void testAddTwo() {
		try {
			System.in.read();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


}

