<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
  <title>로드맵 </title>

  <style>
    body, html {
      font-family: arial, sans-serif;
      font-size: 11pt;
    }

    #visualization {
      box-sizing: border-box;
      width: 100%;
      height: 300px;
    }
  </style>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis.min.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis.min.css" rel="stylesheet" type="text/css" />
  
</head>
<body>

<p>
  Suresoft
</p>
<div class="container">
	<div class="check">
		<input type="checkbox" name="chk_info" value="CS">CS
		<input type="checkbox" name="chk_info" value="QS">QS
		<input type="checkbox" name="chk_info" value="QS">차량솔루션센터
		<input type="checkbox" name="chk_info" value="SE사업본부">SE사업본부
	</div>
	<div class="graph">
		<div id="visualization"></div>
	</div>
</div>
<div class="buttonlist">
	<button type="button" value="확인">프로젝트 등록</button>
	<button type="button" value="확인">프로젝트 삭제</button>
	<button type="button" value="확인">프로젝트 수정</button>
	<button type="button" value="확인">마일스톤</button>
	
</div>

<script>
//팀 설정

var container = document.getElementById('visualization');

  var groups = new vis.DataSet([
    {id: 0, content: "CS",  nestedGroups : [1,2]},
    {id: 1, content: 'QS'},
    {id: 2, content: '차량솔루션센터'},
  ]);

  // create a dataset with items
  // note that months are zero-based in the JavaScript Date object, so month 3 is April
  
  // 프로젝트 생성
  
  var items = new vis.DataSet([
    {id: 0, group: 0, content : "왜안돼", start: new Date(2014, 3, 16), end: new Date(2014, 3, 24)},
    {id: 1, group: 1, content: 'CodeScroll', start: new Date(2014, 3, 16), end: new Date(2014, 3, 24)},
    {id: 2, group: 2, content: 'Vista', type : "point",  start: new Date(2014, 3, 24)},
    {id: 3, group: 2, content: 'Vista', type : "point",  start: new Date(2014, 4, 24)},//프로젝트 포인트 지정
  ]);

  // create visualization
 
  var options = {
    groupOrder: function (a, b) {
      return a.value - b.value;
    },
    editable: true
  };

  var timeline = new vis.Timeline(container);
  timeline.setOptions(options);
  timeline.setGroups(groups);
  timeline.setItems(items);
  timeline.fit();

</script>


</body>
</html>