<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="form-group">
	<label for="host" class="col-sm-3 control-label"  style="width:20%">选择租客</label>
	<div class="col-sm-9" style="width:78%;">
		<select name="guestName" id="guestName" class="form-control m-b">
			<c:forEach items="${guestList}" var="guest">
				<option value="${guest.name}_${guest.IDNo}">${guest.name}_${guest.IDNo}</option>
			</c:forEach>
		</select>
	</div>
</div>