package com.jan.entity;

import org.springframework.stereotype.Component;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月9日 下午7:44:29
*/
@Component("ann")
public class Annoaop {
	public void test1() {
		System.out.println("anno aop test!");
	}
}
