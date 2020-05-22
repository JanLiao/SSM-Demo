package com.jan.xmltest;

import java.io.IOException;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jan.dubbo.TestService;

/** 
* @author ����: JanLiao
* @date ʱ��: 2020��5��22�� ����10:35:07
*/

public class DubboServerTest {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext cls = new ClassPathXmlApplicationContext("classpath:spring/spring-context.xml");
		TestService ts = (TestService) cls.getBean("testService");
		try {
			System.in.read();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
