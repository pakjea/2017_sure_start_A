package com.sure.c1s3.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sure.c1s3.service.MainService;
import com.sure.c1s3.vo.MilestoneVo;
import com.sure.c1s3.vo.ProjectVo;

@RestController
public class AjaxController {
	
	@Autowired
	private MainService mainService;
	
	/**
	 * 마일스톤 조회
	 */
	@RequestMapping(value="/getMilestones", method=RequestMethod.POST)
	public ArrayList<MilestoneVo> getMilestones(@RequestBody ProjectVo project){		
		
		ArrayList<MilestoneVo> data = new ArrayList<MilestoneVo>();
		
//		data = (ArrayList<MilestoneVo>) mainService.getMilestones(project);
		
		return data;
	}
	
	@RequestMapping(value="/deleteMilestones", method=RequestMethod.POST)
	public HashMap deleteMilestones(@RequestBody ArrayList<MilestoneVo> milestones){
		
		HashMap map = new HashMap<>();
//		int result = mainService.deleteMilestones(milestones);
//		map.put("result", result);
		map.put("result", 0);
		
		return map;
	}
}
