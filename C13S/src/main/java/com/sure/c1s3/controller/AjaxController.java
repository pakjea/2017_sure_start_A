package com.sure.c1s3.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
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
		
		/*테스트용*/
		MilestoneVo milestone = new MilestoneVo();
		milestone.setMs_Id("123123");
		milestone.setMs_Cntnt("마일스톤 내용내용");
		data.add(milestone);
		/*테스트용*/
		
		//list = mainService.selectMilestoneList();
		
		return data;
	}
}
