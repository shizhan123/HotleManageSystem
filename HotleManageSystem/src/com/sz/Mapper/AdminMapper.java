package com.sz.Mapper;

import org.apache.ibatis.annotations.Select;

import com.sz.Pojo.Admin;

public interface AdminMapper {
	@Select("select *from admin where adminName = #{adminName}")
	public Admin selectByAdminName(Admin admin);
}
