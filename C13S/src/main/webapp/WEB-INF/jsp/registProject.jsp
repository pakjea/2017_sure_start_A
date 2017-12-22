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
 		
 		$("#cancelRegPjtBtn").on("click", function() {
 			$('#registProjectModal').find('input').val("");
 		});
 	});
 </script>
</head>
<body>

	<form action="/registProject" method="POST">
		<div class="form-group">
		<label for="teamId">부서</label>
		<div class="input-group">
			<select id="teamId" name="t_Id" class="custom-select">
				<c:forEach items="${teamList}" var="team">
			 		<option label="${team.t_Name}" value="${team.t_Id}"></option>
				</c:forEach>
			</select>
		</div>
		</div>
		
		<div class="form-group">
		<label for="projectDate">프로젝트 일정</label>
		<div class="input-group">
		  <input type="date" class="form-control" id="startDate" name="st_Dt" value="${today}" required>
		  <div class="input-group-addon">to</div>
		  <input type="date" class="form-control" id="endDate" name="ed_Dt" value="${today}" required>
		</div>
		</div>
		
		<div class="form-group">
		<label for="projectName">프로젝트명</label>
		<div class="input-group">
		  <input type="text" class="form-control" id="projectName" name="p_Name" required>
		</div>
		</div>
		
		<div class="form-group">
		<label for="">프로젝트내용</label>
		<div class="input-group">
		  <input type="text" class="form-control" id="projectContent" name="p_Cntnt">
		</div>
		</div>
		
		<div class="form-group">
		<label for="">MM</label>
		<div class="input-group">
		  <input type="number" class="form-control" id="projectManMonth" name="p_Mm">
		</div>
		</div>
		
		<button type="submit" class="btn btn-primary">등록</button>
		<button type="button" class="btn btn-primary" data-dismiss="modal" id="cancelRegPjtBtn">취소</button>
	</form>
 	
</body>
</html>