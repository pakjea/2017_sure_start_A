package com.sure.c1s3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.sure.c1s3.vo.*;

@Repository
@Mapper
public interface MainDao {
	
	// Team
	@Select("SELECT T_Id, T_Name FROM teamA.TEAM")
	List<TeamVo> selectTeam();
	
	// Project
	@Select("SELECT P_ID, T_ID, P_NAME, P_CNTNT, ST_DT, ED_DT, P_MM, RGST_DT, UPDT_DT FROM teamA.PROJECT")
	List<ProjectVo> selectProject();
	
	@Insert("INSERT INTO teamA.PROJECT(P_ID, T_ID, P_NAME, P_CNTNT, ST_DT, ED_DT, P_MM, RGST_DT)"
			+ " VALUES (#{p_Id}, #{t_Id}, #{p_Name}, #{p_Cntnt}, #{st_Dt}, #{ed_Dt}, #{p_Mm}, now()")
	int insertProject(ProjectVo projectVo);
	
	@Update("UPDATE teamA.PROJECT SET P_NAME = #{p_Name}, P_CNTNT = #{p_Cntnt}"
			+ ", ST_DT = #{st_Dt}, ED_DT = #{ed_Dt}, UPDT_DT = now()"
			+ " WHERE P_ID = #{p_Id} AND T_ID = #{t_Id}")
	int updateProject(ProjectVo projectVo);
	
	@Delete("DELETE FROM teamA.PROJECT WHERE P_ID = #{p_Id}")
	int deleteProject(String p_Id);
	
	// MileStone
	@Select("SELECT MS_ID, P_ID, T_ID, MS_CNTNT, RGST_DT, UPDT_DT FROM teamA.MILESTONE")
	List<MilestoneVo> selectMileStone();
}
