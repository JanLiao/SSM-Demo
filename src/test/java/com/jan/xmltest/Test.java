package com.jan.xmltest;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jan.entity.User;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月8日 下午9:26:04
*/

public class Test {
	
	

	public static void main(String[] args) {
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring_context.xml");
		User u = ac.getBean(User.class);
		System.out.println(u);
		User u1 = (User) ac.getBean("user");
		System.out.println(u1);
		ThreadPoolExecutor t = new ThreadPoolExecutor(1, 2, 60, TimeUnit.SECONDS,
				new ArrayBlockingQueue<>(10), new ThreadPoolExecutor.CallerRunsPolicy());
		
		ConcurrentHashMap<String, String> m = new ConcurrentHashMap();
		m.get("");
	}

}
