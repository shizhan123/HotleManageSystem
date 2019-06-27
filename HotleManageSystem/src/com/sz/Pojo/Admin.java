package com.sz.Pojo;


public class Admin {
	private int id; 
	private String name;
	private String adminName;
	private String password;
	private int adminLimit;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAdminLimit() {
		return adminLimit;
	}
	public void setAdminLimit(int adminLimit) {
		this.adminLimit = adminLimit;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", adminName=" + adminName + ", password=" + password
				+ ", adminLimit=" + adminLimit + "]";
	}
	public Admin(int id, String name, String adminName, String password, int adminLimit) {
		super();
		this.id = id;
		this.name = name;
		this.adminName = adminName;
		this.password = password;
		this.adminLimit = adminLimit;
	}
	public Admin() {
		super();
	}
	
	
}
