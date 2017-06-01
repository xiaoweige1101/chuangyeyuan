<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/room/shouzu.js">
	
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
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/room/shouzuEntity.shtml">
		<section class="panel panel-default">
		<div class="panel-body">
		
			<input type="hidden" id="roomId" name="roomId" value=${roomId}></input>
			<input type="hidden" id="currentGuestId" name="currentGuestId" value=${currentGuestId}></input>
			<div class="form-group">
				<label class="col-sm-3 control-label" style="width:20%">大楼名称</label>
				<div class="col-sm-9" style="width:60%;">
					<input type="text" class="form-control checkacc" name="buildingName" id="buildingName" value="${buildingName}" readonly="readonly" />
				</div>
			</div>
			
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label" style="width:20%">房间名称</label>
				<div class="col-sm-9" style="width:60%;">
					<input type="text" class="form-control checkacc"  name="roomName" id="roomName" value="${roomName}" readonly="readonly" />
				</div>
			</div>
			
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label" style="width:20%">房租(元)</label>
				<div class="col-sm-9" style="width:60%;">
					<input type="text" class="form-control checkacc"  name="roomPrice" id="roomPrice" value="${roomPrice}" />
				</div>
			</div>
			
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label" style="width:20%">电费(元)</label>
				<div class="col-sm-9" style="width:60%;">
					<input type="text" class="form-control" name="electMoney" id="electMoney" value="0" />
				</div>
			</div>
			
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label" style="width:20%">水费(元)</label>
				<div class="col-sm-9" style="width:60%;">
					<input type="text" class="form-control" name="waterMoney" id="waterMoney" value="0" />
				</div>
			</div>
			
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label" style="width:20%">其他费用(元)</label>
				<div class="col-sm-9" style="width:60%;">
					<input type="text" class="form-control" name="otherMoney" id="otherMoney" value="0" />
				</div>
			</div>
			
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<div class="col-sm-9" style="width:60%;">
					<label class="col-sm-3 control-label" style="width:40%">下次交租日期:</label>
					<div class="col-sm-9" style="width:60%;">
						<input id="nextRentTime" name="nextRentTime" type="date" value="2017-07-01"/>
					</div>
				</div>
			</div>
			
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label" style="width:20%">备注</label>
				<div class="col-sm-9" style="width:60%;">
					<input type="text" class="form-control" name="detail" id="detail" value="0" />
				</div>
			</div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer> </section>
	</form>
	<script type="text/javascript">
	onloadurl();
	</script>
	<script type="text/javascript"
		src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>