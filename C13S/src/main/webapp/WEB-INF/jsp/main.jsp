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
  This example demonstrates custom ordering of groups.
</p>
<div id="visualization"></div>

<script>
//팀 설정
  var groups = new vis.DataSet([
    {id: 0, content: 'CS', value: 1},
    {id: 1, content: 'QS', value: 2},
    {id: 2, content: '차량솔루션센터', value: 3}
  ]);

  // create a dataset with items
  // note that months are zero-based in the JavaScript Date object, so month 3 is April
  
  // 프로젝트 생성
  
  var items = new vis.DataSet([
    {id: 0, group: 0, content: 'CodeScroll', start: new Date(2014, 3, 17), end: new Date(2014, 3, 21)},
    {id: 1, group: 1, content: 'CodeScroll', start: new Date(2014, 3, 16), end: new Date(2014, 3, 24)},

    {id: 3, group: 0, content: 'CodeScroll', start: new Date(2014, 3, 17), end: new Date(2014, 3, 21)},
    {id: 4, group: 1, content: 'CodeScroll', start: new Date(2014, 3, 16), end: new Date(2014, 3, 24)},
    {id: 5, group: 0, content: 'CodeScroll', start: new Date(2014, 3, 17), end: new Date(2014, 3, 21)},
    {id: 6, group: 1, content: 'CodeScroll', start: new Date(2014, 3, 16), end: new Date(2014, 3, 24)},
    {id: 7, group: 0, content: 'CodeScroll', start: new Date(2014, 3, 17), end: new Date(2014, 3, 21)},
    {id: 8, group: 1, content: 'CodeScroll', start: new Date(2014, 3, 16), end: new Date(2014, 3, 24)},
    {id: 9, group: 0, content: 'CodeScroll', start: new Date(2014, 3, 17), end: new Date(2014, 3, 21)},
    {id: 10, group: 1, content: 'CodeScroll', start: new Date(2014, 3, 16), end: new Date(2014, 3, 24)},
    {id: 11, group: 0, content: 'CodeScroll', start: new Date(2014, 3, 17), end: new Date(2014, 3, 21)},
    {id: 12, group: 1, content: 'CodeScroll', start: new Date(2014, 3, 16), end: new Date(2014, 3, 24)},
    {id: 13, group: 0, content: 'CodeScroll', start: new Date(2014, 3, 17), end: new Date(2014, 3, 21)},
    {id: 14, group: 1, content: 'CodeScroll', start: new Date(2014, 3, 16), end: new Date(2014, 3, 24)},
    {id: 2, group: 2, content: 'Vista', start: new Date(2014, 3, 24), end: new Date(2014, 3, 27)}
  ]);

  // create visualization
  var container = document.getElementById('visualization');
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

</script>
</body>
</html>
