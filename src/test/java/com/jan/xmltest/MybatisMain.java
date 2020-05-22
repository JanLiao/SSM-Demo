package com.jan.xmltest;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.jan.entity.Users;

/** 
* @author ����: JanLiao
* @date ʱ��: 2020��5��12�� ����12:38:26
*/

public class MybatisMain {
    SqlSessionFactory sessionFactory = null;
    SqlSession sqlSession = null;

    {
        String resource = "mybatisConfig.xml";
        // ����mybatis�������ļ�����Ҳ���ع�����ӳ���ļ���
        Reader reader = null;
        try {
            reader = Resources.getResourceAsReader(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // ����sqlSession�Ĺ���
        sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        // ������ִ��ӳ���ļ���sql��sqlSession��Ĭ�����ֶ��ύ����ģ�ʹ���Զ��ύ�Ļ����ϲ��� true
        sqlSession = sessionFactory.openSession(true);
    }

    public static void main(String[] args) {
        String statement = "com.jan.mapper.UserMapper.getById";

        Users order = new MybatisMain().sqlSession.selectOne(statement, 2);
        System.out.println(order);
        order = new MybatisMain().sqlSession.selectOne(statement, 10);
        System.out.println(order);
    }
}
