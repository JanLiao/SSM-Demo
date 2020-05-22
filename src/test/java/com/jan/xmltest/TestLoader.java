package com.jan.xmltest;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月11日 上午10:23:59
*/

public class TestLoader {

	public static void main(String[] args) {
		ClassLoader cl = ClassLoader.getSystemClassLoader();
		ClassLoader c = TestLoader.class.getClassLoader();
	}

}
