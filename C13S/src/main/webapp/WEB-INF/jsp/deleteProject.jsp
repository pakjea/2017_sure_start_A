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
 <title>로드맵 삭제</title>
 <script>
 	$(document).ready(function(){
 		$("#canceldelPjtBtn").on("click", function() {
 			$('#deleteProjectModal').find('input').val("");
 		});
 	});
 </script>
</head>
<body>

	<form action="/deleteProject" method="POST">
		
		<div class="form-group">
		<label for="projectName">프로젝트명</label>
		<div class="input-group">
		  <input type="text" class="form-control" id="d_projectName" name="p_Name" value="" required>
		</div>
		</div>
		
		<div class="form-group">
		<label for="projectContent">프로젝트내용</label>
		<div class="input-group">
		  <input type="text" class="form-control" id="d_projectContent" name="p_Cntnt" value="">
		</div>
		</div>
		
		<p>이 프로젝트를 삭제 하시겠습니까?</p>
		
		<!-- TODO: 추후 히든으로 전환 : 프로젝트 아이디 -->
		p_Id<input type="text" id="d_p_Id" name="p_Id" value="">
		(TODO: 추후 히든으로 전환)
		
		<button type="submit" class="btn btn-primary">삭제</button>
		<button type="button" class="btn btn-primary" data-dismiss="modal" id="canceldelPjtBtn">취소</button>
	</form>
 	
</body>
</html>