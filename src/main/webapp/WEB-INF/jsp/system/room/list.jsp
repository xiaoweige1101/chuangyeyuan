<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/room/list.js"></script>

	<header class="panel-heading">
	
	<div style="width:100%;">
		<table style="width:100%;">
			<tr>
				<td align="left">
					<div class="m-b-md">
						<form class="form-inline" role="form" id="searchForm"
							name="searchForm">
							<div class="form-group">
								<label class="control-label"> <span class="h4 font-thin v-middle">房间号:</span></label> 
								<input class="input-medium ui-autocomplete-input" id="name" name="roleFormMap.roleFormMap.name">
							</div>
							<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
						</form>
					</div>
				</td>
				
				<td align="left">
					<div class="doc-buttons">
						<button type="button" id=registerIn class="btn btn-primary marR10">登记入住</button>
						<button type="button" id=registerOut class="btn btn-primary marR10">登记退房</button>
						<button type="button" id=shouzu class="btn btn-primary marR10">收房租</button>
						<button type="button" id=addRole class="btn btn-primary marR10">新增房间</button>
						<button type="button" id=delRole class="btn btn-primary marR10">删除房间</button>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	</header>
	<div class="table-responsive">
		<div id="paging" class="pagclass"></div>
	</div>
