<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>로드맵 변경이력</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/css/slick.grid.css" type="text/css"/>
	<link rel="stylesheet" href="/css/jquery-ui-1.8.16.custom.css" type="text/css"/>
	<link rel="stylesheet" href="/css/example.css" type="text/css"/>
	
	<style>
	.slick-cell-checkboxsel {
		background: #f0f0f0;
		border-right-color: silver;
		border-right-style: solid;
	 </style>
	 
	 <script src="/js/jquery-1.7.min.js"></script>
	 <script src="/js/jquery.event.drag-2.2.js"></script>
	 
	 <script src="/js/slick.core.js"></script>
	 
	 <script src="/plugins/slick.rowselectionmodel.js"></script>
	 <script src="/js/slick.grid.js"></script>
	 <script src="/js/slick.dataview.js"></script>
	 
	 <script>
	var dataView = new Slick.Data.DataView();
	var grid;
	var columns = [
		{id: "updt_Dt", name: "일자", field: "ms_Dt"},
		{id: "his_Cntnt", name: "내용", field: "ms_Cntnt"},
		{id: "writer", name: "작성자", field: "writer"},
	];
	var options = {
		enableCellNavigation: true,
		enableColumnReorder: false,
		forceFitColumns: true,
	}
	
	//Make the grid respond to DataView change events.
	dataView.onRowCountChanged.subscribe(function (e, args) {
		grid.updateRowCount();
		grid.render();
	});
	
	dataView.onRowsChanged.subscribe(function (e, args) {
		grid.invalidateRows(args.rows);
		grid.render();
	});
	
	$(function () {
		// 그리드 생성
	    grid = new Slick.Grid("#myGrid", dataView, columns, options);
	    grid.setSelectionModel(new Slick.RowSelectionModel({selectActiveRow: false}));
	    
	});
	
	
	</script>
</head>
<body>
    <div class="container-fluid">
    	<div id="myGrid"></div>
    </div>
</body>
</html>