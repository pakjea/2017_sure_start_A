package com.sure.c1s3.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sure.c1s3.service.MainService;
import com.sure.c1s3.vo.ProjectVo;
import com.sure.c1s3.vo.TeamVo;

@Controller
public class MainController {
   
   
   @Autowired
   private MainService mainService;
   
   /**
    * 로드맵 메인
    * @throws JSONException 
    */
   @RequestMapping("/")
   public String roadmapMain(Model model) throws JSONException {
      
	    model.addAttribute("result", -1);
	   
		List<TeamVo> teamList = mainService.selectTeamList();
		model.addAttribute("teamList", teamList);
		
		List<ProjectVo> projectList = mainService.selectProjectList();
		JSONArray jsonArr = getProjectInformation(projectList);
		model.addAttribute("projectList", jsonArr);
		
		JSONArray jsonArrGroup = getProjectGroup(teamList, projectList);
		model.addAttribute("projectGroup", jsonArrGroup);
		
		return "roadmapMain";

   }
   
  
   /**
    * 프로젝트 등록
    */
   @RequestMapping(value="/registProject",method=RequestMethod.POST)
   public ModelAndView registProject(ProjectVo projectVo) {
      
      int result = mainService.insertProject(projectVo);
      ModelAndView mav = new ModelAndView("roadmapMain");
      mav.addObject("result", result);
      
      List<TeamVo> teamList = mainService.selectTeamList();
      mav.addObject("teamList", teamList);
      
      System.out.println(result);
      System.out.println(projectVo.toString());
      
      return mav;   
   }
   
  
   public JSONArray getProjectGroup(List<TeamVo> teamList, List<ProjectVo> projectList) throws JSONException {
		JSONArray jsonArr = new JSONArray();
		String 	  teamId;
		
		for (TeamVo teamVo : teamList) {
			teamId = teamVo.getT_Id();
			
			JSONObject jsonTeamObj = new JSONObject();
			jsonTeamObj.put("id", teamId);
			jsonTeamObj.put("content", teamVo.getT_Name());
			jsonTeamObj.put("nestedGroups", teamVo.getT_Name());
			jsonArr.put(jsonTeamObj);
			
			for (ProjectVo vo : projectList) {
				if (teamId.equals(vo.getT_Id())) {
					JSONObject jsonObj = new JSONObject();
					jsonObj.put("id", vo.getP_Id());
					jsonObj.put("content", vo.getP_Name());
					jsonArr.put(jsonObj);
				}
			}
		}
		return jsonArr;
	}

   
   public JSONArray getProjectInformation(List<ProjectVo> projectList) throws JSONException {
      JSONArray arr = new JSONArray(); 
      
      for(ProjectVo vo : projectList) {
         
         JSONObject obj = new JSONObject(); 
         obj.put( "id"      , vo.getP_Id()); 
         obj.put( "content" , vo.getP_Name());
         
         arr.put(obj);
      }
      return arr;
   }
   
   /**
    * 프로젝트 변경
    */
   @RequestMapping(value="/modifyProject.ajax",method=RequestMethod.POST)
   public ModelAndView modifyProject(ProjectVo projectVo) {
      
      int result = mainService.updateProject(projectVo);
      ModelAndView mav = new ModelAndView("roadmapMain");
      mav.addObject("result", result);
      
      List<TeamVo> teamList = mainService.selectTeamList();
      mav.addObject("teamList", teamList);
      return mav;   
   }
   
   /**
    * 프로젝트 삭제
    */
   @RequestMapping(value="/deleteProject",method=RequestMethod.POST)
   public ModelAndView deleteProject(String p_Id) {
      
      int result = mainService.deleteProject(p_Id);
      ModelAndView mav = new ModelAndView("roadmapMain");
      mav.addObject("result", result);
      
      List<TeamVo> teamList = mainService.selectTeamList();
      mav.addObject("teamList", teamList);
      return mav;   
   }
   
   /**
    * 마일스톤 등록, 변경
    */
   @RequestMapping("/mileStone")
   public String mileStone(Model model) {
      
      return "mileStone";
   }
   
   /**
    * 로드맵 변경이력
    */
   @RequestMapping("/roadmapHistory")
   public String roadmapHistory(Model model) {
      
      return "roadmapHistory";
   }
   
}