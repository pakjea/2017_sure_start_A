<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<%
String contextPath = request.getContextPath();
%>
<script type="text/javascript">
    var rootContextPath = "<%=contextPath%>";
</script>

 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>메인</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
 <script src="http://visjs.org/dist/vis.js"></script>
 <link href="http://visjs.org/dist/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />
  
  <link rel="stylesheet" href="/css/slick.grid.css" type="text/css"/>
  <link rel="stylesheet" href="/css/jquery-ui-1.8.16.custom.css" type="text/css"/>
  <link rel="stylesheet" href="/css/example.css" type="text/css"/>
 
  <script src="/js/jquery-1.7.min.js"></script>
  <script src="/js/jquery.event.drag-2.2.js"></script>
  <script src="/js/jquery-ui-1.8.16.custom.min.js"></script>
 
  <script src="/js/slick.core.js"></script> 
  <script src="/js/slick.dataview.js"></script>
  <script src="/js/slick.formatters.js"></script>
  <script src="/js/slick.editors.js"></script>
  <script src="/js/slick.grid.js"></script>
 <style>
body {
    font-family: "Spoqa Han Sans",Malgun Gothic,"맑은 고딕",Dotum,"돋움",sans-serif;
    }

.vis-timeline {
  border: 2px solid purple;
  font-family: "Spoqa Han Sans";
  font-size: 14px;  /* 12pt */
  background:#F0F8FF;
}

.vis-item.expected{
  border-style:dashed!important;
  z-index:0;
};

.vis-item {
  border-color: white;
  background-color:greenyellow;
  font-size: 15px;
  color: #1a1a1a;
}

.vis-item,
.vis-item.vis-line {
  border-width: 3px;
}

.vis-item.vis-dot {
  border-width: 5px;
  border-radius: 5px;
  border-color: white;
}

.vis-item.vis-selected {
  border-color: green;
  background-color: lightgreen;
}

.vis-item.vis-background{
  background-color: #bfbfbf;
}

.vis-time-axis .vis-text {
  color: #1a1a1a;
  padding-top: 10px;
  padding-left: 10px;
}

.vis-time-axis .vis-text.vis-major {
  font-weight: bold;
}

.vis-time-axis .vis-grid.vis-minor {
  border-width: 2px;
  border-color:#caf2fc;
}

.vis-time-axis .vis-grid.vis-major {
  border-width: 2px;
  border-color: #7be6ff;
}

input[type=checkbox]
{
  /* Double-sized Checkboxes */
   -ms-transform: scale(1.2); /* IE */
   -moz-transform: scale(1.2); /* FF */
   -webkit-transform: scale(1.2); /* Safari and Chrome */
   -o-transform: scale(1.2); /* Opera */
   padding: 10px; */
}
div.vis-item.vis-background.expected {
	background: #f0f8ff
}

</style>
<script>

var dataGroup	 = ${projectGroup};
var dataItem  	 = ${projectList};
//group 생성, 일부러 nested 그룹도 생성    
var groups = new vis.DataSet(dataGroup);

// 각 그룹에 표시할 데이타 생성 및 연결
var items = new vis.DataSet(dataItem);

//타임라인 옵션
var options1 = {
	orientation:{
		axis:'both',
		item:'top'
	},
	tooltip:{
		followMouse:true,
	},
	groupOrder:function(a,b){
		return a.id - b.id;
	},
	verticalScroll: true,
	//min:'2017-01-01',  /*타임라인 시작 지정*/
	//max:'2017-12-31',  /*타임라인 끝 지정*/
	maxHeight: 600     /*타임라인 높이 지정, 넘으면 세로 스크롤*/
};

