<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>仓库管理</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/maple.css"></link>
		<style type="text/css">
			.tx td {
				padding: 3px;
			}
			.store {
				width: 100%;
				border: 1px solid gray;
				border-collapse: collapse;
			}
			.store td {
				border: 1px solid gray;
				padding: 3px;
			}
			.store a {
				text-decoration: underline;
				color: blue;
			}
		</style>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
			$(function() {
				// 为所有删除 添加确认
				$(".deleteLink").click(function(event) {
					var isConfirm = window.confirm("确认删除吗？");
					if (!isConfirm) {
						// 阻止提交到服务器 
						event.preventDefault();
					}
				});
			});
		</script>
	</head>
	<body>
		<table border="0" class="tx" width="100%">
			<tr>
				<td>
					当前位置&gt;&gt;首页&gt;&gt;仓库管理
				</td>
			</tr>
		</table>
		<br>
		${msg}
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td rowspan="2">
					<form action="" method="post" name="select">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
							<colgroup>
								<col width="20%" align="right">
								<col width="*%" align="left">
							</colgroup>
							<tr>
								<td bgcolor="a0c0c0" style="padding-left: 10px;" colspan="1" align="left">
									<b>仓库列表 </b>
								</td>
							</tr>
							<tr>
								<td align="left">${requestScope.msg}</td>
							</tr>
							<tr>
								<td>
									<table class="store">
										<tr style="background: #D2E9FF; text-align: center;">
											<td>
												名称
											</td>
											<td>
												地址
											</td>
											<td>
												管理员
											</td>
											<td>
												操作
											</td>
										</tr>
										<s:iterator value="list" var="store">
											<tr>
												<td>
													<s:property value="#store.name" />
												</td>
												<td>
													<s:property value="#store.addr" />
												</td>
												<td>
													<s:property value="#store.manager" />
												</td>
												<td>
													<a href="${pageContext.request.contextPath}/store_editUI?id=<s:property value="#store.id"/>">修改</a>
													<s:a action="store_delete" namespace="/" cssClass="deleteLink">删除
														<s:param name="id" value="#store.id"></s:param>
													</s:a>
												</td>
											</tr>
										</s:iterator>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="right" style="padding-top: 10px;">
									<input class="tx" style="width: 120px; margin-right: 30px;" type="button" onclick="window.location.href='<c:url value='/jsp/store/add.jsp'/>'" value="创建新仓库">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>