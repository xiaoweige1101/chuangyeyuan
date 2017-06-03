<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/room/registerInUI.js"></script>

<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
}

.col-sm-9 {
	width: 85%;
	float: left;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/room/registerOutUIEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${room.id}" name="room.id" id="id">
		<section class="panel panel-default">
		<div class="panel-body">
		
			<div class="form-group">
				<label class="col-sm-3 control-label" style="width:20%">房间名称</label>
				<div class="col-sm-9" style="width:80%">
					<input type="text" class="form-control" placeholder="房间名称" value="${room.roomName}" name="room.roomName" id="roomName" readonly="readonly">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			

			<div class="form-group">
				<label class="col-sm-3 control-label" style="width:20%">当前房客</label>
				<div class="col-sm-9" style="width:80%">
					<input type="text" class="form-control" placeholder="当前房客" value="${guestName}" name="guestName" id="guestName" readonly="readonly">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>

			
			<div class="form-group">
				<label class="col-sm-3 control-label" style="width:20%">描述</label>
				<div class="col-sm-9" style="width:80%">
					<input type="text" class="form-control" placeholder="请输入账号描述" value="${room.detail}" name="room.detail" id="room.detail">
				</div>
			</div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		<button type="submit" class="btn btn-success btn-s-xs">确定退房</button>
		</footer> </section>
	</form>
	<script type="text/javascript">
	onloadurl();
</script>
</body>
</html>