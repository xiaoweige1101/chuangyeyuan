var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		id : 'paging',
		l_column : [ {
			colkey : "guestName",
			name : "租客姓名",
			width : "50px",
			hide : true
		}, {
			colkey : "room",
			name : "房间",
			width : "200px"
		}, {
			colkey : "waterMoney",
			name : "水费",
			width : "200px"
		}, {
			colkey : "electMoney",
			name : "电费",
			width : "200px"
		}, {
			colkey : "networkMoney",
			name : "网费",
			width : "200px"
		}, {
			colkey : "rentMoney",
			name : "总租金",
			width : "200px"
		}, {
			colkey : "rentStartDate",
			name : "起始日期",
			width : "200px"
		}, {
			colkey : "rentEntEndDate",
			name : "结束日期",
			width : "200px"
		}, {
			colkey : "userName",
			name : "收租人",
			width : "200px"
		}, {
			colkey : "detail",
			name : "备注",
			width : "300px",
		}, {
			colkey : "updateTime",
			name : "更新日期",
			width : "300px",
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
