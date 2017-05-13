<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/guest/add.js">
	
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
	<form id="form" name="form" class="form-horizontal" method="post" action="${ctx}/guest/addEntity.shtml">
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<div class="col-sm-3">
					<label class="control-label">租客姓名:</label>
				</div>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入租客姓名" name="cyy_guest.name" id="name">
				</div>
			</div>
			
			<div class="line line-dashed line-lg pull-in"></div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">身份证号码:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输入身份证号码" name="cyy_guest.IDNo" id="IDNo">
				</div>
			</div>
			
			<div class="line line-dashed line-lg pull-in"></div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">性别:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输入租客性别" name="cyy_guest.sex" id="sex">
				</div>
			</div>
			
			<div class="line line-dashed line-lg pull-in"></div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">描述:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输入描述信息" name="cyy_guest.detail" id="detail">
				</div>
			</div>
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