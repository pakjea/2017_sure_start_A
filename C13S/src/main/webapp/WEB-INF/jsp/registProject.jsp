<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>로드맵 등록</title>

</head>
<body>
<!-- 
	<label for="teamId">부서</label>
	<div class="input-group">
	  <input type="text" class="form-control" id="teamId">
	</div>
	<label for="projectDate">프로젝트 일정</label>
	<div class="input-group">
	  <input type="date" class="form-control" id="startDate">
	  <input type="date" class="form-control" id="endDate">
	</div>
	<label for="projectName">프로젝트명</label>
	<div class="input-group">
	  <input type="text" class="form-control" id="projectName">
	</div>
	<label for="">프로젝트내용</label>
	<div class="input-group">
	  <input type="text" class="form-control" id="">
	</div>
	<label for="">MM</label>
	<div class="input-group">
	  <input type="text" class="form-control" id="">
	</div>
	
	<button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false">
	  저장
	</button>
	<button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false">
	  취소
	</button>
 -->
 <form action='saveProject' method='POST'>
    <input name='t_Id' value='world'>
 	<input type="submit" class="btn btn-primary" value="저장">
 </form>
 	
</body>
</html>