package com.jan.aop;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月9日 下午4:41:59
*/

import java.util.ArrayList;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

import com.jan.entity.Person;

/**
 * 切面(spring aop 就不需要拦截器啦) (模拟hibernate里面保存数据要打开事物，然后各种增删改之后，再提交事物。)
 */
public class Transaction {
	public void beginTransaction() {// 前置通知
		// 打开事物
		System.out.println("begin Transaction");
	}

	/**
	 * @param joinPoint 通过joinPoint可以得到目标类和目标方法的一些信息
	 * @param val       目标方法的返回值
	 *                  和<aop:after-returning returning="val"/>中returning的值保质一致
	 */
	public void commit(JoinPoint joinPoint, Object val) {// 后置通知
		String methodName = joinPoint.getSignature().getName();
		System.out.println(methodName);
		System.out.println(joinPoint.getTarget().getClass().getName());
		// 提交事物
		System.out.println("commit");
		List<Person> personList = (ArrayList<Person>) val;
		for (Person person : personList) {
			System.out.println(person.getPname());
		}
	}
	
	public void commit1(JoinPoint joinPoint) {// 后置通知
		String methodName = joinPoint.getSignature().getName();
		System.out.println(methodName);
		System.out.println(joinPoint.getTarget().getClass().getName());
		// 提交事物
		System.out.println("commit1");
	}

	public void finalMethod() {
		System.out.println("最终通知");
	}

	public void aroundMethod(ProceedingJoinPoint joinPoint) {// 环绕通知
		try {
			System.out.println("around method start");
			joinPoint.proceed();// 调用目标类的目标方法
			System.out.println("around method end");
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 异常通知
	 */
	public void throwingMethod(Throwable except) {
		System.out.println(except.getMessage());
	}
}
