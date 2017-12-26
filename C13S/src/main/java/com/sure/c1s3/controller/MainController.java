package com.sure.c1s3.controller;

import java.util.ArrayList;
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
import com.sure.c1s3.vo.MilestoneVo;
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
   public ModelAndView roadmapMain(Model model) throws JSONException {
      
	    ModelAndView mav = new ModelAndView("roadmapMain");
	    model.addAttribute("result", -1);
	      
	    loadData(mav);
	   
		return mav;

   }
   
   /**
    * 프로젝트 등록
    * @throws JSONException 
    */
   @RequestMapping(value="/registProject",method=RequestMethod.POST)
   public ModelAndView registProject(ProjectVo projectVo) throws JSONException {
      
      int result = mainService.insertProject(projectVo);
      ModelAndView mav = new ModelAndView("roadmapMain");
      mav.addObject("result", result);
      
      loadData(mav);
      
      return mav;   
   }
   /**
    * 프로젝트 변경
    * @throws JSONException 
    */
   @RequestMapping(value="/modifyProject",method=RequestMethod.POST)
   public ModelAndView modifyProject(ProjectVo projectVo) throws JSONException {
      
      int result = mainService.updateProject(projectVo);
      ModelAndView mav = new ModelAndView("roadmapMain");
      mav.addObject("result", result);
      
      loadData(mav);
      
      return mav;   
   }
   
   /**
    * 프로젝트 삭제
    * @throws JSONException 
    */
   @RequestMapping(value="/deleteProject",method=RequestMethod.POST)
   public ModelAndView deleteProject(ProjectVo projectVo) throws JSONException {
	   
      int result = mainService.deleteProject(projectVo.getP_Id());
      ModelAndView mav = new ModelAndView("roadmapMain");
      mav.addObject("result", result);
      
      loadData(mav);
   
      return mav;   
   }
   
   public JSONArray getProjectGroup(List<TeamVo> teamList, List<ProjectVo> projectList) throws JSONException {
		JSONArray jsonArr = new JSONArray();
	    String      teamId;
	    //팀 id, 팀 이름, 그룹이름,
	    for (TeamVo teamVo : teamList) {
	  		teamId = teamVo.getT_Id();
	         
	        JSONObject jsonTeamObj = new JSONObject();
	         
	        jsonTeamObj.put("id", teamId);
	      	jsonTeamObj.put("className"	, teamVo.getT_Id());
	        jsonTeamObj.put("content", teamVo.getT_Name());
	        jsonTeamObj.put("showNested", false);
	        jsonArr.put(jsonTeamObj);
	         
	        List<String> nest = new ArrayList<String>();
	         
	        for (ProjectVo vo : projectList) {
	            if (teamId.equals(vo.getT_Id())) {
	            	nest.add(vo.getP_Id());
	            	JSONObject jsonObj = new JSONObject();
	            	jsonObj.put("id"		, vo.getP_Id() );
	            	jsonObj.put("content"	, vo.getP_Name());
	            	jsonArr.put(jsonObj);
	           	}
	        }
	         
	        jsonTeamObj.put("nestedGroups", nest);
	         
		}
		return jsonArr;
	}

   public JSONArray getProjectInformation(List<TeamVo> teamList, List<ProjectVo> projectList, List<MilestoneVo> milestone) throws JSONException {
		
	   JSONArray jsonArr = new JSONArray(); 
	         
	  	for (ProjectVo vo : projectList) {
	    	JSONObject jsonObj = new JSONObject();
	      	jsonObj.put("group"		, vo.getP_Id());
	      	jsonObj.put("className"	, vo.getP_Id());
	      	jsonObj.put("start"		, vo.getSt_Dt());
	    	jsonObj.put("end"		, vo.getEd_Dt());
	    	jsonObj.put("type"		, "background");
	   		jsonObj.put("id"		, vo.getP_Id());
	    	jsonObj.put("content"	, vo.getP_Name());
	       	jsonArr.put(jsonObj);          	
	  	}
	        
	  	for (MilestoneVo vo : milestone) {
	        JSONObject jsonObj = new JSONObject();
	        jsonObj.put("group"		, vo.getP_Id());
	        jsonObj.put("start"		, vo.getMs_Dt());//마일스톤 날짜
	        jsonObj.put("type"		, "point");
	        jsonObj.put("id"		, "m"+vo.getMs_Id());
	        jsonObj.put("content"	,"");
	        jsonObj.put("title"	, vo.getMs_Cntnt());
	        jsonArr.put(jsonObj);
	            
		}
		return jsonArr;
   }
   
   // 공통 작업
   public ModelAndView loadData(ModelAndView mav) throws JSONException{
	   
	   List<TeamVo> teamList = mainService.selectTeamList();
	   mav.addObject("teamList", teamList);
      
	   List<ProjectVo> projectList = mainService.selectProjectList();
	   mav.addObject("projectAllList", projectList);
      
	   List<MilestoneVo> milestoneList = mainService.selectAllMilestoneList();
	   JSONArray jsonArr = getProjectInformation(teamList, projectList, milestoneList);
	   mav.addObject("projectList", jsonArr);

	   JSONArray jsonArrGroup = getProjectGroup(teamList, projectList);
	   mav.addObject("projectGroup", jsonArrGroup);
	   
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
   public ModelAndView roadmapHistory(Model model) {
	   
	   ModelAndView mav = new ModelAndView("roadmapHistory");
	   
	   List<TeamVo> teamList = mainService.selectTeamList();
	   mav.addObject("teamList", teamList);
//	   List<HistoryVO> histList = mainService.getRoadmapHistory();
//	   mav.addObject("histList", histList);
      
	   return mav;
   }
   
}