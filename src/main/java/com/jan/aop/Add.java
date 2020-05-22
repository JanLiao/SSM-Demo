package com.jan.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/** 
* @author ����: JanLiao
* @date ʱ��: 2020��5��9�� ����7:47:26
*/
@Aspect
@Component("add")
public class Add {
	@Before(value="execution(* com.jan.entity.Annoaop.*(..))") //�е�(Ŀ����󷽷�)
	public void before() {
		System.out.println("ǰ����ǿ");
	}
}
