<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/building/list.js"></script>

	<header class="panel-heading">
		<div class="doc-buttons">
			<c:forEach items="${res}" var="key">
				${key.description}
			</c:forEach>
		</div>
	</header>
	
	<div class="table-responsive">
		<div id="paging" class="pagclass"></div>
	</div>
