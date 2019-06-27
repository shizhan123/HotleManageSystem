package com.sz.Mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sz.Pojo.Client;

public interface ClientMapper {
	@Select("select *from client where username=#{username}")
	public Client LoginClient(Client client);
	@Insert("insert into client (name , telephone , times , username , userpassword , photo)"
			+ "values(#{name},#{telephone},#{times},#{username},#{userpassword},#{photo})")
	public int RegisterClient(Client client);
	
	@Update("update client set name = #{name} ,telephone = #{telephone} , email = #{email} where username = #{username}")
	public int UpdateMessage(Client client);
	
	@Update("update client set userpassword = #{userpassword} where username = #{username}")
	public int UpdatePassword(Client client);
}
