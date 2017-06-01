var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		id : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			width : "50px",
			hide : true
		}, {
			colkey : "roomName",
			name : "房间名称",
			width : "100px"
		}, {
			colkey : "buildingName",
			name : "所属大楼名称",
			width : "100px"
		}, {
			colkey : "guestName",
			name : "当前房客",
			width : "100px"
		}, {
			colkey : "roomPrice",
			name : "房租价格",
			width : "100px",
		}, {
			colkey : "lastRent",
			name : "上次收租金额",
			width : "100px"
		}, {
			colkey : "lastRentTime",
			name : "上次收租时间",
			width : "100px",
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}, {
			colkey : "nextRentTime",
			name : "下次交租时间",
			width : "100px",
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}, {
			colkey : "desc",
			name : "描述",
			width : "150px"
		}
		],
		jsonUrl : rootPath + '/room/findByPage.shtml',
		dymCol:true,
		checkbox : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addRole").click("click", function() {
		addRole();
	});
	$("#editRole").click("click", function() {
		editRole();
	});
	$("#delRole").click("click", function() {
		delRole();
	});
	$("#permissions").click("click", function() {
		permissions();
	});
	$("#shouzu").click("click", function() {
		shouzu();
	});
});
function editRole() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "60%" ],
		content : rootPath + '/room/editUI.shtml?id=' + cbox
	});
}
function permissions() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("请选择一个对象！");
		return;
	}
	var url = rootPath + '/resources/permissions.shtml?roleId='+cbox;
	pageii = layer.open({
		title : "分配权限",
		type : 2,
		area : [ "700px", "60%" ],
		content : url
	});
}
function addRole() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "60%" ],
		content : rootPath + '/room/addUI.shtml'
	});
}
function delRole() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/room/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}


function shouzu() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	
	if (cbox.toString().indexOf(",") != -1) {
		layer.msg("只能选择一个房间收租!!");
		return;
	}
	
	var row = $("#mytable input:checkbox:checked");
	var guestName = row.parent().siblings()[4].innerHTML;
	
	console.log("guestName:" + guestName);
	
	if (guestName == "----") {
		layer.msg("当前房间没有租客!!");
		return;
	}
	
	pageii = layer.open({
		title : "收租",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/room/shouzu.shtml?roomId=' + cbox.toString()
	});
	
}
