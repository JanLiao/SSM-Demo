package com.jan.xmltest;

import com.alibaba.dubbo.config.ApplicationConfig;
import com.alibaba.dubbo.config.ReferenceConfig;
import com.alibaba.dubbo.config.RegistryConfig;
import com.alibaba.dubbo.rpc.service.EchoService;
import com.jan.dubbo.TestService;

/**
 * @author 作者: JanLiao
 * @date 时间: 2020年5月22日 上午10:14:31
 */

public class DubboClient {
	public static void main(String[] args) {
		ReferenceConfig<TestService> reference = new ReferenceConfig<TestService>();
	    reference.setApplication(new ApplicationConfig("dubbo-demo-api-consumer"));
	    reference.setRegistry(new RegistryConfig("zookeeper://127.0.0.1:2181"));
	    reference.setInterface(TestService.class);
	    TestService service = reference.get();
	    String message = service.sayHello("dubbo");
	    System.out.println(message);
//	    for(int i = 0; i < 2; i++) {
//	    	new Thread(new Runnable() {
//
//				@Override
//				public void run() {
//					String message = service.sayHello("dubbo");
//				    System.out.println(message);
//				}
//	    		
//	    	}).start();
//	    }
	}
}
