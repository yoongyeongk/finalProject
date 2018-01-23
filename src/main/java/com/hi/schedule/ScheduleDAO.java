package com.hi.schedule;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.partner.PartnerDTO;
import com.hi.schedule.ScheduleDTO;

@Repository
public class ScheduleDAO {

	@Inject
	 private SqlSession sqlSession;
	 private static final String namespace ="scheduleMapper.";
	 
	 public int getNum()throws Exception{
		 return sqlSession.insert(namespace+"getNum");		 
	 }
	 //참석자에 들어간 닉네임 가진 아이디도 스케줄 추가해주는 메서드 
	 public int write(ScheduleDTO scheduleDTO)throws Exception{
		 
		 return sqlSession.insert(namespace+"write",scheduleDTO);
	 }
 public int write2(ScheduleDTO scheduleDTO)throws Exception{
		 
		 return sqlSession.insert(namespace+"write2",scheduleDTO);
	 }
	 public List<ScheduleDTO> jsonScheduleList(String username)throws Exception{
		 System.out.println(username);		 
		return sqlSession.selectList(namespace+"jsonScheduleList", username);		 
	 }
	 public List<ScheduleDTO> jsonScheduleDayList(ScheduleDTO scheduleDTO)throws Exception{
		List<ScheduleDTO> ar = sqlSession.selectList(namespace+"jsonScheduleDayList",scheduleDTO);
		for (ScheduleDTO scheduleDTO2 : ar) {
			scheduleDTO2.setStartday(scheduleDTO2.getStartday().substring(0,scheduleDTO2.getStartday().indexOf(" ")));
			scheduleDTO2.setLastday(scheduleDTO2.getLastday().substring(0, scheduleDTO2.getLastday().indexOf(" ")));
		}
		 return ar;
	 }
	 public int ScheduleDelete(int schnum)throws Exception{
		 return sqlSession.delete(namespace+"ScheduleDelete", schnum);
	 }
	 public ScheduleDTO ScheduleUpdateGET(int num)throws Exception{
		 ScheduleDTO scheduleDTO = sqlSession.selectOne(namespace+"ScheduleUpdateGET", num);
		 return sqlSession.selectOne(namespace+"ScheduleUpdateGET", num);
	 }
	 public int ScheduleUpdatePOST(ScheduleDTO scheduleDTO)throws Exception{
		 return sqlSession.update(namespace+"ScheduleUpdatePOST", scheduleDTO);
	 }
	 
	 public String selectUserName (String nickName) throws Exception {
		 return sqlSession.selectOne(namespace+"selectUserName", nickName);
	 }
}
