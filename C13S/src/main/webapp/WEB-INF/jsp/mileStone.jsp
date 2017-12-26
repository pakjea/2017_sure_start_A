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
 <link rel="stylesheet" href="/controls/slick.columnpicker.css" type="text/css"/>
 <style>
    .slick-cell-checkboxsel {
      background: #f0f0f0;
      border-right-color: silver;
      border-right-style: solid;
    }
    .ui-datepicker{ z-index: 9999 !important;}
 </style>
 
 <script src="/js/jquery-1.7.min.js"></script>
 <script src="/js/jquery.event.drag-2.2.js"></script>
 <script src="/js/jquery-ui-1.8.16.custom.min.js"></script>
 
 <script src="/js/slick.core.js"></script>
 
 <script src="/plugins/slick.rowselectionmodel.js"></script>
 <script src="/plugins/slick.checkboxselectcolumn.js"></script>
 <script src="/controls/slick.columnpicker.js"></script>
 <script src="/js/slick.formatters.js"></script>
 <script src="/js/slick.editors.js"></script>
 <script src="/js/slick.grid.js"></script>
<!--  <script src="/js/slick.grid_ms.js"></script> -->
 
 <script>
	var dataView_ms = new Slick.Data.DataView();
	var grid_ms;
	var checkboxSelector = new Slick.CheckboxSelectColumn({
		cssClass: "slick-cell-checkboxsel"
	});
	var columns_ms = [
		checkboxSelector.getColumnDefinition(),
		{id: "ms_Dt", name: "일자", field: "ms_Dt", editor: Slick.Editors.Date},
		{id: "ms_Cntnt", name: "내용", field: "ms_Cntnt", editor: Slick.Editors.Text},
		{id: "writer", name: "작성자", field: "writer", editor: Slick.Editors.Text},
	];
	var options_ms = {
		enableCellNavigation: true,
		enableColumnReorder: false,
		forceFitColumns: true,
		editable: true,
		asyncEditorLoading: false,
		autoEdit: false
	}
	
	$(function () {
		 
		// 그리드 생성
	    grid_ms = new Slick.Grid("#myGrid", dataView_ms, columns_ms, options_ms);
	    grid_ms.setSelectionModel(new Slick.RowSelectionModel({selectActiveRow: false}));
	    grid_ms.registerPlugin(checkboxSelector);
	    
	    //grid_ms.invalidate();
	    
	    grid_ms.onClick.subscribe(function (e, args) {
// 	        var row = args.grid.getData().getItems()[args.row];
	        var column = args.grid.getColumns()[args.cell];
	        
	        // 체크박스
		    if (column.selectable == true) {
		    	var array = grid_ms.getSelectedRows();
		    	var current = args.row;
		    	var searchedIndex = $.inArray(current, array);
		    	
		    	if(searchedIndex >= 0){
		            array.splice(searchedIndex, 1);
		    	} else {
		    		array.push(args.row);
		    	}
		    	
		    	grid_ms.setSelectedRows(array);
		    	grid_ms.invalidate();
		    }
	    });
	    
	    //Make the grid respond to DataView change events.
		dataView_ms.onRowCountChanged.subscribe(function (e, args) {
			grid_ms.updateRowCount();
			grid_ms.render();
		});
		
		dataView_ms.onRowsChanged.subscribe(function (e, args) {
			grid_ms.invalidateRows(args.rows);
			grid_ms.render();
		});
    
		
	    // 추가 버튼 클릭
	    var msIdCnt = 0;
	    $("#addMilestoneBtn").on("click", function() {
	    	var milestone = {ms_Id: msIdCnt++, p_Id: "", ms_Cntnt: "", ms_Dt: "", writer: "", flag: "I"};
	    	
			dataView_ms.addItem(milestone);
			dataView_ms.refresh();
			
			var array = grid_ms.getSelectedRows();
	    	array.push(dataView_ms.getLength()-1);
	    	grid_ms.setSelectedRows(array);
	    	grid_ms.invalidate();
	    });
	    
	    // 삭제 버튼 클릭
		$("#delMilestoneBtn").on("click", function() {
			if(!confirm("삭제하시겠습니까?")) return;
			
			var milestones = [];
			var ids = [];
			var selectedIndexes = [];

			selectedIndexes = grid_ms.getSelectedRows();
			
			if(selectedIndexes.length == 0) {
				alert("삭제할 마일스톤을 선택해 주세요.");
			}
			
			$.each(selectedIndexes, function (index, value) {
				var item = grid_ms.getDataItem(value);
				
				if(item.flag == "I") {
					ids.push(item.ms_Id);
				} else {
					milestones.push(item);
				}
				
			});
			
			$.each(ids, function(index, value) {
				dataView_ms.deleteItem(value);
			});
			
			if(milestones.length > 0) {
				deleteMilestones(milestones);
			}
			
	    });
	    
	    // 저장 버튼 클릭
	    $("#saveMilestoneBtn").on("click", function() {
    		console.log("Save row");
    		var gridData = dataView_ms.getItems();
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
 			  			getMilestones(selProjectId);
 				  	} else {
 			  			alert("Error");
 			  		}
 		  		} 
 	  		});
  		});
	    
	});
  
	function getMilestones(selP_Id){
		
		$.ajax({ 
			type: "POST",
			url: rootContextPath + "/getMilestones", 
			contentType: "application/json", 
			data: selP_Id, 
			success: function(data) { 
				// This will fire the change events and update the grid.
				dataView_ms.setItems(data, "ms_Id");
			} 
		});
	}
	
	function deleteMilestones(array){
		alert("마일스톤 삭제");
		var milestones = array;
		
		$.ajax({ 
			type: "POST",
			url: rootContextPath + "/deleteMilestones", 
			contentType: "application/json", 
			dataType : 'json',
			data: JSON.stringify(milestones), 
			success: function(data) { 
				getMilestones(selProjectId);
			} 
		});
	}

 </script>
</head>
<body>
	<div class="row">	
		<div class="col-12">
			<div class="btn-group float-right" role="group">
			    <button type="button" class="btn btn-primary" id="addMilestoneBtn">
				  추가
				</button>
			</div>
		</div>
	</div>
	
    <div class="row">	
		<div class="col-12" style="position: relative;">
	    	<div id="myGrid" style="width:460px;height:200px;margin:5px;"></div>
	    </div>
    </div>
	
	<div class="row">	
		<div class="col-12 text-center">
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-primary" id="saveMilestoneBtn">
				  저장
				</button>
				<button type="button" class="btn btn-primary" id="delMilestoneBtn">
				  삭제
				</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="cancelMilestoneBtn">
				  취소
				</button>
			</div>
		</div>
	</div>

</body>
</html>
