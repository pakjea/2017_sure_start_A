package com.sure.c1s3.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sure.c1s3.dao.MainDao;
import com.sure.c1s3.vo.HistoryVo;
import com.sure.c1s3.vo.MilestoneVo;
import com.sure.c1s3.vo.ProjectVo;
import com.sure.c1s3.vo.TeamVo;

@Service("mainService")
public class MainService {
	
	@Autowired
	private MainDao mainDao;
	
	public List<TeamVo> selectTeamList() {
		return mainDao.selectTeam();
	}
	
	
	// Project
	public List<ProjectVo> selectProjectList() {
		return mainDao.selectProject();
	}
	
	public String selectProjectMaxId() {
		return mainDao.selectProjectMaxId();
	}
	
	public int insertProject(ProjectVo projectVo) {
		return mainDao.insertProject(projectVo);
	}
	
	public int updateProject(ProjectVo projectVo) {
		return mainDao.updateProject(projectVo);
	}
	
	public int deleteProject(String p_Id) {
		return mainDao.deleteProject(p_Id);
	}
	
	// Milestone
	public List<MilestoneVo> selectAllMilestoneList() {
		return mainDao.selectAllMilestone();
	}
	
	public List<MilestoneVo> selectMilestoneList(String p_Id) {
		return mainDao.selectMilestone(p_Id);
	}
	public String selectMilestoneMaxId() {
		return mainDao.selectMilestoneMaxId();
	}
	
	public int insertMilestone(MilestoneVo milestoneVo) {
		return mainDao.insertMilestone(milestoneVo);
	}
	
	public int updateMilestone(MilestoneVo milestoneVo) {
		return mainDao.updateMilestone(milestoneVo);
	}
	
	public int deleteMilestone(String ms_Id) {
		return mainDao.deleteMilestone(ms_Id);
	}
	
	public int deleteAllMilestone(String p_Id) {
		return mainDao.deleteAllMilestone(p_Id);
	}
	
	// History
	public List<HistoryVo> selectHistoryList(HashMap<String, String> params) {
		return mainDao.selectHistory(params);
	}
	
	public int insertHistory(HistoryVo historyVo) {
		return mainDao.insertHistory(historyVo);
	}
}
