<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html>
<head>
	<title>���θ�������</title>
</head>
<body>
	<div align="center">
		<table border="1" width="800" height="650">
			<tr height="50">
				<th width="20%"><a href="index.do">main</a></th>
				<th width="20%"><a href="mall_index.do">���θ�</a></th>
				<th width="20%"><a href="mall_cartList.do">��ٱ���</a></th>
				<th width="20%"><a href="coperation_intro.do">ȸ��Ұ�</a></th>
			</tr>
			<tr>
				<td valign="top">
					Tree/view
					<table border="1">
					<c:forEach var="clist" items="${clist}">
							<tr>
								<td><a href="mall_cgList.do?code=${clist.code}">${clist.cname}[${clist.code}]</a></td>
							</tr>
					</c:forEach>
					</table>
				</td>
				<td align="center" colspan="4">