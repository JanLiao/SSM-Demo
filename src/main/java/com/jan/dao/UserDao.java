package com.jan.dao;

/** 
* @author ����: JanLiao
* @date ʱ��: 2020��5��11�� ����9:22:44
*/

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jan.entity.User;
import com.jan.entity.Users;

public interface UserDao {

    public int insert(Users user);

    public int update(Users user);

    public int delete(int id);

    public Users getById(int id);

    public List<Users> getAll();
    
    public Users getUser(@Param("name")String name);
}
