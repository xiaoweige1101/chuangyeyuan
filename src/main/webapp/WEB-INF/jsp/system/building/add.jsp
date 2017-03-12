<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/building/add.js">
	
</script>
<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
	text-align: right;
}

.col-sm-9 {
	width: 85%;
	float: left;
	text-align: left;
}

label[class^="btn btn-default"] {
	margin-top: -4px;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post" action="${ctx}/building/addEntity.shtml">
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<div class="col-sm-3">
					<label class="control-label">大楼名称</label>
				</div>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入大楼名称" name="cyy_building.buildingName" id="buildingName">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">备注</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输入备注" name="cyy_building.desc" id="desc">
				</div>
			</div>
			<div class="form-group">
				<table border="1" width="85%" height="100%" align="center">
					<tr height="50px" align="center">
						<td><input type="checkbox" name="partnerGroupSelect" value="合伙人11"><font style="font-weight:bold;size:4">合伙人11</font></input></td>
						<td><input type="checkbox" name="partnerGroupSelect" value="合伙人12"><font style="font-weight:bold;size:4">合伙人12</font></td>
						<td><input type="checkbox" name="partnerGroupSelect" value="合伙人13"><font style="font-weight:bold;size:4">合伙人13</font></td>
					</tr>
					<tr height="50px" align="center">
						<td><input type="checkbox" name="partnerGroupSelect" value="合伙人21"><font style="font-weight:bold;size:4">合伙人21</font></td>
						<td><input type="checkbox" name="partnerGroupSelect" value="合伙人22"><font style="font-weight:bold;size:4">合伙人22</font></td>
						<td><input type="checkbox" name="partnerGroupSelect" value="合伙人23"><font style="font-weight:bold;size:4">合伙人23</font></td>
					</tr>
					<tr height="50px" align="center">
						<td><input type="checkbox" name="partnerGroupSelect" value="合伙人31"><font style="font-weight:bold;size:4">合伙人31</font></td>
						<td><input type="checkbox" name="partnerGroupSelect" value="合伙人32"><font style="font-weight:bold;size:4">合伙人32</font></td>
						<td><input type="checkbox" name="partnerGroupSelect" value="合伙人33"><font style="font-weight:bold;size:4">合伙人33</font></td>
					</tr>
				</table>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer> 
		</section>
	</form>
	<script type="text/javascript">
	onloadurl();
	</script>
	<script type="text/javascript" src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>