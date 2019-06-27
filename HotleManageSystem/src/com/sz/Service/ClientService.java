package com.sz.Service;

import com.sz.Pojo.Client;

public interface ClientService {
	public Client loginClient(Client client);
	public int insClient(Client client);
	public int updMessage(Client client);
	public int updPhoto(Client client);
	public int updPassword(Client client);
}
