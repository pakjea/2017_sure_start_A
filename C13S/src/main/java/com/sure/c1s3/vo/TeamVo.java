package com.sure.c1s3.vo;

public class TeamVo {
	
	private String t_Id;
	private String t_Name;
	
	public TeamVo(String t_Id, String t_Name) {
		this.t_Id = t_Id;
		this.t_Name = t_Name;
	}
	
	public String getT_Id() {
		return t_Id;
	}
	public void setT_Id(String t_Id) {
		this.t_Id = t_Id;
	}
	public String getT_Name() {
		return t_Name;
	}
	public void setT_Name(String t_Name) {
		this.t_Name = t_Name;
	}
}
