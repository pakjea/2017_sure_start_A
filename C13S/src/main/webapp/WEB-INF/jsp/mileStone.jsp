<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
 <title>마일스톤</title>



 
 <script>
  var dataView = new Slick.Data.DataView();
  var grid;
  var columns = [
    {id: "ms_Dt"	, name: "일자"	, field: "ms_Dt"	, editor: Slick.Editors.Date},
    {id: "ms_Cntnt"	, name: "내용"	, field: "ms_Cntnt"	, editor: Slick.Editors.Text},
    {id: "writer"	, name: "작성자"	, field: "writer"	, editor: Slick.Editors.Text},
  ];
  var options = {
    enableCellNavigation: true,
    enableColumnReorder: false,
    enableAddRow: true,
    forceFitColumns: true,
    editable: true,
    autoEdit: false
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
  
  $(document).ready(function () {
	  
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
    
//     $("#ui-datepicker-div").offset();
	  $("#ui-datepicker-div").css("z-index", 1000);
    
    $("#addMilestoneBtn").on("click", function() {
    	console.log("add row");
    	addRow();
//     	var data = {
//         };
//     	dataView.beginUpdate();
//     	dataView.addItem(data, "ms_Id");
//     	dataView.endUpdate();
 	});
    
    $("#saveMilestoneBtn").on("click", function() {
    	console.log("Save row");
    	var gridData = dataView.getItems();
    	console.log(gridData);
    	
    	$.ajax({ 
 		  	type: "POST", 
 		  	url: rootContextPath + "/saveMilestones", 
 		  	contentType: "application/json",
 		  	dataType: "json",
 		  	data: JSON.stringify(gridData), 
 		  	success: function(data) { 
 			  	if (data == 1) {
 			  		alert("수정되었습니다.");
 			  	} else {
 			  		alert("Error");
 			  	}
 		  	} 
 	  	});
    	
 	});
    
  });
  
  function getMilestones(selP_Id){
 		console.log(selP_Id);
 	  	$.ajax({ 
 		  	type: "POST", 
 		  	url: rootContextPath + "/getMilestones", 
 		  	contentType: "application/json",
 		  	data: selP_Id, 
 		  	success: function(data) { 
 			  	console.log(data); 
 			  	// This will fire the change events and update the grid.
 			  	dataView.setItems(data, "ms_Id");
 		  	} 
 	  	});
 	}
  
   function addRow() {
      var currRowNum = grid.getActiveCell().row;
      var newrow = jQuery.extend({}, data[currRowNum]);
      newrow.ms_Cntnt = 'newRecord';
      //position idx where new row would be added
      var position = (currRowNum+1);
      //array.splice(index,howmany,item1,.....,itemX)       
      data.splice(position,0,newrow);
      grid.setData(data);
      grid.render();
  };
  
  
 </script>
</head>
<body>
	<div class="row">	
		<div class="col-12">
			<div class="btn-group float-right" role="group">
			    <button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" id="addMilestoneBtn">
				  추가
				</button>
				<button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" id="delMilestoneBtn">
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
				<button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" id="saveMilestoneBtn">
				  저장
				</button>
				<button type="button" class="btn btn-primary" data-toggle="button" data-dismiss="modal"  aria-pressed="false" id="cancelMilestoneBtn">
				  취소
				</button>
			</div>
		</div>
	</div>

</body>
</html>
