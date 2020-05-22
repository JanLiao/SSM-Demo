package com.jan.aop;

/** 
* @author ����: JanLiao
* @date ʱ��: 2020��5��9�� ����4:41:59
*/

import java.util.ArrayList;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

import com.jan.entity.Person;

/**
 * ����(spring aop �Ͳ���Ҫ��������) (ģ��hibernate���汣������Ҫ�����Ȼ�������ɾ��֮�����ύ���)
 */
public class Transaction {
	public void beginTransaction() {// ǰ��֪ͨ
		// ������
		System.out.println("begin Transaction");
	}

	/**
	 * @param joinPoint ͨ��joinPoint���Եõ�Ŀ�����Ŀ�귽����һЩ��Ϣ
	 * @param val       Ŀ�귽���ķ���ֵ
	 *                  ��<aop:after-returning returning="val"/>��returning��ֵ����һ��
	 */
	public void commit(JoinPoint joinPoint, Object val) {// ����֪ͨ
		String methodName = joinPoint.getSignature().getName();
		System.out.println(methodName);
		System.out.println(joinPoint.getTarget().getClass().getName());
		// �ύ����
		System.out.println("commit");
		List<Person> personList = (ArrayList<Person>) val;
		for (Person person : personList) {
			System.out.println(person.getPname());
		}
	}
	
	public void commit1(JoinPoint joinPoint) {// ����֪ͨ
		String methodName = joinPoint.getSignature().getName();
		System.out.println(methodName);
		System.out.println(joinPoint.getTarget().getClass().getName());
		// �ύ����
		System.out.println("commit1");
	}

	public void finalMethod() {
		System.out.println("����֪ͨ");
	}

	public void aroundMethod(ProceedingJoinPoint joinPoint) {// ����֪ͨ
		try {
			System.out.println("around method start");
			joinPoint.proceed();// ����Ŀ�����Ŀ�귽��
			System.out.println("around method end");
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * �쳣֪ͨ
	 */
	public void throwingMethod(Throwable except) {
		System.out.println(except.getMessage());
	}
}
