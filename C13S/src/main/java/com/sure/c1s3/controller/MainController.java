package com.sure.c1s3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sure.c1s3.service.MainService;
import com.sure.c1s3.vo.HistoryVo;
import com.sure.c1s3.vo.ProjectVo;
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
		
		List<TeamVo> teamList = mainService.selectTeamList();
		model.addAttribute("teamList", teamList);
		return "roadmapMain";
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
	@RequestMapping(value="/registProject", method=RequestMethod.POST)
	public ModelAndView registProject(ProjectVo project) {

		ModelAndView mav = new ModelAndView("roadmapMain");
		
		List<TeamVo> teamList = mainService.selectTeamList();
		mav.addObject("teamList", teamList);
		mav.addObject("result", true);
		
		return mav;
	}
	
//	class TestMe{
//		private int id;
//		private String hello;
//		public int getId() {
//			return id;
//		}
//		public void setId(int id) {
//			this.id = id;
//		}
//		public String getHello() {
//			return hello;
//		}
//		public void setHello(String hello) {
//			this.hello = hello;
//		}
//		
//	}
//	@RequestMapping("/test")
//	public JSONArray getProjectInformation() {
//		TestMe me = new TestMe();
//		me.hello = "testme";
//		me.id = 1;
//		JSONArray arr = new JSONArray();
//		arr.put(me);
//		return arr;
//	}
	
	/**
	 * 프로젝트 변경
	 */
	@RequestMapping(value="/modifyProject", method=RequestMethod.POST)
	public ModelAndView modifyProject(ProjectVo project, HistoryVo history) {
		
		ModelAndView mav = new ModelAndView("roadmapMain");
		
		List<TeamVo> teamList = mainService.selectTeamList();
		mav.addObject("teamList", teamList);
		mav.addObject("result", true);
		
		return mav;
	}
	
	/**
	 * 마일스톤 등록, 변경
	 */
	@RequestMapping("/mileStone")
	public String mileStone(Model model) {
		
		return "mileStone";
	}
}
