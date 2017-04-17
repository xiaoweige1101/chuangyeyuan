<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="form-group">
	<label for="host" class="col-sm-3 control-label">选择大楼</label>
	<div class="col-sm-9" style="margin-left:0px;width:80%;">
		<select name="buildingName" id="buildingName" class="form-control m-b">
			<c:forEach items="${buildingList}" var="building">
				<option value="${building.buildingName}">${building.buildingName}</option>
			</c:forEach>
		</select>
	</div>
</div>