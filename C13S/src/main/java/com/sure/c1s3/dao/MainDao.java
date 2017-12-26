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
	@Select("SELECT P_ID, T_ID, P_NAME, P_CNTNT, ST_DT, ED_DT, P_MM, RGST_DT, UPDT_DT FROM teamA.PROJECT ORDER BY T_ID, P_ID")
	List<ProjectVo> selectProject();
	
	@Insert("INSERT INTO teamA.PROJECT(P_ID, T_ID, P_NAME, P_CNTNT, ST_DT, ED_DT, P_MM, RGST_DT)"
			+ " SELECT LPAD(MAX(CONVERT(P_ID, UNSIGNED)) + 1, 8, '0') AS P_ID, #{t_Id}, #{p_Name}, #{p_Cntnt}, "
			+ " STR_TO_DATE(#{st_Dt}, '%Y-%m-%d'), STR_TO_DATE(#{ed_Dt}, '%Y-%m-%d'), CONVERT(#{p_Mm}, UNSIGNED), CURDATE() FROM teamA.PROJECT")
	int insertProject(ProjectVo projectVo);
	
	@Update("UPDATE teamA.PROJECT "
			+ " SET P_NAME = #{p_Name}, P_CNTNT = #{p_Cntnt}, ST_DT = #{st_Dt}, ED_DT = #{ed_Dt}, P_MM = CONVERT(#{p_Mm}, UNSIGNED), UPDT_DT = CURDATE()"
			+ " WHERE P_ID = #{p_Id}")
	int updateProject(ProjectVo projectVo);
	
	@Delete("DELETE FROM teamA.PROJECT WHERE P_ID = #{p_Id}")
	int deleteProject(String p_Id);
	
	// MileStone
	@Select("SELECT MS_ID, MS_DT, P_ID, T_ID, MS_CNTNT, WRITER, RGST_DT, UPDT_DT FROM teamA.MILESTONE ORDER BY T_ID, P_ID, MS_ID")
	List<MilestoneVo> selectAllMilestone();

	@Select("SELECT MS_ID, MS_DT, P_ID, T_ID, MS_CNTNT, WRITER, RGST_DT, UPDT_DT FROM teamA.MILESTONE WHERE P_ID = #{p_Id} ORDER BY T_ID, P_ID, MS_ID")
	List<MilestoneVo> selectMilestone(String p_Id);
	
	@Insert("INSERT INTO teamA.MILESTONE(MS_ID, MS_DT, P_ID, T_ID, MS_CNTNT, WRITER, RGST_DT)"
			+ " SELECT LPAD(MAX(CONVERT(MS_ID, UNSIGNED)) + 1, 8, '0') AS MS_ID, "
			+ " STR_TO_DATE(#{ms_Dt}, '%Y-%m-%d'), #{p_Id}, #{t_Id}, #{ms_Cntnt}, #{writer}, CURDATE() FROM teamA.MILESTONE")
	int insertMilestone(MilestoneVo milestoneVo);
	
//	@Update("INSERT INTO teamA.MILESTONE(MS_ID, MS_DT, P_ID, T_ID, MS_CNTNT, WRITER, RGST_DT)"
//			+ " VALUE(#{ms_Id}, STR_TO_DATE(#{ms_Dt}, '%Y-%m-%d'), "
//			+ " #{p_Id}, #{t_Id}, #{ms_Cntnt}, #{writer}, CURDATE()) "
//			+ " ON DUPLICATE KEY UPDATE "
//			+ " MS_DT = #{ms_Dt}, MS_CNTNT = #{ms_Cntnt}, WRITER = #{writer}, UPDT_DT = CURDATE()")
	@Update(" UPDATE teamA.MILESTONE "
			+ " SET MS_DT = #{ms_Dt}, MS_CNTNT = #{ms_Cntnt}, WRITER = #{writer}, UPDT_DT = CURDATE()"
			+ " WHERE MS_ID = #{ms_Id} ")
	int updateMilestone(MilestoneVo milestoneVo);
	
	@Delete("DELETE FROM teamA.MILESTONE WHERE MS_ID = #{ms_Id}")
	int deleteMilestone(String ms_Id);
	
	// History
	@Select("SELECT HIS_ID, HIS_CNTNT, P_ID, T_ID, EMP_NAME, RGST_DT FROM teamA.HISTORY ORDER BY HIS_ID")
	List<HistoryVo> selectHistory();
	
	@Insert("INSERT INTO teamA.HISTORY(HIS_ID, HIS_CNTNT, P_ID, T_ID, EMP_NAME, RGST_DT)"
			+ " SELECT SELECT CASE WHEN MAX(CONVERT(HIS_ID, UNSIGNED)) IS NOT NULL THEN MAX(CONVERT(HIS_ID, UNSIGNED)) + 1 ELSE CONCAT(DATE_FORMAT(SYSDATE(), '%Y%m%d%H%i%s'), '00') END AS HIS_ID "
			+ ", #{his_Cntnt}, #{p_Id}, #{t_Id}, #{emp_Name}, CURDATE() FROM teamA.HISTORY")
	int insertHistory(HistoryVo historyVo);
}
