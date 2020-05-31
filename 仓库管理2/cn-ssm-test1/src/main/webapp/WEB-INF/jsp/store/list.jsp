<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>仓库管理</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/maple.css"></link>
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css" type="text/css"></link>
		<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layer/theme/default/layer.css" type="text/css"></link>
		
		<!-- <script type="text/javascript">
			$(function() {
				// 为所有删除 添加确认
				$(".deleteLink").click(function(event) {
					var isConfirm = window.confirm("确认删除吗？");
					if (!isConfirm) {
						// 阻止提交到服务器 
						event.preventDefault();
						
					}
				});
			}); -->
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
		
		<table border="0" width="100%" cellpadding="0" cellspacing="0" align="center">
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
							<!-- 四大作用域取值 page request session application -->
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
										<c:forEach var="store" items="${storelist}">
											<tr>
												<td>
													<input type="hidden" name="id" value="${store.id}">
													${store.name}	
												</td>
												<td>
													${store.address}
												</td>
												<td>
													${store.manager}
												</td>
												<td align="center">
													<button type="button" class="btn btn-success" onclick="toedit('${store.id}')">修改</button>
													<button type="button" class="btn btn-info" onclick="stroedelete('${store.id}')">删除</button>
													<!-- <a href="" value=""></a>
													<a href="" value=""></a> -->
													<%--<a href="javascript:void(0)" onclick="javascript:window.confirm('确定删除吗')">删除1</a>--%>
												</td>
											</tr>
											</c:forEach>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="right" style="padding-top: 10px;">
									<input class="tx" style="width: 120px; margin-right: 30px;" type="button" onclick="window.location.href='${pageContext.request.contextPath}/storeadd.do'" value="创建新仓库">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
	<script type="text/javascript">
		//去仓库修改页面
		function toedit(id) {
			window.location.href="${pageContext.request.contextPath }/toedit.do?id="+id;
		}
		
		//删除仓库		
		function stroedelete(id) {
			$.ajax({
				//路径
				url:"<%=request.getContextPath()%>/stroedelete.do",
				//传值
				data:{id:id},
				//提交数据类型
				type:"post",
				//服务器返回类型
				dataType:"json",
				//回调函数
				success:function(data){
					if (data==true) {
						window.location.href="<%=request.getContextPath()%>/storeAction_list.do";
					} else {
						layer.msg("删除仓库失败");
					}
				}
			});
		}
	</script>                 
</html>

