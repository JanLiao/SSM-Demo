package com.jan.xmltest;

/** 
* @author ����: JanLiao
* @date ʱ��: 2020��5��9�� ����9:50:26
*/

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jan.entity.User;

public class BeanTest {
	/**
	 * ���з���������ʹ�ô�����
	 * ��������
	 */
	protected ApplicationContext ac;
	/**
	 * ��ʼ��   ��ȡ�����ļ�
	 */
	@Before
	public void init() {

		this.ac = new ClassPathXmlApplicationContext("classpath*:spring_*.xml");

		System.out.println("==init=��ʼ��====");
		String s = "\\MhtheWWe\"_OS_20140627_Line(7).jpg";
		s = s.replace("\"", "").replace("'", "");
		System.out.println("s = " + s);
	}
	/**
	 * ���Դ���
	 */
	@Test
	public void test() {
		User u = (User) ac.getBean("user");
		//u.setPassword("a123456");
		//u.setUserName("jan");
		System.out.println(u);
		System.out.println("==test=����====");
	}
	/**
	 * �ر�
	 */
	@After
	public void close() {

		if (this.ac instanceof ClassPathXmlApplicationContext) {
			ClassPathXmlApplicationContext cpxa = (ClassPathXmlApplicationContext) this.ac;
			cpxa.close();
			cpxa = null;
		}

		System.out.println("==close=�ر�====");
	}

}