$(document).ready(function() {
	
 	/* ############## 결과 이벤트  ################ */
 	var result = ${result};
 	if(result == 1) {
 		alert("저장이 완료되었습니다.");
 	} else if(result == 0) {
 		alert("저장에 실패했습니다.");
 	} 
 	/* ############## 결과 이벤트  ################ */
 	
 	/* ############## 타임라인 그래프  ################ */

 	var projectList  = ${projectAllList};
	   
// 	timeline을 넣을 곳,
// 	var container = document.getElementById('visualization');
	
	// 타임라인 생성/ 화면에 보임
	var timeline = new vis.Timeline(document.getElementById('visualization'), items, groups, options1);
	timeline.fit();	

	var selProjectId, selTeamId;
	document.getElementById('visualization').onclick = function (event) {

        var props = timeline.getEventProperties(event);
        selProjectId = props.group;        
        
        if($("div.vis-label.vis-nesting-group."+selProjectId).hasClass("expanded")==true){
        	$("#"+selProjectId).attr('checked', true);
        }else{
        	$("#"+selProjectId).attr('checked', false);
        }
        
        $("div.vis-item.vis-background").css("background", "#bfbfbf");
        $("div.vis-item.vis-background."+selProjectId).css("background", "#0069d9");
        $("div.vis-item.vis-background.expected").css("background", "#f0f8ff");
        
//         toggleButton(selProjectId.length);
	}
	
// 	toggleButton(0);
	
// 	$("div.vis-label.vis-nesting-group."+selProjectId+".expanded").on("click",function(){
// 		console.log();
// 	});
	
	/* ############## 버튼 이벤트  ################ */
	$("#registProjectBtn").on("click", function() {
		
 	});
 	
 	$("#modifyProjectBtn").on("click", function() {
 		$.each(projectList,function(key,value) {
 			if (value.p_Id == selProjectId) {
	 			$("#m_teamId").val(value.t_Id);
	 			$('#m_projectName').val(value.p_Name);
	 			$('#m_startDate').val(value.st_Dt);
	 			$('#m_endDate').val(value.ed_Dt);
	 			$('#m_projectContent').val(value.p_Cntnt);
	 			$('#m_projectManMonth').val(value.p_Mm);
	 			$('#m_p_Id').val(value.p_Id);
	 			
	 			return false;
 			}
		});
 	});
 	
 	$("#deleteProjectBtn").on("click", function() {
 		if(!confirm("삭제하시겠습니까?")) return;
 		var $form = $("#form_delPgt");
 		$.each(projectList,function(key,value) {
 			if (value.p_Id == selProjectId) {
 				$form.find("#delPjt_pId").val(value.p_Id);
 		 		$form.find("#delPjt_pName").val(value.p_Name);	
 		 		$form.find("#delPjt_tId").val(value.t_Id);
 		 		
 		 		return false;
 			}
		});

 		$("#form_delPgt").submit();
 	});
 	
 	$("#registMilestoneBtn").on("click", function() {
 		$.each(projectList,function(key,value) {
 			if (value.p_Id == selProjectId) {
 				selTeamId = value.t_Id;
	 			return false;
 			}
		});
 		getMilestones(selProjectId, selTeamId);
 	});
 	
 	$("#goHistory").on("click", function() {
 		location.href = rootContextPath + "/roadmapHistory";
 		return false;
 	});
 	/* ############## 버튼 이벤트  ################ */
});

function check(box){
	
	var nest = groups.get({
        fields: ['nestedGroups'],
        filter: function (item) {
             return item.id == box.value;
           }
        })[0];
	
	if(box.checked==true){
		groups.update({id : box.value, showNested : true});//
		
		for(var j in nest.nestedGroups){
			groups.update({id : nest.nestedGroups[j], visible : true});
		}
	}else{
		groups.update({id : box.value, showNested : false});//
		
		for(var j in nest.nestedGroups){
			groups.update({id : nest.nestedGroups[j], visible : false});
		}
	}
}

function toggleButton(flag) {
	var $btnGroup = $("#modifyProjectBtn, #deleteProjectBtn, #registMilestoneBtn");
	
	if(flag > 0) { // selProjectId가 있으면
		$btnGroup.removeClass("btn-default").addClass("btn-primary");
		$btnGroup.disabled(false);
	} else {
		$btnGroup.removeClass("btn-primary").addClass("btn-default");
		$btnGroup.disabled(true);
	}
}

</script>
 
</head>
<body>
	<div class="container-fluid">
	  <div class="row">
		<div class="col-2">
			<h1><img src="/images/logo.png" width="220"/></h1>
			<div class="form-check">
				<c:forEach items="${teamList}" var="team">
			 		<label class="form-check-label" for="${team.t_Id}"><input class="form-check-input" type="checkbox" id="${team.t_Id}" value="${team.t_Id}" onClick="check(this)">${team.t_Name}</label><br>
				</c:forEach>
			</div>
		</div><!-- .left -->
		
		<div class="col-10" style="padding-top:20px;">
			
			<div class="btn-group" role="group" >
				<button type="button" class="btn btn-lg btn-primary" id="registProjectBtn" data-toggle="modal" data-target="#registProjectModal" data-whatever="">프로젝트 등록</button>
				<button type="button" class="btn btn-lg btn-primary" id="modifyProjectBtn" data-toggle="modal" data-target="#modifyProjectModal" data-whatever="">프로젝트 수정</button>
				<button type="button" class="btn btn-lg btn-primary" id="deleteProjectBtn" data-toggle="modal" data-target="#deleteProjectModal" data-whatever="">프로젝트 삭제</button>
			</div>
			
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-lg btn-primary" id="registMilestoneBtn" data-toggle="modal" data-target="#milestoneModal" data-whatever="">마일스톤</button>
				<button type="button" class="btn btn-lg btn-primary" id="goHistory">로그 확인</button>
			</div>
			
			<div style="margin-top:10px">
				<div id="visualization"></div>
			</div>
			
			<div class="modal fade" id="registProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
				<div class="modal-dialog" role="document">
			    	<div class="modal-content">
			     		<div class="modal-body">
							<jsp:include page="registProject.jsp" />
						</div>
					</div>
				</div>
			</div><!-- .modal 프로젝트 등록 -->
			
			<div class="modal fade" id="modifyProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
				<div class="modal-dialog" role="document">
			    	<div class="modal-content">
			     		<div class="modal-body">
							<jsp:include page="modifyProject.jsp" />
						</div>
					</div>
				</div>
			</div><!-- .modal 프로젝트 수정 -->
			
			<jsp:include page="deleteProject.jsp" />
			<!-- 프로젝트 삭제 FORM -->
			
			<div class="modal fade" id="milestoneModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
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