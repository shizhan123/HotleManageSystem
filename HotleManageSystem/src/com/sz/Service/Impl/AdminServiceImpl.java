package com.sz.Service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sz.Mapper.AdminMapper;
import com.sz.Pojo.Admin;
import com.sz.Service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	@Resource
	private AdminMapper adminMapper; //×Ô¶¯×¢ÈëadminMapper
	
	@Override
	public Admin Login(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.selectByAdminName(admin);
	}
	
}
