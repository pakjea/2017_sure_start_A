<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>로드맵 등록</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</head>
<body>
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
</body>
</html>