package com.hi.project.test;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi.project.pmfScrap.PmfScrapDTO;
import com.hi.project.pmfScrap.PmfScrapService;

@Controller
@RequestMapping(value="/scrap/*")
public class PmfScrapController {

	@Inject
	private PmfScrapService pmfScrapService;
	
	public void selectList(String nickname) {
		
	}
	
	public void selectOne(int snum) {
		
	}
	
	public void insert(PmfScrapDTO pmfScrapDTO) {
		
	}
	
	public void delete(int snum) {
		
	}
	
	public void deleteAll(String nickname) {
		
	}
}
