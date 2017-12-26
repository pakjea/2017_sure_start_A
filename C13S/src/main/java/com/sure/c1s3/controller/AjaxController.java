package com.sure.c1s3.controller;

import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sure.c1s3.service.MainService;
import com.sure.c1s3.vo.HistoryVo;
import com.sure.c1s3.vo.MilestoneVo;

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
		
		int iMaxId = Integer.parseInt(mainService.selectMilestoneMaxId());
		int iHisCnt = 0;
		
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String historyId;
		
		int  	qCnt 	= 0;
		boolean bUpdate = false;
		for(MilestoneVo vo : milestonList) {
			bUpdate = false;
			for(MilestoneVo oldVo : oldList) {
				if(vo.getMs_Id().equals(oldVo.getMs_Id())) {
					bUpdate = true;
					break;
				}
			}
			
			int qSucess = 0;
			historyId = sdf.format(nowDate).toString() + String.format("%02d", iHisCnt);
			if(bUpdate) {
				qSucess = mainService.updateMilestone(vo);
				if(qSucess == 1) {
					qCnt += qSucess;
					insertMilestoneHistory(vo, "2", historyId);
				}
			} else {
				vo.setMs_Id(String.format("%08d", iMaxId));
				qSucess = mainService.insertMilestone(vo);
				if(qSucess == 1) {
					qCnt += qSucess;
					iMaxId++;
					insertMilestoneHistory(vo, "1", historyId);
				}
			}
			
			iHisCnt++;
		}
		
		int result;
		if (milestonList.size() == qCnt) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;
	}

	/**
	 * 마일스톤 삭제
	 */
	@RequestMapping(value="/deleteMilestones", method=RequestMethod.POST)
	public int deleteMilestones(@RequestBody List<MilestoneVo> milestonList){
		
		int iHisCnt = 0;
		
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String historyId;;
		
		int  	qCnt 	= 0;
		for(MilestoneVo vo : milestonList) {
			
			int qSucess = 0;
			qSucess = mainService.deleteMilestone(vo.getMs_Id());
			
			if(qSucess == 1) {
				qCnt += qSucess;
				historyId = sdf.format(nowDate).toString() + String.format("%02d", iHisCnt);
				insertMilestoneHistory(vo, "3", historyId);
				iHisCnt++;
			}
		}
		
		int result;
		if (milestonList.size() == qCnt) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;
		
	}
	
	/**
	 * 이력 저장
	 */
	public int insertMilestoneHistory(MilestoneVo milestoneVo, String division, String strDate){
		
		HistoryVo historyVo = new HistoryVo();
		if 		  (division.equals("1")) {	// 추가
			historyVo.setHis_Cntnt("마일스톤 추가");
		} else if (division.equals("2")) {	// 수정
			historyVo.setHis_Cntnt("마일스톤 수정");
		} else if (division.equals("3")) {	// 삭제
			historyVo.setHis_Cntnt("마일스톤 삭제");
		}
		
		historyVo.setHis_Id(strDate);
		historyVo.setP_Id(milestoneVo.getP_Id());
		historyVo.setT_Id(milestoneVo.getT_Id());
		historyVo.setMs_Id(milestoneVo.getMs_Id());
		historyVo.setEmp_Name(milestoneVo.getWriter());
		
		return mainService.insertHistory(historyVo);
	}
}
