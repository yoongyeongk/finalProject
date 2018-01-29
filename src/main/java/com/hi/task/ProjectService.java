package com.hi.task;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hi.users.UsersDTO;

@Service
@Transactional
public class ProjectService {

	@Inject
	private ProjectDAO projectDAO;

	public List<ProjectDTO> list(HttpSession session) {
		UsersDTO usersDTO = (UsersDTO) session.getAttribute("user");
		return projectDAO.list(usersDTO);
	}

	public ProjectDTO setting(int project_id) {
		return projectDAO.setting(project_id);
	}

	public int create(ProjectDTO projectDTO, HttpSession session) {
		// 프로젝트 생성
		int result = projectDAO.create(projectDTO);
		Map<String, Object> map = new HashMap<String, Object>();
		UsersDTO usersDTO = (UsersDTO) session.getAttribute("user");
		map.put("username", usersDTO.getUsername());
		map.put("project_id", projectDTO.getProject_id());
		// Members 테이블에 삽입
		result = projectDAO.insert(map);
		return result;
	}

	public int update(ProjectDTO projectDTO) {
		return projectDAO.update(projectDTO);
	}

	public int delete(int project_id) {
		return projectDAO.delete(project_id);
	}

}
