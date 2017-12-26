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
 </style>
 
 <script src="/js/jquery-1.7.min.js"></script>
 <script src="/js/jquery.event.drag-2.2.js"></script>
 
 <script src="/js/slick.core.js"></script>
 
 <script src="/plugins/slick.rowselectionmodel.js"></script>
 <script src="/plugins/slick.checkboxselectcolumn.js"></script>
 <script src="/controls/slick.columnpicker.js"></script>
 <script src="/js/slick.formatters.js"></script>
 <script src="/js/slick.editors.js"></script>
 <script src="/js/slick.grid.js"></script>
 <script src="/js/slick.dataview.js"></script>
 
 <script>
	var dataView = new Slick.Data.DataView();
	var grid;
	var checkboxSelector = new Slick.CheckboxSelectColumn({
		cssClass: "slick-cell-checkboxsel"
	});
	var columns = [
		checkboxSelector.getColumnDefinition(),
		{id: "ms_Dt", name: "일자", field: "ms_Dt", editor: Slick.Editors.Text},
		{id: "ms_Cntnt", name: "내용", field: "ms_Cntnt", editor: Slick.Editors.Text},
		{id: "writer", name: "작성자", field: "writer", editor: Slick.Editors.Text},
	];
	var options = {
		enableCellNavigation: true,
		enableColumnReorder: false,
		forceFitColumns: true,
		editable: true,
		asyncEditorLoading: false,
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
  
	$(function () {
		  
		// 그리드 생성
	    grid = new Slick.Grid("#myGrid", dataView, columns, options);
	    grid.setSelectionModel(new Slick.RowSelectionModel({selectActiveRow: false}));
	    grid.registerPlugin(checkboxSelector);
	    
	    //grid.invalidate();
    
	    var msIdCnt = 0;
	    $("#addMilestoneBtn").on("click", function() {
	    	
	    	var milestone = {ms_Id: msIdCnt++, p_Id: "", ms_Cntnt: "", ms_Dt: "", writer: "", flag: "I"};
	    	
			dataView.addItem(milestone);
			dataView.refresh();
	    });
	    
		$("#delMilestoneBtn").on("click", function() {
			if(!confirm("삭제하시겠습니까?")) return;
			
			var milestones = [];
			var ids = [];
			var selectedIndexes = [];

			selectedIndexes = grid.getSelectedRows();
			
			if(selectedIndexes.length == 0) {
				alert("삭제할 마일스톤을 선택해 주세요.");
			}
			
			$.each(selectedIndexes, function (index, value) {
				var item = grid.getDataItem(value);
				
				if(item.flag == "I") {
					ids.push(item.ms_Id);
				} else {
					milestones.push(item);
				}
				
			});
			
			$.each(ids, function(index, value) {
				dataView.deleteItem(value);
			});
			
			if(milestones.length > 0) {
				deleteMilestones(milestones);
			}
			
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
				dataView.setItems(data, "ms_Id");
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
				<button type="button" class="btn btn-primary" id="delMilestoneBtn">
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
		<div class="col-12 text-center">
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-primary" id="saveMilestoneBtn">
				  저장
				</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="cancelMilestoneBtn">
				  취소
				</button>
			</div>
		</div>
	</div>

</body>
</html>
