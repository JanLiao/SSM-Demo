package com.jan.xmltest;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月9日 上午9:50:26
*/

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jan.entity.User;

public class BeanTest {
	/**
	 * 所有方法都可以使用此属性
	 * 包括子类
	 */
	protected ApplicationContext ac;
	/**
	 * 初始化   读取配置文件
	 */
	@Before
	public void init() {

		this.ac = new ClassPathXmlApplicationContext("classpath*:spring_*.xml");

		System.out.println("==init=初始化====");
		String s = "\\MhtheWWe\"_OS_20140627_Line(7).jpg";
		s = s.replace("\"", "").replace("'", "");
		System.out.println("s = " + s);
	}
	/**
	 * 测试代码
	 */
	@Test
	public void test() {
		User u = (User) ac.getBean("user");
		//u.setPassword("a123456");
		//u.setUserName("jan");
		System.out.println(u);
		System.out.println("==test=测试====");
	}
	/**
	 * 关闭
	 */
	@After
	public void close() {

		if (this.ac instanceof ClassPathXmlApplicationContext) {
			ClassPathXmlApplicationContext cpxa = (ClassPathXmlApplicationContext) this.ac;
			cpxa.close();
			cpxa = null;
		}

		System.out.println("==close=关闭====");
	}

}


