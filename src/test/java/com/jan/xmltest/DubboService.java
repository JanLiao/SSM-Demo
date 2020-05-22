package com.jan.xmltest;

import java.io.IOException;

import com.alibaba.dubbo.config.ApplicationConfig;
import com.alibaba.dubbo.config.RegistryConfig;
import com.alibaba.dubbo.config.ServiceConfig;
import com.jan.dubbo.TestService;
import com.jan.dubbo.impl.TestServiceImpl;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月22日 上午10:19:40
*/

public class DubboService {
	public static void main(String[] args) {
		ServiceConfig<TestServiceImpl> service = new ServiceConfig<TestServiceImpl>();
	    service.setApplication(new ApplicationConfig("dubbo-demo-api-provider"));
	    service.setRegistry(new RegistryConfig("zookeeper://127.0.0.1:2181"));
	    service.setInterface(TestService.class);
	    service.setRef(new TestServiceImpl());
	    service.export();
		
		  try { System.in.read(); } catch (IOException e) { e.printStackTrace(); }
		 
	}
}
