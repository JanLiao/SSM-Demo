package com.jan.dubbo.impl;

import java.util.concurrent.TimeUnit;

//import com.alibaba.dubbo.config.annotation.Service;

import org.springframework.stereotype.Service;

import com.jan.dubbo.TestService;

/** 
* @author ����: JanLiao
* @date ʱ��: 2020��5��22�� ����10:04:22
*/
@Service("testService")
public class TestServiceImpl implements TestService {

	@Override
	public String sayHello(String msg) {
		try {
			TimeUnit.SECONDS.sleep(5);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "server = " + msg;
	}

}
