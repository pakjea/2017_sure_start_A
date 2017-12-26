package com.sure.c1s3.controller;

import java.util.List;
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
	public List<MilestoneVo> getMilestones(@RequestBody String p_Id){
		List<MilestoneVo> milestoneList = mainService.selectMilestoneList(p_Id);
		return milestoneList;
	}
	
	/**
	 * 마일스톤 수정
	 */
	@RequestMapping(value="/saveMilestones", method=RequestMethod.POST)
	public int saveMilestones(@RequestBody List<MilestoneVo> milestonList){
		
		List<MilestoneVo> oldList = mainService.selectMilestoneList(milestonList.get(0).getP_Id()); 
	
		int  	qCnt 	= 0;
		boolean bUpdate = false;
		for(MilestoneVo vo : milestonList) {
			System.out.println(vo);
			bUpdate = false;
			for(MilestoneVo oldVo : oldList) {
				if(vo.getMs_Id().equals(oldVo.getMs_Id())) {
					bUpdate = true;
					break;
				}
			}
			
			if(bUpdate) {
				qCnt += mainService.updateMilestone(vo);
				System.out.println("Update");
			} else {
				qCnt += mainService.insertMilestone(vo);
				System.out.println("Insert");
			}
			System.out.println(qCnt);
		}
		
		int result;
		if (milestonList.size() == qCnt) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;
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
