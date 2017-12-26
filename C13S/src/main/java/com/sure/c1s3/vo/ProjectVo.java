package com.sure.c1s3.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ProjectVo {
	private String t_Id;
	private String p_Id;
	private String p_Name;
	private String p_Cntnt;
	private String p_Mm;
	private String st_Dt;
	private String ed_Dt;
	private String rgst_Dt;
	private String updt_Dt;
	private String his_Cntnt;
	
	public String getT_Id() {
		return t_Id;
	}
	public void setT_Id(String t_Id) {
		this.t_Id = t_Id;
	}
	public String getP_Id() {
		return p_Id;
	}
	public void setP_Id(String p_Id) {
		this.p_Id = p_Id;
	}
	public String getP_Name() {
		return p_Name;
	}
	public void setP_Name(String p_Name) {
		this.p_Name = p_Name;
	}
	public String getP_Cntnt() {
		return p_Cntnt;
	}
	public void setP_Cntnt(String p_Cntnt) {
		this.p_Cntnt = p_Cntnt;
	}
	public String getP_Mm() {
		return p_Mm;
	}
	public void setP_Mm(String p_Mm) {
		this.p_Mm = p_Mm;
	}
	public String getSt_Dt() {
		return st_Dt;
	}
	public void setSt_Dt(String st_Dt) {
		this.st_Dt = st_Dt;
	}
	public String getEd_Dt() {
		return ed_Dt;
	}
	public void setEd_Dt(String ed_Dt) {
		this.ed_Dt = ed_Dt;
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
	
	public String getHis_Cntnt() {
		return his_Cntnt;
	}
	public void setHis_Cntnt(String his_Cntnt) {
		this.his_Cntnt = his_Cntnt;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
