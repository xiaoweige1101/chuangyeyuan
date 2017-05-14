var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		id : 'paging',
		l_column : [ {
			colkey : "guestName",
			name : "租客姓名",
			width : "8%"
		}, {
			colkey : "room",
			name : "房间",
			width : "12%"
		}, {
			colkey : "waterMoney",
			name : "水费",
			width : "10%"
		}, {
			colkey : "electMoney",
			name : "电费",
			width : "10%"
		}, {
			colkey : "networkMoney",
			name : "网费",
			width : "10%"
		}, {
			colkey : "rentMoney",
			name : "总租金",
			width : "10%"
		}, {
			colkey : "rentStartDate",
			name : "起始日期",
			width : "10%"
		}, {
			colkey : "rentEntEndDate",
			name : "结束日期",
			width : "10%"
		}, {
			colkey : "userName",
			name : "收租人",
			width : "10%"
		}, {
			colkey : "detail",
			name : "备注",
			width : "10%",
		}, {
			colkey : "updateTime",
			name : "更新日期",
			width : "10%",
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}
		],
		jsonUrl : rootPath + '/budget/findByPage.shtml',
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
		content : rootPath + '/budget/editUI.shtml?id=' + cbox
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
		content : rootPath + '/budget/addUI.shtml'
	});
}
function delRole() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/budget/deleteEntity.shtml';
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
