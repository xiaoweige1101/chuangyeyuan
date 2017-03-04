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
			colkey : "roomNum",
			name : "房间号"
		}, {
			colkey : "beginDate",
			name : "入住日期",
			width : "100px",
		}, {
			colkey : "roomRate",
			name : "房租"
		}, {
			colkey : "returnableDeposit",
			name : "押金"
		}, {
			colkey : "waterRecord",
			name : "水费"
		}, {
			colkey : "electricRecord",
			name : "电费"
		}, {
			colkey : "networkRecord",
			name : "网费"
		}, {
			colkey : "contractPeriod",
			name : "合同期"
		}, {
			colkey : "description",
			name : "备注"
		}, {
			colkey : "nextChargeDate",
			name : "下次交房租日期"
		}
		],
		jsonUrl : rootPath + '/manage/building/findByPage.shtml',
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
		content : rootPath + '/role/editUI.shtml?id=' + cbox
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
		content : rootPath + '/role/addUI.shtml'
	});
}
function delRole() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/role/deleteEntity.shtml';
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
