package com.jan.entity;

import org.springframework.stereotype.Component;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月9日 上午10:22:07
*/
@Component("role")
public class Role {
	private int id;
	
	private String roleName;
	
	private String desc;

	public Role() {
		super();
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + ", desc=" + desc + "]";
	}

	public Role(int id, String roleName, String desc) {
		super();
		this.id = id;
		this.roleName = roleName;
		this.desc = desc;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
}
