<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>메인</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
 <script>
 
 	$("#registProjectBtn").on("click", function() {
 		$('#registProjectModal').modal('show');
 	});
 	
 	$("#modifyProjectBtn").on("click", function() {
 		$('#modifyProjectModal').modal('show');
 	});
 	
 	$("#deleteProjectBtn").on("click", function() {
 		alert("프로젝트 삭제");
 	});
 	
 	$("#registMilestoneBtn").on("click", function() {
 		alert("마일스톤 등록");
 		$('#milestoneModal').modal('show');
 	});
 	
 	$("#modifyMilestoneBtn").on("click", function() {
 		alert("마일스톤 수정");
 		$('#milestoneModal').modal('show');
 	});
 	
 	$("#deleteMilestoneBtn").on("click", function() {
 		alert("마일스톤 삭제");
 	});
 	
 	$("#goHistory").on("click", function() {
 		alert("프로젝트 변경이력 화면 이동");
 	});

 </script>
</head>
<body>
	<div class="container-fluid">
	  <div class="row">
		<div class="col">
			<h2>팀</h2>
			<div class="input-group">
				<input type="checkbox"><label for="teamId">팀1</label>
				<input type="checkbox"><label for="teamId">팀2</label>
				<input type="checkbox"><label for="teamId">팀3</label>
			</div>
		</div><!-- .left -->
		
		<div class="col-10">
			<h1>슈어소프트테크</h1>
			
			<button type="button" class="btn btn-primary" id="registProjectBtn" data-toggle="modal" data-target="#registProjectModal" data-whatever="">프로젝트 등록</button>
			<button type="button" class="btn btn-primary" id="modifyProjectBtn" data-toggle="modal" data-target="" data-whatever="">프로젝트 수정</button>
			<button type="button" class="btn btn-primary" id="deleteProjectBtn" data-toggle="modal" data-target="" data-whatever="">프로젝트 삭제</button>
			
			<button type="button" class="btn btn-primary" id="registMilestoneBtn" data-toggle="modal" data-target="" data-whatever="">마일스톤 추가</button>
			<button type="button" class="btn btn-primary" id="modifyMilestoneBtn" data-toggle="modal" data-target="" data-whatever="">마일스톤 수정</button>
			<button type="button" class="btn btn-primary" id="deleteMilestoneBtn" data-toggle="modal" data-target="" data-whatever="">마일스톤 삭제</button>
			
			<button type="button" class="btn btn-primary" id="goHistory" data-toggle="modal" data-target="" data-whatever="">로그 확인</button>
			
			<div>
				타임라인 영역
				<!-- 타임라인 영역 -->
			</div>
			
			<div class="modal fade" id="registProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
			    	<div class="modal-content">
			     		<div class="modal-body">
							<jsp:include page="registProject.jsp" />
						</div>
					</div>
				</div>
			</div><!-- .modal 프로젝트 등록 -->
			
			<div class="modal fade" id="modifyProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
			    	<div class="modal-content">
			     		<div class="modal-body">
							<jsp:include page="modifyProject.jsp" />
						</div>
					</div>
				</div>
			</div><!-- .modal 프로젝트 수정 -->
			
			<div class="modal fade" id="milestoneModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
			    	<div class="modal-content">
			     		<div class="modal-body">
							<jsp:include page="mileStone.jsp" />
						</div>
					</div>
				</div>
			</div><!-- .modal 마일스톤 등록, 수정 -->
			
		</div><!-- .right -->
	  </div><!-- .row -->
	</div><!-- .container-fluid -->
</body>
</html>