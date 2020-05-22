package com.jan.xmltest;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jan.entity.Annoaop;
/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月9日 下午7:49:54
*/

public class AopTest1 {
	@org.junit.Test
	public void test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring_context.xml");
		Annoaop ann = (Annoaop) ac.getBean("ann");
		ann.test1();
	}
}
