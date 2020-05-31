<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>历史记录</title>
		<link rel="stylesheet" type="text/css"
			href="<c:url value='/css/maple.css'/>"></link>
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jquery-ui-1.9.2.custom.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui-1.9.2.custom.js"></script>
<script type="text/javascript">
$(function(){
	//alert("运行");
	var url = "${pageContext.request.contextPath}/goodsAction_findAllStore.do";
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

	

	$("#nm2").blur(function(){
		//alert("test");
		var url = "${pageContext.request.contextPath}/goodsAction_findGoodsByNm"
		$.post(url,{'nm':$(this).val()},function(data){
				if(data=='0'){//没查到nm对应的记录
					$("#goods_id").val('');
					$("#goods_name").val('');
					$("#selectStores").val('');
				}else{//查到nm对应的记录
					$("#goods_id").val(data.id);
					$("#goods_name").val(data.name);
					$("#selectStores").val(data.store.id);

				}	
			},'json');
		});

//------------------------------
	// 根据用户输入 即时查询
	$("#goods_name").autocomplete({
		//request用户请求的数据   response 服务器响应的数据
		source:function(request,response){
			//alert(request.term);
			var url = "${pageContext.request.contextPath}/goodsAction_findLinkByName";
			$.post(url,{'name':request.term},function(data){
					response(data);
				});
			
		},
		select:function(event,obj){
			//obj.item.value  获取选中的值,传到action,再然后通过各层 在数据库查询些name对应的对象 通过json回传到页面
			var name = obj.item.value;
			var url = "${pageContext.request.contextPath}/goodsAction_findGoodsByName"
			$.post(url,{'name':name},function(data){
				$("#goods_id").val(data.id);
				$("#nm2").val(data.nm);
				$("#selectStores").val(data.store.id);
				},'json');
		//	alert(obj.item.value);
			}
		});
	});
</script>
	</head>
	<body>
		<table border="0" class="tx" width="100%">
			<tr>
				<td>
					当前位置&gt;&gt;首页&gt;&gt;出入库历史记录
				</td>
			</tr>
		</table>
		<br>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td rowspan="1">
		<form action="${pageContext.request.contextPath}/goodsAction_searchUI.do" namespace="/" method="post" name="select" theme="simple">
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="tx" align="center">
							<colgroup>
								<col width="20%" align="right">
								<col width="*%" align="left">
							</colgroup>
							<tr>
								<td bgcolor="a0c0c0" style="padding-left: 10px;" colspan="2" align="left">
									<b>查询条件：</b>
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
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="tx" align="center">
							<colgroup>
								<col width="20%" align="right">
								<col width="*%" align="left">
							</colgroup>
							<tr>
								<td bgcolor="a0c0c0" style="padding-left: 10px;" colspan="1"
									align="left">
									<b>货物库存：</b>
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
												时间
											</td>
											<td>
												类型
											</td>
											<td>
												单位
											</td>
											<td>
												数量
											</td>
											<td>
												库存余量
											</td>
											<td>
												仓库
										</td>
											<td>
												操作员
											</td>
										</tr>
								<c:forEach items="${listhistory}" var="history">		
									<tr>
										<td>
											${history.nm}
										</td>
										<td>
											${history.goodname}
										</td>
										<td>
											${history.datetime}
										</td>
										<td>
											${history.type}
										</td>
										<td>
											${history.unit}
										</td>
										<td>
											${history.amounts}
										</td>
										<td>
											${history.remain}
										</td>
										<td>
											${history.name}
										</td>
										<td>
											${user.username}
										</td>
									</tr>
								</c:forEach>	
							</table>
						</td>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>

