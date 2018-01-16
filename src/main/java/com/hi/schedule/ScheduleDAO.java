package com.hi.schedule;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.schedule.ScheduleDTO;

@Repository
public class ScheduleDAO {

	@Inject
	 private SqlSession sqlSession;
	 private static final String namespace ="scheduleMapper.";
	 
	 public int getNum()throws Exception{
		 return sqlSession.insert(namespace+"getNum");		 
	 }
	 
	 public int write(ScheduleDTO scheduleDTO)throws Exception{
		 return sqlSession.insert(namespace+"write",scheduleDTO);
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
	 public int ScheduleDeleteOne(int schnum)throws Exception{

		 return sqlSession.delete(namespace+"ScheduleDeleteOne", schnum);
	 }
	 public ScheduleDTO ScheduleUpdateGET(int schnum)throws Exception{
		 ScheduleDTO scheduleDTO = sqlSession.selectOne(namespace+"ScheduleUpdateGET", schnum);
		 return sqlSession.selectOne(namespace+"ScheduleUpdateGET", schnum);
	 }
	 public int ScheduleUpdatePOST(ScheduleDTO scheduleDTO)throws Exception{
		 return sqlSession.update(namespace+"ScheduleUpdatePOST", scheduleDTO);
	 }
}
