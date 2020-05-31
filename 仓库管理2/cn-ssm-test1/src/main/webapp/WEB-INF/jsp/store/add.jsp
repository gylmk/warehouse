<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>添加新仓库</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/maple.css'/>"></link>
		<style type="text/css">
			.tx td {
				padding: 3px;
			}
		</style>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css" type="text/css"></link>
		<!-- <SCRIPT type="text/javascript">
		$(document).ready(function(){
			$("#name").blur( function () { 
				var name2=$("#name").val().trim();
		  $.post(
      			"${pageContext.request.contextPath }/storeAction_findByName",
     				 {"name":name2},
      			function(data){
      			 if(data=="ok"){
    			   	$("#name").val('');
					$("#checkStoreName").html("<font color='red'>仓库名已存在,请更改</font>");
            	 }else{
					$("#checkStoreName").html("<font color='green'>仓库名可以使用</font>");
					  }
       				});
				});
			$("#name").focus(function(){
  				$("#checkStoreName").html("");
  			});
		});
		</SCRIPT> -->
		<!--取消添加仓库-->
		<script type="text/javascript">
			function cancle(){
				window.location.href="goodlist.do";
			}
		</script>
	</head>
	<body>
		<!-- 中间内容（开始） -->
		<table border="0" class="tx" width="100%">
			<tr>
				<td>
					当前位置&gt;&gt;首页&gt;&gt;创建新仓库
				</td>
			</tr>
		</table>
		<br>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td rowspan="2">
					<form action="${pageContext.request.contextPath }/storeAction_add.do" namespace="/" method="post" theme="simple" name="select">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
							<tr>
								<td bgcolor="a0c0c0" style="padding-left: 10px;" colspan="2" align="left">
									<b>创建新仓库</b>
								</td>
							</tr>
							<tr>
								<td>
									仓库名称：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="name">
								</td>
							</tr>
							<tr>
								<td>
									仓库地址：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="address">
								</td>
							</tr>
							<tr>
								<td>
									库管员：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="manager">
								</td>
							</tr>
							<tr>
								<td colspan="2" style="padding-top: 10px;" align="center">
									<p style="margin-left: -150px;">
									  <button type="submit" class="btn btn-primary" style="width: 100px;">确定</button>
									  <button type="button" onclick="cancle()" class="btn btn-default" style="width: 100px;">取消</button>
									</p>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>

