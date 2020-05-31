<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>出库</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/maple.css'/>"></link>
		<style type="text/css">
			.tx td {
				padding: 3px;
			}
		</style>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jquery-ui-1.9.2.custom.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui-1.9.2.custom.js"></script>
		<script type="text/javascript">
			//即时查询		
			$(function(){
				// 根据用户输入 即时查询
				$("#goods_name").autocomplete({
					//request用户请求的数据   response 服务器响应的数据
					source:function(request,response){
						//alert(request.term);
						var url = "${pageContext.request.contextPath}/goodsAction_findLinkByName.do";
						$.post(
							url,
							{'name':request.term},
							function(data){
								response(data);
						 });
					 },
					select:function(event,obj){
						//obj.item.value  获取选中的值,传到action,再然后通过各层 在数据库查询些name对应的对象 通过json回传到页面
						var name = obj.item.value;
						var url = "${pageContext.request.contextPath}/goodsAction_findGoodsByName.do";
						$.post(
							url,
							{'name':name},
							function(data){
									$("#id").val(data.id);
									$("#nm").val(data.nm);
									$("#unit").val(data.unit);
									$("#goods_amountShow").html("<font color='red'>物品数量为："+data.amount+"</font>");
									$("#goods_amountShow").val(data.amount);
									$("#storeid").val(data.storename);
								},
								"json"
							);
						}
					});
			});
			
		//出库
		function outgoods() {
			//商品库存的数量
			var number = $("#goods_amountShow").val();
			//用户输入的出库数量
			var num = $("#num").val();
			//判断用户输入的数量和库存量
			var diff = number-num;
			
			if (Number(diff)>0) {
				//出库修改商品库存量
				var id = $("#id").val();
				$.post(
					//路径
					"<%=request.getContextPath()%>/updateGood.do",
					//传值
					{
						id:id,
						num:num,
						number:number
					},
					//回调函数
					function(data) {
						if (true==data) {
							alert("成功出库");
							window.location.href="<%=request.getContextPath()%>/goodsAction_searchUI.do";
						} else {
							alert("出库失败");
						}
					},
					//返回函数
					"json"
				);
			}else if(Number(diff)==0){//数量相等 走删除
					//出库删除商品(根据id删除)
					var id = $("#id").val();
					//商品库存的数量
					var number = $("#goods_amountShow").val();
					//出库删除商品(根据id删除)
						$.post(
							//路径
							"<%=request.getContextPath()%>/deleteGood.do",
							//传值
							{
							   id:id,
							   number:number
							},
							//回调函数
							function(data) {
								if (true==data) {
									alert("成功出库");
									window.location.href="<%=request.getContextPath()%>/goodsAction_searchUI.do";
								} else {
									alert("出库失败");
								}
							},
							//返回函数
							"json"
						);
				}else if(Number(diff)<0){
					//提示商品库存不足
					alert("存库数量不足");
					$("#num").val("");
				}
			}
		</script>
	</head>
	<body>
	
		<table border="0" class="tx" width="100%">
			<tr>
				<td>
					当前位置&gt;&gt;首页&gt;&gt;出库
				</td>
			</tr>
		</table>
		<br>
		<s:actionerror/>
		${requestScope.msg}
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td rowspan="2">
					<s:form action="goodsAction_out" namespace="/" method="post" theme="simple" name="select">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
							<colgroup>
								<col width="20%" align="right">
								<col width="*%" align="left">
							</colgroup>
							<tr>
								<td bgcolor="a0c0c0" style="padding-left: 10px;" colspan="2" align="left">
									<b>货物出库登记：</b>
								</td>
							</tr>
							<tr>
								<td>
									简记码：
								</td>
								<td>
									<!--商品id-->
									<input type="hidden" name="id" id="id">
									<input type="text" style="border-color: green;" name="nm" id="nm">
								</td>
							</tr>
							<tr>
								<td>
									货物名称：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="goodname" id="goods_name">
								</td>
							</tr>
							<tr>
								<td>
									计量单位：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="unit" id="unit">
								</td>
							</tr>
							<tr>
								<td>
									出库数量：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="num" id="num" onblur="outgood()">
								<span id="goods_amountShow"></span>
								</td>
							</tr>
							<tr>
								<td>
									选择仓库：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="storeid" id="storeid">
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="padding-top: 10px;">
									<input class="tx" style="width: 120px; margin-right: 30px;" onclick="outgoods()" type="button" value="出库">
									<input class="tx" style="width: 120px; margin-right: 30px;" type="reset" value="取消">
								</td>
							</tr>
						</table>
					</s:form>
				</td>
			</tr>
		</table>
	</body>
</html>

