package com.hi.project;

import javax.inject.Inject;

import org.junit.Test;

import com.hi.users.UsersDTO;
import com.hi.users.UsersService;

public class UsersTest extends AbstractTest {

	@Inject
	private UsersService usersService;

	public void view() {
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setUsername("seryu92@gmail.com");
		usersDTO.setPassword("1");
		usersDTO = usersService.login(usersDTO);
		System.out.println(usersDTO.getUsername());
		System.out.println(usersDTO.getFilename().getOriginal_name());
	}
	
	@Test
	public void test() {
		this.view();
	}

}
