<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>

<head>
<meta charset="UTF-8">
<title>SSM项目</title>
<link href="${path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${path }/static/js/jquery-2.1.1.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。 -->
	<script src="${path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>



	<div class="container">
		<!--使用栅格系统  -->
		<div class="row">
			<div class="11col-md-4">
				<h1>SSM-Demo项目</h1>
			</div>

		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button type="button" class="btn btn-primary">新增</button>
				<button type="button" class="btn btn-danger">删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<td>#</td>
						<td>员工姓名</td>
						<td>邮箱地址</td>
						<td>性别</td>
						<td>所属部门</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<td>${emp.empId}</td>
							<td>${emp.empName}</td>
							<td>${emp.mail}</td>
							<td>${emp.gender=="M"?"男":"女"}</td>
							
							<td>${emp.department.depName}</td>
							<td>
								<button type="button" class="btn btn-info">编辑</button>
								<button type="button" class="btn btn-danger">删除</button>
							</td>
						</tr>
					</c:forEach>


				</table>
			</div>

		</div>
		<div class="row">
			<div class="col-md-6">当前第${pageInfo.pageNum }页，共${pageInfo.pages }页，总共${pageInfo.total}条记录</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${path }/emps?pn=1" >首页
						</a></li>
						<c:if test="${pageInfo.hasPreviousPage }">
								<li><a href="${path }/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						</c:if>

						<c:forEach items="${pageInfo.navigatepageNums }" var="np">
							<c:if test="${np==pageInfo.pageNum }">
								<li class="active"><a href="${path }/emps?pn=${np}">${np}</a></li>
							</c:if>
							<c:if test="${np !=pageInfo.pageNum }">
								<li><a href="${path }/emps?pn=${np}">${np}</a></li>
							</c:if>							
							
						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
								<li><a href="${path }/emps?pn=${pageInfo.pageNum-1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
						</c:if>

						<li><a href="${path }/emps?pn=${pageInfo.pages}" >尾页
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>