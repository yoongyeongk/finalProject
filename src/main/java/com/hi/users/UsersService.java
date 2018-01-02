package com.hi.users;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class UsersService {
	
	@Inject
	private UsersDAO usersDAO;
	
	public int join(UsersDTO usersDTO) throws Exception {
		return usersDAO.join(usersDTO);
	}
	
}
