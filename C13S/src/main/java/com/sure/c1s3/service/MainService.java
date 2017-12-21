package com.sure.c1s3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sure.c1s3.dao.MainDao;
import com.sure.c1s3.vo.TeamVo;

@Service("mainService")
public class MainService {
	
	@Autowired
	private MainDao mainDao;
	
	public List<TeamVo> getTeamList() {
		mainDao.selectTeam();
		System.out.println(mainDao.selectTeam());
		return null;
	}
}
