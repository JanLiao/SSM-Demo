package com.jan.xmltest;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.jan.entity.Users;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月12日 下午12:38:26
*/

public class MybatisMain {
    SqlSessionFactory sessionFactory = null;
    SqlSession sqlSession = null;

    {
        String resource = "mybatisConfig.xml";
        // 加载mybatis的配置文件（它也加载关联的映射文件）
        Reader reader = null;
        try {
            reader = Resources.getResourceAsReader(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 构建sqlSession的工厂
        sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        // 创建能执行映射文件中sql的sqlSession，默认是手动提交事务的，使用自动提交的话加上参数 true
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
