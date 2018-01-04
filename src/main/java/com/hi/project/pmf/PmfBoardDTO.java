package com.hi.project.pmf;

import java.sql.Date;
import java.util.Calendar;

import com.hi.boardFile.FileDTO;

public class PmfBoardDTO {

	//기본 데이터 - 필수
	private int num;
	private String title;
	private String writer;
	private Date reg_date;
	private int hit;
	
	//프로젝트 관련 데이터- 필수
	private String major_key;
	private String sub_key;
	private String works;
	private String project_name;
	private Date start_date;
	private Date end_date;
	private FileDTO fileDTO;	//파일 첨부 시
	private String project_detail;
	
	//업무 관련 정보 
	private String work_kind;		//근무 유형 - 필수
	private String education_level;	//학력
	private String career;			//경력
	private String payment_kind;	//급여 유형- 필수
	private int payment_value;		//급여 - 월/일
	
	//회사 정보
	private String firm_info;		//회사소개
	private String addr;			//주소1
	private String addr_detail;		//주소2
	
	//담당자 정보 - 필수
	private String admin_id;		//담당자 id
	private String admin_email;		//담당자 email
	private String admin_phone;		//담당자 전화번호
	
	//모집기간
	private String duration_kind;	//상시모집,마감일 설정 필수
	private Date duration_end;		//마감일 설정 - 마감일
	
	//제출 서류
	private PmfDocumentDTO pmfDocumentDTO; //서류

	//태그
	
	//임시저장
	private int temp;				//1: 임시저장
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	/////////////////////////////////////////////////////
	public String getMajor_key() {
		return major_key;
	}

	public void setMajor_key(String major_key) {
		this.major_key = major_key;
	}

	public String getSub_key() {
		return sub_key;
	}

	public void setSub_key(String sub_key) {
		this.sub_key = sub_key;
	}

	public String getWorks() {
		return works;
	}

	public void setWorks(String works) {
		this.works = works;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	///////////////////////////////////////////////////////////
	public FileDTO getFileDTO() {
		return fileDTO;
	}

	public void setFileDTO(FileDTO fileDTO) {
		this.fileDTO = fileDTO;
	}

	///////////////////////////////////////////////////////////
	public String getProject_detail() {
		return project_detail;
	}

	public void setProject_detail(String project_detail) {
		this.project_detail = project_detail;
	}
	
	///////////////////////////////////////////////////////////
	public String getWork_kind() {
		return work_kind;
	}

	public void setWork_kind(String work_kind) {
		this.work_kind = work_kind;
	}

	//필수 아님
	public String getEducation_level() {
		String education_level = "";
		
		if(this.education_level != null) {
			education_level = this.education_level;
		}
		
		return education_level;
	}

	public void setEducation_level(String education_level) {
		this.education_level = education_level;
	}

	//필수 아님
	public String getCareer() {
		String career = "";
		
		if(this.career != null) {
			career = this.career;
		}
		
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getPayment_kind() {
		return payment_kind;
	}

	public void setPayment_kind(String payment_kind) {
		this.payment_kind = payment_kind;
	}

	public int getPayment_value() {
		int payment_value = 0;
		if(!payment_kind.equals("협의")) {
			payment_value = this.payment_value;
		}
		
		return payment_value;
	}

	public void setPayment_value(int payment_value) {
		this.payment_value = payment_value;
	}

	public String getFirm_info() {
		String firm_info = "";
		
		if(this.firm_info != null) {
			firm_info = this.firm_info;
		}
		
		return firm_info;
	}

	public void setFirm_info(String firm_info) {
		this.firm_info = firm_info;
	}

	public String getAddr() {
		String addr = "";
		
		if(this.addr != null) {
			addr = this.addr;
		}
		
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr_detail() {
		String addr_detail = "";
		
		if(this.addr_detail != null) {
			addr_detail = this.addr_detail;
		}
		
		return addr_detail;
	}

	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	public String getAdmin_phone() {
		return admin_phone;
	}

	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}

	public String getDuration_kind() {
		return duration_kind;
	}

	public void setDuration_kind(String duration_kind) {
		this.duration_kind = duration_kind;
	}

	public Date getDuration_end() {
		if(duration_kind.equals("상시 모집")) {
			this.duration_end = new Date(Calendar.getInstance().getTimeInMillis());
		}
		
		return duration_end;
	}

	public void setDuration_end(Date duration_end) {
		this.duration_end = duration_end;
	}

	public PmfDocumentDTO getPmfDocumentDTO() {
		return pmfDocumentDTO;
	}

	public void setPmfDocumentDTO(PmfDocumentDTO pmfDocumentDTO) {
		this.pmfDocumentDTO = pmfDocumentDTO;
	}

	public int getTemp() {
		return temp;
	}

	public void setTemp(int temp) {
		this.temp = temp;
	}
	
}
