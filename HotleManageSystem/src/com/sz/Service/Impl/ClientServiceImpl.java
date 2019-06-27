package com.sz.Service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sz.Mapper.ClientMapper;
import com.sz.Pojo.Client;
import com.sz.Service.ClientService;

@Service
public class ClientServiceImpl implements ClientService{
	@Resource
	private ClientMapper clientMapper;
	
	@Override
	public Client loginClient(Client client) {
		// TODO Auto-generated method stub
		return clientMapper.LoginClient(client);
	}

	@Override
	public int insClient(Client client) {
		// TODO Auto-generated method stub
		return clientMapper.RegisterClient(client);
	}

	@Override
	public int updMessage(Client client) {
		// TODO Auto-generated method stub
		return clientMapper.UpdateMessage(client);
	}

	@Override
	public int updPhoto(Client client) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updPassword(Client client) {
		// TODO Auto-generated method stub
		return clientMapper.UpdatePassword(client);
	}

}
