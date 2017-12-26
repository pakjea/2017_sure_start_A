<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="today"><fmt:formatDate pattern="yyyy-MM-dd" value="${now}" /></c:set>

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
	    
	    // 조회 버튼 클릭
	    $("#searchHistory").on("click", function() {
	    	var $field = $("#searchHistoryForm").find("input, select");
	    	var params = new Object();
	    	
	    	params["st_Dt"] = $("#startDate").val();
	    	params["ed_Dt"] = $("#endDate").val();
	    	params["t_Id"] = $("#teamId").val();
	    	
	    	getHistory(params);
	    });
	    
	});
	
	function getHistory(params) {
		
		$.ajax({ 
			type: "POST",
			url: rootContextPath + "/getHistoryList",
			contentType: "application/json", 
			dataType : 'json',
			data: JSON.stringify(params), 
			success: function(data) { 
				// This will fire the change events and update the grid.
				dataView.setItems(data, "his_Id");
			} 
		});
	}
	
	</script>
</head>
<body>
    <div class="container-fluid">
    	<div class="row">
    		<form class="form-inline" id="searchHistoryForm">
				<label for="startDate">기간</label>
				<div class="input-group" style="padding:10px;">
				  <input type="date" class="form-control" id="startDate" name="st_Dt" value="${today}" required>
				  <div class="input-group-addon">to</div>
				  <input type="date" class="form-control" id="endDate" name="ed_Dt" value="${today}" required>
				</div>
   			
				<label for="teamId">부서</label>
				<div class="input-group" style="padding:10px;">
					<select id="teamId" name="t_Id" class="custom-select">
						<c:forEach items="${teamList}" var="team">
					 		<option label="${team.t_Name}" value="${team.t_Id}"></option>
						</c:forEach>
					</select>
				</div>
				
				<button class="btn btn-primary" id="searchHistory">조회</button>
    		</form>
    	</div>
    	
    	<div class="row">
    		<div id="myGrid"></div>
    	</div>
    </div>
</body>
</html>