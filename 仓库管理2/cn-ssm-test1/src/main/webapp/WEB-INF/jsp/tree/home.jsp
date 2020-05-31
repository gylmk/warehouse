<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<link href="<c:url value='/css/maple.css'/>" type="text/css" rel=stylesheet></link>
</head>
<BODY topMargin=0 rightMargin=0 marginwidth="0" marginheight="0">
	<TABLE height=91 cellSpacing=0 cellPadding=0 width="100%"
		background=<c:url value='/picture/topbk.jpg'/> border=0>
		<TBODY>
			<TR>
				<TD width=733 background=<c:url value='/picture/header.jpg'/>></TD>
				<TD><FONT style="FONT-SIZE: x-small" color=#fffaed><BR>
					<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT
						color=#804060>当前用户:${user.username} </font> </FONT></TD>
			</TR>
		</TBODY>
	</TABLE>
	<TABLE cellSpacing=0 cellPadding=0 width="80%" height="85%" border=0 background=<c:url value='/picture/bk3.jpg'/>>
		<TBODY>
			<TR>
				<TD vAlign=top width="12%">
					<TABLE cellSpacing=0 cellPadding=0 width=104 border=0>
						<TBODY>
							<TR>
								<TD valign=middle align="center"><BR>
								<FONT color=#804060>--系统菜单--</FONT>
								</TD>
							</TR>
							<TR>
								<TD id=left1001 style="CURSOR:hand" valign="middle"
									align="center" background=<c:url value="/picture/img01.jpg"/>
									height=28><FONT color=#804020>收货管理</FONT></TD>
							</TR>
							<TR>
								<TD valign=middle align="center">
									<DIV id=shouhuo>
										<A target="_content" id="left1002" href="${pageContext.request.contextPath }/storeAction_list.do">[仓库管理]</A>
										<BR/> 
										<A target="_content" id="left1002" href="${pageContext.request.contextPath }/goodsAction_searchUI.do">[库存查询]</A>
										<BR/> 
										<A id="left1003" target="_content" href="${pageContext.request.contextPath }/goodsAction_addUI.do">[入库]</A>
										<BR/>
										<a target="_content" href="${pageContext.request.contextPath }/goodsAction_outUI.do">[出库]</a>
										<br/>
										<a target="_content" href="${pageContext.request.contextPath }/historyAction_toHistory.do"/>[历史记录]</a>
										<br/>
										<a target="_parent" href="${pageContext.request.contextPath }/userAction_toLogin.do">[重新登录]</a>
									</DIV>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
				<TD vAlign=top align=left width="100%">
					<iframe name="_content" src="<c:url value='/picture/tyyw.bmp'/>" frameborder="0" width="100%" height="100%"></iframe>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</BODY>
</HTML>

