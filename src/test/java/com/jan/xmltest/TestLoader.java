package com.jan.xmltest;

/** 
* @author ����: JanLiao
* @date ʱ��: 2020��5��11�� ����10:23:59
*/

public class TestLoader {

	public static void main(String[] args) {
		ClassLoader cl = ClassLoader.getSystemClassLoader();
		ClassLoader c = TestLoader.class.getClassLoader();
	}

}
