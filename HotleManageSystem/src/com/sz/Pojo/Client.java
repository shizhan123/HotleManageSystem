package com.sz.Pojo;

import java.util.Arrays;

public class Client {
	private int id;
	private String name;
	private String telephone;
	private int times;
	private String username;
	private String userpassword;
	private byte[] photo;
	private int jifen;
	private String email;
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
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public int getTimes() {
		return times;
	}
	public void setTimes(int times) {
		this.times = times;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public byte[] getPhoto() {
		return photo;
	}
	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	
	public int getJifen() {
		return jifen;
	}
	public void setJifen(int jifen) {
		this.jifen = jifen;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Client [id=" + id + ", name=" + name + ", telephone=" + telephone + ", times=" + times + ", username="
				+ username + ", userpassword=" + userpassword + ", photo=" + Arrays.toString(photo) + ", jifen=" + jifen
				+ ", email=" + email + "]";
	}
	public Client(int id, String name, String telephone, int times, String username, String userpassword, byte[] photo,
			int jifen, String email) {
		super();
		this.id = id;
		this.name = name;
		this.telephone = telephone;
		this.times = times;
		this.username = username;
		this.userpassword = userpassword;
		this.photo = photo;
		this.jifen = jifen;
		this.email = email;
	}
	public Client() {
		super();
	}
	
	
}
