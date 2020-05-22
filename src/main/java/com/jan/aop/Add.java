package com.jan.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月9日 下午7:47:26
*/
@Aspect
@Component("add")
public class Add {
	@Before(value="execution(* com.jan.entity.Annoaop.*(..))") //切点(目标对象方法)
	public void before() {
		System.out.println("前置增强");
	}
}
