<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Html5Around.com Introduce vis.js</title>


<script src="http://visjs.org/dist/vis.js"></script>
<link href="http://visjs.org/dist/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div id="visualization"></div>
<class = "vis-item">dfsdf</class>
<style>
body {
    font-family: "Spoqa Han Sans",Malgun Gothic,"맑은 고딕",Dotum,"돋움",sans-serif;
    }

.vis-timeline {
  border: 2px solid purple;
  font-family: "Spoqa Han Sans";
  font-size: 14px;  /* 12pt */
  background:#d5ffff;
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
  border-width: 10px;
  border-radius: 10px;
}

.vis-item.vis-selected {
  border-color: green;
  background-color: lightgreen;
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
csGroup=["cs1","cs2"];
qsGroup=["qs1","qs2"];
carGroup=["car1","car2"];
seGroup=["se1","se2"];


// timeline을 넣을 곳,
var container = document.getElementById('visualization');

//group 생성, 일부러 nested 그룹도 생성 	
var groups = new vis.DataSet([
	  {id: "cs", content: 'CS',nestedGroups:csGroup },
	  {id: "cs1", content: "프로젝트  CS1"},
	  {id: "cs2", content: "프로젝트  CS2"},
	  
	  {id: "qs", content: 'QS',nestedGroups:qsGroup },
	  {id: "qs1", content: "프로젝트 CS1"},
	  {id: "qs2", content: "프로젝트 QS2"},
	  
	  {id: "carS", content: '차량솔루션센터',nestedGroups:carGroup },
	  {id: "car1", content: "프로젝트 CAR1"},
	  {id: "car2", content: "프로젝트 CAR2"},
	  
	  {id: "se", content: 'SE',nestedGroups:seGroup },
	  {id: "se1", content: "프로젝트 SE1"},
	  {id: "se2", content: "프로젝트 SE2"},
]);

// 각 그룹에 표시할 데이타 생성 및 연결
var items = new vis.DataSet([
  {id: 1, content: "CS", start: '2017-03-01', end: '2017-03-30', editable: true, group: "cs"},
  {id: 2, content: "계획", start: '2017-03-01', end: '2017-03-30', group: "cs1"},
  {id: 3, content: "현재", start: '2017-03-01', end: '2017-03-30', group: "cs1"},
  {id: 4, content: "계획", start: '2017-03-01', end: '2017-03-30', group: "cs2"},
  {id: 5, content: "현재", start: '2017-03-01', end: '2017-03-30', group: "cs2"},
  
  {id: 6, content: "CS", start: '2017-03-01', end: '2017-03-30', editable: true, group: "qs"},
  {id: 7, content: "계획", start: '2017-03-01', end: '2017-03-30', group: "qs1"},
  {id: 8, content: "현재", start: '2017-03-01', end: '2017-03-30', group: "qs1"},
  {id: 9, content: "계획", start: '2017-03-01', end: '2017-03-30', group: "qs2"},
  {id: 10, content: "현재", start: '2017-03-01', end: '2017-03-30', group: "qs2"},
  
  {id: 11, content: "CS", start: '2017-03-01', end: '2017-03-30', editable: true, group: "carS"},
  {id: 12, content: "계획", start: '2017-03-01', end: '2017-03-30', group: "car1"},
  {id: 13, content: "현재", start: '2017-03-01', end: '2017-03-30', group: "car1"},
  {id: 14, content: "계획", start: '2017-03-01', end: '2017-03-30', group: "car2"},
  {id: 15, content: "현재", start: '2017-03-01', end: '2017-03-30', group: "car2"},
  
  {id: 16, content: "CS", start: '2017-03-01', end: '2017-03-30', editable: true, group: "se"},
  {id: 17, content: "계획", start: '2017-03-01', end: '2017-03-30', group: "se1"},
  {id: 18, content: "현재", start: '2017-03-01', end: '2017-03-30', group: "se1"},
  {id: 19, content: "계획", start: '2017-03-01', end: '2017-03-30', group: "se2"},
  {id: 20, content: "현재", start: '2017-03-01', end: '2017-03-30', group: "se2"},
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
	  min:'2017-03-01',  /*타임라인 시작 지정*/
	  max:'2017-05-01',  /*타임라인 끝 지정*/
	  maxHeight: 450     /*타임라인 높이 지정, 넘으면 세로 스크롤*/
};

// 타임라인 생성/ 화면에 보임
var timeline = new vis.Timeline(container, items, groups, options);
timeline.fit();
</script>
</body>
</html>