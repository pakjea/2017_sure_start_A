package com.sure.c1s3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	/**
	 * 로드맵 메인
	 */
	@RequestMapping("/roadmapMain")
	public String roadmapMain(Model model) {
		
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
