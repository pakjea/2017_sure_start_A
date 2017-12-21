package com.sure.c1s3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.sure.c1s3.vo.TeamVo;

@Repository
@Mapper
public interface MainDao {
	
	@Select("SELECT * FROM teamA.TEAM")
	List<TeamVo> selectTeam();
}
