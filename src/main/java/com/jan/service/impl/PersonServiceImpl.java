package com.jan.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jan.service.PersonService;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月9日 下午5:25:01
*/

@Service("personService")
public class PersonServiceImpl implements PersonService {

	@Override
	public void savePerson() {
		System.out.println("person service saved");
	}

}
