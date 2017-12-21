<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="today"><fmt:formatDate pattern="yyyy-MM-dd" value="${now}" /></c:set>


<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>로드맵 등록</title>
 <script>
 	$(document).ready(function(){
 		
 		$("#cancelModPjtBtn").on("click", function() {
 			$('#modifyProjectModal').find('input').val("");
 		});
 	});
 </script>
</head>
<body>

	<form action="/modifyProject" method="POST">
		<div class="form-group">
		<label for="teamId">부서</label>
		<div class="input-group">
			<select id="teamId" name="t_Id" class="custom-select">
				<option label="메인에서선택한.." value="0"></option>
			</select>
		</div>
		</div>
		
		<div class="form-group">
		<label for="startDate">프로젝트 일정</label>
		<div class="input-group">
		  <input type="date" class="form-control" id="startDate" name="st_DT" value="" required>
		  <div class="input-group-addon">to</div>
		  <input type="date" class="form-control" id="endDate" name="ed_DT" value="" required>
		</div>
		</div>
		
		<div class="form-group">
		<label for="projectName">프로젝트명</label>
		<div class="input-group">
		  <input type="text" class="form-control" id="projectName" name="p_Name" value="" required>
		</div>
		</div>
		
		<div class="form-group">
		<label for="projectContent">프로젝트내용</label>
		<div class="input-group">
		  <input type="text" class="form-control" id="projectContent" name="p_Cntnt" value="">
		</div>
		</div>
		
		<div class="form-group">
		<label for="projectManMonth">MM</label>
		<div class="input-group">
		  <input type="number" class="form-control" id="projectManMonth" name="p_Mm" value="">
		</div>
		</div>
		
		<div class="form-group">
		<label for="historyContent">변경 사유</label>
		<div class="input-group">
		  <input type="text" class="form-control" id="historyContent" name="his_Cntnt" value="">
		</div>
		</div>
		
		<!-- TODO: 추후 히든으로 전환 : 프로젝트 아이디 -->
		p_Id<input type="text" id="historyContent" name="p_Id" value="">
		(TODO: 추후 히든으로 전환)
		
		<button type="submit" class="btn btn-primary">수정</button>
		<button type="button" class="btn btn-primary" data-dismiss="modal" id="cancelModPjtBtn">취소</button>
	</form>
 	
</body>
</html>