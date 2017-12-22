package com.sure.c1s3.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class HistoryVo {
	private String his_Id;
	private String his_Cntnt;
	private String p_Id;
	private String t_Id;
	private String rgst_Dt;
	private String updt_Dt;
	
	public String getHis_Id() {
		return his_Id;
	}
	public void setHis_Id(String his_Id) {
		this.his_Id = his_Id;
	}
	public String getHis_Cntnt() {
		return his_Cntnt;
	}
	public void setHis_Cntnt(String his_Cntnt) {
		this.his_Cntnt = his_Cntnt;
	}
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
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
