package com.hi.project;

import javax.inject.Inject;

import org.junit.Test;

import com.hi.users.UsersDTO;
import com.hi.users.UsersService;

public class UsersTest extends AbstractTest {

	@Inject
	private UsersService usersService;

	public void join() throws Exception {
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setUsername("test");
		usersDTO.setPassword("test");
		usersDTO.setNickname("test");
		usersDTO.setPhone("01000000000");
		usersDTO.setProfile_img("");

		usersService.join(usersDTO);
	}

	@Test
	public void test() {
		try {
			this.join();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
