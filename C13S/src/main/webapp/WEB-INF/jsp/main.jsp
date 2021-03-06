<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
 <script src="http://visjs.org/dist/vis.js"></script>
 <link href="http://visjs.org/dist/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />
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

.vis-item {
  border-color: #006fff;
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

</style>
<script>

$(document).ready(function() {
   /* ############## 버튼 이벤트  ################ */
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
       $('#milestoneModal').modal('show');
    });
    
//     $("#modifyMilestoneBtn").on("click", function() {
//        $('#milestoneModal').modal('show');
//     });
    
    $("#deleteMilestoneBtn").on("click", function() {
       alert("마일스톤 삭제");
    });
    
    $("#goHistory").on("click", function() {
       alert("프로젝트 변경이력 화면 이동");
    });
    /* ############## 버튼 이벤트  ################ */
    
    
    
    /* ############## 타임라인 그래프  ################ */
    
    var data = ${projectList};
   console.log(data);
    
   
   
   
   // timeline을 넣을 곳,
   var container = document.getElementById('visualization');
   
   //group 생성, 일부러 nested 그룹도 생성
   
   
//    var groups = new vis.DataSet([
//         {id: "cs", content: 'CS',nestedGroups:csGroup },
// //         {id: "cs1", content: "프로젝트  CS1"},
// //         {id: "cs2", content: "프로젝트  CS2"},
        
//         {id: "qs", content: 'QS',nestedGroups:qsGroup },
// //         {id: "qs1", content: "프로젝트 CS1"},
// //         {id: "qs2", content: "프로젝트 QS2"},
        
//         {id: "carS", content: '차량솔루션센터',nestedGroups:carGroup },
// //         {id: "car1", content: "프로젝트 CAR1"},
// //         {id: "car2", content: "프로젝트 CAR2"},
        
//         {id: "se", content: 'SE',nestedGroups:seGroup }
// //         {id: "se1", content: "프로젝트 SE1"},
// //         {id: "se2", content: "프로젝트 SE2"}
//    ]);
   
   
    csGroup   = ["cs1","cs2"]; //cs프로젝트
    qsGroup   = ["qs1","qs2"]; 
    carGroup  = ["car1","car2"];
    seGroup   = ["se1","se2"];
   
    
    var groups = new vis.DataSet(data);

   
   
   // 각 그룹에 표시할 데이타 생성 및 연결
   var items = new vis.DataSet([
      {id: 1, content: "프로젝트  CS1", start: '2017-03-01', end: '2017-03-30', type: "background" ,group: "cs1",style:"background-color:red"},
      {id: 2, content: "", start: '2017-03-08', type:"point" , group: "cs1",title:"Hello"}
   ]);
   
   // 타임라인 옵션
   var options = {
        orientation:{
           axis:'both',
           item:'top'
        },
        tooltip:{
           followMouse:true,
        },
        verticalScroll: true,
        min:'2017-01-01',  /*타임라인 시작 지정*/
        max:'2017-12-31',  /*타임라인 끝 지정*/
        maxHeight: 600     /*타임라인 높이 지정, 넘으면 세로 스크롤*/
   };
   
   // 타임라인 생성/ 화면에 보임
   var timeline = new vis.Timeline(container, items, groups, options);
   timeline.fit();
   
   /* ############## 타임라인 그래프  ################ */
   
   function test(id, content, tId){
      groups.add()
   }

});
</script>
 
</head>
<body>
   <div class="container-fluid">
     <div class="row">
      <div class="col">
         <h1>팀</h1>
         <div class="input-group">
            <c:forEach items="${teamList}" var="team">
                <input type="checkbox"><label for="teamId">${team.t_Name}</label><br>
            </c:forEach>
         </div>
         <button type="button" onclick='test()'>test</button>
      </div><!-- .left -->
      
      <div class="col-10">
         <h1>슈어소프트테크</h1>
         
         <button type="button" class="btn btn-primary" id="registProjectBtn" data-toggle="modal" data-target="#registProjectModal" data-whatever="">프로젝트 등록</button>
         <button type="button" class="btn btn-primary" id="modifyProjectBtn" data-toggle="modal" data-target="#modifyProjectModal" data-whatever="">프로젝트 수정</button>
         <button type="button" class="btn btn-primary" id="deleteProjectBtn">프로젝트 삭제</button>
         
         <button type="button" class="btn btn-primary" id="registMilestoneBtn" data-toggle="modal" data-target="#milestoneModal" data-whatever="">마일스톤 추가</button>
<!--          <button type="button" class="btn btn-primary" id="modifyMilestoneBtn" data-toggle="modal" data-target="#milestoneModal" data-whatever="">마일스톤 수정</button> -->
<!--          <button type="button" class="btn btn-primary" id="deleteMilestoneBtn" >마일스톤 삭제</button> -->
         
         <button type="button" class="btn btn-primary" id="goHistory">로그 확인</button>
         
         <div>
            <div id="visualization"></div>
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