package com.sure.c1s3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sure.c1s3.dao.MainDao;
import com.sure.c1s3.vo.ProjectVo;
import com.sure.c1s3.vo.TeamVo;

@Service("mainService")
public class MainService {
	
	@Autowired
	private MainDao mainDao;
	
	public List<TeamVo> selectTeamList() {
		return mainDao.selectTeam();
	}
	
	public List<ProjectVo> selectProjectList() {
		return mainDao.selectProject();
	}
	
	public int updateProject(ProjectVo projectVo) {
		return mainDao.updateProject(projectVo);
	}
	
	public int deleteProject(String p_Id) {
		return mainDao.deleteProject(p_Id);
	}
}
