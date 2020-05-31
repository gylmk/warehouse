<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>货物统计</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/maple.css'/>"></link>
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
			//加载仓库信息，通过ajax 
			$(function(){
				var url = "${pageContext.request.contextPath}/goodsAction_findAllStore.do";
				$.post(
					url,
					function(data){
							if(data.length>0){
								for(var i=0;i<data.length;i++){
									//alert(data[i].addr);
									var id = data[i].id;
									if(id=='${storeid}'){
										$("#selectStores").append("<option selected='selected' value="+data[i].id+">"+data[i].name+"</option>")
									}else{
										$("#selectStores").append("<option  value="+data[i].id+">"+data[i].name+"</option>")
									}
								}
							}
						},
					  "json"
					);
				});
		</script>
	</head>
	<body>
		<table border="0" class="tx" width="100%">
			<tr>
				<td>
					当前位置&gt;&gt;首页&gt;&gt;货物库存
				</td>
			</tr>
		</table>
		<br>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td rowspan="1">
					<form action="${pageContext.request.contextPath}/goodsAction_searchUI.do" namespace="/" method="post" theme="simple" name="select">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
							<colgroup>
								<col width="20%" align="right">
								<col width="*%" align="left">
							</colgroup>
							<tr>
								<td bgcolor="a0c0c0" style="padding-left: 10px;" colspan="2" align="left">
									<b>查询条件</b>
								</td>
							</tr>
							<tr>
								<td>
									简记码：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="nm" value="${nm}">
								</td>
							</tr>
							<tr>
								<td>
									货物名称：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="goodname" value="${goodname}">
								</td>
							</tr>
							<tr>
								<td>
									选择仓库：
								</td>
								<td>
									<select class="tx" style="width: 155px;" id="selectStores" name="storeid">
										<option value="">
											请选择仓库
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="right" style="padding-top: 10px;">
									<input class="tx" style="width: 120px; margin-right: 30px;" type="submit" value="查询">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			<tr valign="top">
				<td rowspan="2">
					<form action="" method="post" name="select">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
							<tr>
								<td bgcolor="a0c0c0" style="padding-left: 10px;" colspan="1" align="left">
									<b>货物库存</b>
								</td>
							</tr>
							<tr>
								<td>
									<table class="store">
										<tr style="background: #D2E9FF; text-align: center;">
											<td>
												简记码
											</td>
											<td>
												名称
											</td>
											<td>
												计量单位
											</td>
											<td>
												库存数量
											</td>
											<td>
												所在仓库
											</td>
										</tr>
										<c:forEach items="${goodslist}" var="goods">
											<tr>
												<td>
													${goods.nm}
												</td>
												<td>
													${goods.goodname}
												</td>
												<td>
													${goods.unit}
												</td>
												<td>
													${goods.amount}
												</td>
												<td>
													${goods.name}
												</td>
											</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>

