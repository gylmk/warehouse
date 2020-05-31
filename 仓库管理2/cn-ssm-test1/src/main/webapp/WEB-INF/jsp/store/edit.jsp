<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>添加新仓库</title>
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/maple.css'/>"></link>
		<style type="text/css">
			.tx td {
				padding: 3px;
			}
		</style>
	</head>
	<body>
		<!-- 中间内容（开始） -->
		<table border="0" class="tx" width="100%">
			<tr>
				<td>
					当前位置&gt;&gt;首页&gt;&gt;修改仓库
				</td>
			</tr>
		</table>
		<br>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td rowspan="2">
					<form>
						<input type="hidden" name="id" value="${store.id}">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
							<tr>
								<td bgcolor="a0c0c0" style="padding-left: 10px;" colspan="2" align="left">
									<b>修改仓库</b>
								</td>
							</tr>
							<tr>
								<td>
									仓库名称：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="name" value="${store.name}">
								</td>
							</tr>
							<tr>
								<td>
									仓库地址：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="address" value="${store.address}">
								</td>
							</tr>
							<tr>
								<td>
									库管员：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="manager" value="${store.manager}">
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="padding-top: 10px;">
									<input class="tx" style="width: 120px; margin-left: 30px;" type="button" onclick="storeupdate()" value="确定">
									<input class="tx" style="width: 120px; margin-right: 30px;" type="reset" value="取消">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
	<!--修改仓库-->
	<script type="text/javascript">
		//修改仓库
		function storeupdate() {
			$.post(
				//路径
				"<%=request.getContextPath()%>/storeupdate.do",
				//传值
				$("form").serialize(),					
				//回调函数
				function(data) {
					if (true==data) {
						window.location.href="<%=request.getContextPath()%>/storeAction_list.do";
					}else{
						alert("修改失败,请重新修改");
					}
				},
				//返回类型
				"json"
			);
		}
	</script>
</html>

