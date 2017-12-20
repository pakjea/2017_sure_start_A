package com.sure.c1s3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sure.c1s3.service.MainService;
import com.sure.c1s3.vo.TeamVo;


@Controller
public class MainController {
	
	
	@Autowired
	private MainService mainService;
	/**
	 * 로드맵 메인
	 */
	@RequestMapping("/roadmapMain")
	public String roadmapMain(Model model) {
		
		List<TeamVo> timeV = mainService.getTeamList();
		System.out.println(timeV);
		
		return "main";
	}
	
	/**
	 * 로드맵 변경이력
	 */
	@RequestMapping("/roadmapHistory")
	public String roadmapHistory(Model model) {
		
		return "roadmapHistory";
	}
	
	/**
	 * 프로젝트 등록
	 */
	@RequestMapping("/registProject")
	public String registProject(Model model) {
		
		return "registProject";
	}
	
	/**
	 * 프로젝트 변경
	 */
	@RequestMapping("/modifyProject")
	public String modifyProject(Model model) {
		
		return "modifyProject";
	}
	
	/**
	 * 마일스톤 등록, 변경
	 */
	@RequestMapping("/mileStone")
	public String mileStone(Model model) {
		
		return "mileStone";
	}
}
