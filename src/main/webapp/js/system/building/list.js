var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		id : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			width : "50px",
			isSort: true
//			hide : true
		}, {
			colkey : "buildingName",
			name : "大楼名称",
			width : "100px"
		}, {
			colkey: "desc",
			name : "备注",
			width : "200px"
		}, {
			colkey: "partner",
			name : "合伙人",
			width : "100px"
		}, {
			colkey : "createTime",
			name : "创建时间",
			width : "100px",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}
		],
		jsonUrl : rootPath + '/building/findByPage.shtml',
		dymCol:true,
		checkbox : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addBuilding").click("click", function() {
		addBuilding();
	});
	$("#editBuilding").click("click", function() {
		editBuilding();
	});
	$("#delBuilding").click("click", function() {
		delBuilding();
	});
	$("#permissions").click("click", function() {
		permissions();
	});
});
function editBuilding() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "60%" ],
		content : rootPath + '/building/editUI.shtml?id=' + cbox
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
function addBuilding() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "50%" ],
		content : rootPath + '/building/addUI.shtml'
	});
}
function delBuilding() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/building/deleteEntity.shtml';
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
