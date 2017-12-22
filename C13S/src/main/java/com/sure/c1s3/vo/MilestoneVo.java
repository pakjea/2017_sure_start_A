package com.sure.c1s3.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MilestoneVo {
	private String p_Id;
	private String t_Id;
	private String ms_Id;
	private String ms_Cntnt;
	private String ms_Dt;
	private String rgst_Dt;
	private String updt_Dt;
	private String writer;
	
	public String getP_Id() {
		return p_Id;
	}
	public void setP_Id(String p_Id) {
		this.p_Id = p_Id;
	}
	public String getT_Id() {
		return t_Id;
	}
	public void setT_Id(String t_Id) {
		this.t_Id = t_Id;
	}
	public String getMs_Id() {
		return ms_Id;
	}
	public void setMs_Id(String ms_Id) {
		this.ms_Id = ms_Id;
	}
	public String getMs_Cntnt() {
		return ms_Cntnt;
	}
	public void setMs_Cntnt(String ms_Cntnt) {
		this.ms_Cntnt = ms_Cntnt;
	}
	public String getMs_Dt() {
		return ms_Dt;
	}
	public void setMs_Dt(String ms_Dt) {
		this.ms_Dt = ms_Dt;
	}
	public String getRgst_Dt() {
		return rgst_Dt;
	}
	public void setRgst_Dt(String rgst_Dt) {
		this.rgst_Dt = rgst_Dt;
	}
	public String getUpdt_Dt() {
		return updt_Dt;
	}
	public void setUpdt_Dt(String updt_Dt) {
		this.updt_Dt = updt_Dt;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
