package com.jan.xmltest;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;

/** 
* @author ����: JanLiao
* @date ʱ��: 2020��5��9�� ����4:49:51
*/

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

//import com.jan.dao.PersonDao;
import com.jan.entity.User;
import com.jan.service.PersonService;

import sun.misc.ProxyGenerator;
 
public class AopTest {
	
	public static void main(String[] args) {
//		try {
//			Class<?> c = Class.forName("");
//		} catch (ClassNotFoundException e1) {
//			e1.printStackTrace();
//		}
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring_context.xml");
		//context.
		System.out.println("=================");
		ConfigurableListableBeanFactory list = context.getBeanFactory();
		String[] s = list.getBeanDefinitionNames();
		for(String ss : s) {
			System.out.println("ss = " + ss);
		}
		System.out.println(list.getBeanClassLoader());
		System.out.println("99999999999999");
		Object o = context.getBean("perform");
		System.out.println(o); 
		System.out.println("8888888888888888");
		
//		try {
//			TimeUnit.SECONDS.sleep(5);
//		} catch (InterruptedException e1) {
//			e1.printStackTrace();
//		}
		User u = (User) context.getBean("user");
		System.out.println(u);
    	//PersonDao personDao=(PersonDao) context.getBean("personDao");
    	//PersonService personService = (PersonService) context.getBean("personService");
    	System.out.println("-----------------");
    	//personService.savePerson();
    	System.out.println("-----------------");
    	//System.out.println("class name = " + personService.getClass().getName());
    	//System.out.println(personDao.getClass());
    	System.out.println("=================================================");
//    	try {
//			personDao.getPerson();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
    	
    	System.out.println("00000000000000000");
    	//PersonDao personDao1=(PersonDao) context.getBean("personDao");
    	//System.out.println(personDao.getClass());
    	
    	for(int i = 1; i <= 13; i++) {
    		try {
				Class<?> cc = Class.forName("com.sun.proxy.$Proxy" + i);
				//createProxyClassFile("proxy" + i, cc);
				//uncompile("com.sun.proxy.$Proxy" + i, "$Proxy" + i);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
    	}
	}
	
	
	private static void createProxyClassFile(String proxyName, Class<?> cc) {
		byte[] bytes = ProxyGenerator.generateProxyClass(proxyName, new Class[] {cc});
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(new File("C:\\Users\\jan\\Desktop\\class\\" + proxyName + ".class"));
			fos.write(bytes);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void uncompile(String classPath, String pn) throws ClassNotFoundException{
		 Class<?> stuClass=Class.forName(classPath);
		 StringBuffer sbstr=new StringBuffer();
		 //�������
		 sbstr.append("class  "+stuClass.getSimpleName()+'{'+'\n');
	     //��ȡ��������
	     Field[] fields=stuClass.getDeclaredFields();
	     for (int i = 0; i < fields.length; i++) {
			sbstr.append(Modifier.toString(fields[i].getModifiers())+" "+fields[i].getType().getSimpleName()+" "+fields[i].getName()+"();"+'\n');
		 }
	     //��ȡ����
	     Method[] mo=stuClass.getMethods();
	     for (int i = 0; i < mo.length; i++) {
	    	 StringBuffer sb=new StringBuffer();
	    	 Class<?>[] pt = mo[i].getParameterTypes();
	    	 if(pt.length>0){
	    		 for (int j = 0; j < pt.length-1; j++) {
	    		    sb.append(pt[j].getSimpleName()+" "+"arg,");
				}
	    		 sb.append(pt[pt.length-1].getSimpleName()+" "+"arg");
	    	 }
	    	 //System.out.println(sb);
	    	 System.out.println(Modifier.toString(mo[i].getModifiers()));
	    	 sbstr.append(Modifier.toString(mo[i].getModifiers())+" "+mo[i].getReturnType().getSimpleName()+" "+mo[i].getName()+"("+sb+")"+"{}"+'\n');
		 }
		 //��ȡ������
	     Constructor<?>[] cons = stuClass.getConstructors();
			for (int i = 0; i < cons.length; i++) {
				StringBuilder fieldsb = new StringBuilder();
				//��ȡ���η�
				int m = cons[i].getModifiers();
				String mod = Modifier.toString(m);
				fieldsb.append(mod+" ");
				
				//ʹ���õ���������������������
				fieldsb.append(stuClass.getSimpleName()+"(");
				
				//��ȡ�����Ĳ����б�
				Class<?>[] pt = cons[i].getParameterTypes();
				if(pt.length>0){
					
					for (int j = 0; j < pt.length; j++) {
						if(j!=pt.length-1){
							
							fieldsb.append(pt[j].getSimpleName()+" arg"+j+",");
						}else{
							fieldsb.append(pt[j].getSimpleName()+" arg"+j);
						}
					}
				}
				fieldsb.append("){}\r\n");
				sbstr.append(fieldsb);
			    }
				//ʹ��io�����ѷ�����ĵ����ݱ��浽�ļ�
				sbstr.append("}");
				BufferedWriter bw;
				try {
					bw = new BufferedWriter(new FileWriter(new File("C:\\Users\\jan\\Desktop\\class\\" + pn + ".java")));
				
				//System.out.println(sbstr);
				String classStr = sbstr.toString();
				bw.write(classStr);
				
				bw.flush();
				bw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	}
 
}
