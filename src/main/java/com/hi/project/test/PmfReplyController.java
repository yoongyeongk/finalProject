package com.hi.project.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hi.project.pmfReply.PmfReplyDTO;

@Controller
@RequestMapping(value="/reply/*")
public class PmfReplyController {

	//AJAX처리
	@RequestMapping(value="pmfReplyWrite", method=RequestMethod.POST)
	public void insert(PmfReplyDTO pmfReplyDTO) {
		//insert 처리
		//성공,실패 여부 확인 및 결과 처리
	}
	
	public void selectList(int num) {
		//게시글 번호에 해당되는 댓글 불러오기
		
	}
	
	public void update() {
		//수정 폼 불러오기
	}
	
	public void update(PmfReplyDTO pmfReplyDTO) {
		//댓글 수정
	}
	
	public void delete(int rnum) {
		//댓글 삭제
	}
}