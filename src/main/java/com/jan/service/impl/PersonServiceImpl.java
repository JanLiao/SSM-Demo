package com.jan.service.impl;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jan.service.PersonService;

/** 
* @author ����: JanLiao
* @date ʱ��: 2020��5��9�� ����5:25:01
*/

@Service("personService")
public class PersonServiceImpl implements PersonService {

	@Override
	public void savePerson() {
		System.out.println("person service saved");
	}

}
