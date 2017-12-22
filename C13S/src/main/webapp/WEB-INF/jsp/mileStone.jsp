<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
 <title>마일스톤</title>

 <link rel="stylesheet" href="/css/slick.grid.css" type="text/css"/>
 <link rel="stylesheet" href="/css/jquery-ui-1.8.16.custom.css" type="text/css"/>
 <link rel="stylesheet" href="/css/example.css" type="text/css"/>
 
 <script src="/js/jquery-1.7.min.js"></script>
 <script src="/js/jquery.event.drag-2.2.js"></script>
 
 <script src="/js/slick.core.js"></script>
 <script src="/js/slick.grid.js"></script>
 <script src="/js/slick.dataview.js"></script>
 
 <script>
  var dataView = new Slick.Data.DataView();
  var grid;
  var columns = [
    {id: "ms_Dt", name: "일자", field: "ms_Dt"},
    {id: "ms_Cntnt", name: "내용", field: "ms_Cntnt"},
    {id: "writer", name: "작성자", field: "writer"},
  ];
  var options = {
    enableCellNavigation: true,
    enableColumnReorder: false,
    forceFitColumns: true
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
//     var data = [];
//     for (var i = 0; i < 100; i++) {
//       data[i] = {
//     		  ms_Dt: "일자 " + i,
//     		  ms_Cntnt: "마일스톤 내용" + i,
//     		  writer: "작성자" + i
//       };
//     }
    grid = new Slick.Grid("#myGrid", dataView, columns, options);
    
    //grid.invalidate();
    
  });
  
  function getMilestones(){
	  alert("마일스톤 조회");
	  var project = { p_Id: "123", testTags: [{id: "1111", tag: "2222"}] }; 

	  $.ajax({ 
		  type: "POST", 
		  url: "/getMilestones", 
		  contentType: "application/json", 
		  dataType : 'json',
		  data: JSON.stringify(project), 
		  success: function(data) { 
			  console.log(data); 
			  // This will fire the change events and update the grid.
			  dataView.setItems(data, "ms_Id");
		  } 
	  });
  }
 </script>
</head>
<body>
	<div class="row">	
		<div class="col-12">
			<div class="btn-group float-right" role="group">
			    <button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false">
				  추가
				</button>
				<button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false">
				  삭제
				</button>
			</div>
		</div>
	</div>
	
    <div class="row">	
		<div class="col-12">
	    	<div id="myGrid" style="width:460px;height:200px;margin:5px;"></div>
	    </div>
    </div>
	
	<div class="row">	
		<div class="col-12">
			<div class="btn-group text-center" role="group">
				<button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false">
				  저장
				</button>
				<button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false">
				  취소
				</button>
			</div>
		</div>
	</div>

</body>
</html>