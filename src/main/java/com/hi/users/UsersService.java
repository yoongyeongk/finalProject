package com.hi.users;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hi.util.FileSaver;

@Service
public class UsersService {

	@Inject
	private UsersDAO usersDAO;

	@Inject
	private FileSaver fileSaver;

	public int join(UsersDTO usersDTO, HttpSession session) throws Exception {
		MultipartFile file = usersDTO.getFile();
		ProfileImgDTO imgDTO = new ProfileImgDTO();
		imgDTO.setFile_name(fileSaver.fileSave(file, session, "upload"));
		imgDTO.setOriginal_name(file.getOriginalFilename());
		imgDTO.setUsername(usersDTO.getUsername());
		usersDAO.insert(imgDTO);

		return usersDAO.join(usersDTO);
	}
	
	public int idCheck(String username) {
		return usersDAO.idCheck(username);
	}

	public UsersDTO login(UsersDTO usersDTO) {
		return usersDAO.login(usersDTO);
	}

	public int update(UsersDTO usersDTO) {
		return usersDAO.update(usersDTO);
	}

	public int delete(String username) {
		return usersDAO.delete(username);
	}

}
