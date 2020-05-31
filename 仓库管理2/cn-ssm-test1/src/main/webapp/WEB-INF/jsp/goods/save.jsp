<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>收货登记</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/maple.css'/>"></link>
		<style type="text/css">
			.tx td {
				padding: 3px;
			}
		</style>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
		<!-- <script type="text/javascript">
		//加载仓库信息，通过ajax 
		//加载仓库信息，通过ajax 
			$(function(){
				//alert("运行");
				var url = "${pageContext.request.contextPath}/goodsAction_findAllStore";
				$.post(url,function(data){
					if(data.length>0){
						for(var i=0;i<data.length;i++){
							//alert(data[i].addr);
							var id = data[i].id;
							if(id=='${store.id}'){
								$("#selectStores").append("<option selected='selected' value="+data[i].id+">"+data[i].name+"</option>")
							}else{
								$("#selectStores").append("<option  value="+data[i].id+">"+data[i].name+"</option>")
							}
						}
					}
					},'json');

			$("#goods_nm").blur(function(){
				//alert("test");
				var url = "${pageContext.request.contextPath}/goodsAction_findGoodsByNm"
				$.post(url,{'nm':$(this).val()},function(data){
						if(data=='0'){//没查到nm对应的记录
							$("#goods_id").val('');
							$("#goods_name").val('');
							$("#goods_unit").val('');
							$("#goods_amount").val('');
							$("#selectStores").val('');
						}else{//查到nm对应的记录
							$("#goods_id").val(data.id);
							$("#goods_name").val(data.name);
							$("#goods_unit").val(data.unit);
							//$("#goods_amount").val(data.amount);
							$("#selectStores").val(data.store.id);

						}	
					},'json');
				});
		});
		</script> -->
	</head>
	<body>
		<!-- 中间内容（开始） -->
		<table border="0" class="tx" width="100%">
			<tr>
				<td>
					当前位置&gt;&gt;首页&gt;&gt;入库
				</td>
			</tr>
		</table>
		<br>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td rowspan="2">
					<form action="" namespace="/" method="post" theme="simple" name="select">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tx" align="center">
							<colgroup>
								<col width="20%" align="right">
								<col width="*%" align="left">
							</colgroup>
							<tr>
								<td bgcolor="a0c0c0" style="padding-left: 10px;" colspan="2"
									align="left">
									<b>货物入库登记：</b>
								</td>
							</tr>
							<tr>
								<td>
									简记码：
								</td>
								<td>
									<input type="hidden" name="ids">
									<input type="text" style="border-color: green;" name="nm" onblur="checkNm()">
								</td>
							</tr>
							<tr>
								<td>
									货物名称：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="goodname">
								</td>
							</tr>
							<tr>
								<td>
									计量单位：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="unit">
								</td>
							</tr>
							<tr>
								<td>
									入库数量：
								</td>
								<td>
									<input type="text" style="border-color: green;" name="amount">
								</td>
							</tr>
							<tr>
								<td>
									选择仓库：
								</td>
								<td>
									<select class="tx" style="width: 120px;" name="storeid" id="selectStores">
										<option value="">
											请选择仓库
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="padding-top: 10px;">
									<input class="tx" style="width: 120px; margin-right: 30px;" type="button" onclick="addgood()" value="入库">
									<input class="tx" style="width: 120px; margin-right: 30px;" type="reset" value="取消">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
	<!--根据简记码查询-->
	<script type="text/javascript">
		//回显仓库下拉菜单
		$(document).ready(function() {
			var url = "<%=request.getContextPath()%>/goodsAction_findAllStore.do";
			$.post(
				//路径
				url,
				//回调函数
				function(data) {
					for ( var i in data) {
						$("#selectStores").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
					}
				},
				//返回类型
				"json"
			);
		});
		
		//验证商品简拼是否存在|并且获取数据对象
		function checkNm() {
			//获取简记码的值
			var nm = $("[name='nm']").val();
			var url = "<%=request.getContextPath()%>/checkByStoreNm.do";
			$.post(
				//路径
				url,
				//传值
				{nm:nm},
				//回调函数
				function(data) {
					if(data.length>0) {
						for ( var i in data) {
							$("[name='nm']").val(data[i].nm);
							$("[name='goodname']").val(data[i].goodname);
							$("[name='unit']").val(data[i].unit);
							//商品ids
							var ids = data[i].ids;
							$("[name='ids']").val(ids);
							
							//商品外键storeid
							var storeid = data[i].storeid;
							//仓库id
							var id = data[i].id;
							if (id==storeid) {
								$("[name='storeid']").append("<option selected='selected' value='"+data[i].id+"'>"+data[i].name+"</option>");
							}
						}
					}
				},
				//返回类型
				"json"
			);
		}
		
		//入库
		function addgood() {
			//取出商品的id做判断
			var ids = $("[name='ids']").val();
			//入库数量
			var amount = $("[name='amount']").val();
			//上传路径
			var url = "<%=request.getContextPath()%>/updategood.do";
			
			if (null!=ids && ""!=ids) {
				//修改商品的库存量
				$.post(
					//路径
					url,
					//传值
					{
						ids:ids,
						num:amount
					},					
					//回调函数
					function(data) {
						if (true==data) {
							alert("已成功入库");
							window.location.href="<%=request.getContextPath()%>/goodsAction_searchUI.do";
						}else {
							alert("入库失败");
							window.location.href="<%=request.getContextPath()%>/goodsAction_searchUI.do";
						}
					},
					//返回类型
					"json"
				);
			} else {
				//添加新的商品(商品信息不存在)
				var url = "<%=request.getContextPath()%>/addgood.do";
				
				$.post(
					//路径
					url,
					//传值
					$("form").serialize(),
					//回调函数
					function(data) {
						if (true==data) {
							alert("已成功入库");
							window.location.href="<%=request.getContextPath()%>/goodsAction_searchUI.do";
						} else {
							alert("入库失败");
							window.location.href="<%=request.getContextPath()%>/goodsAction_searchUI.do";
						}
					},
					//返回类型
					"json"
				);
			}
		}
	</script>
</html>