<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<table border="0" width="800">
		<tr>
		<td align="right">
			<c:if test="${empty member}">
				<a href="login.do">�α���</a> | <a href="memberSsn.do">ȸ������</a>
			</c:if>
			<c:if test="${not empty member}">
				${member.name}�� �α�����......
				<a href="member_updateUser.do">����������</a> | <a href="logout.do">�α׾ƿ�</a>
			</c:if>
		</td>	
			
		</tr>
	</table>
	<table border="1" width="800" height="650">
		<tr height="10%">
			<td align="center">
				<a href="index.do">Ȩ</a> | 
				<a href="mall_index.do">���θ�</a> | 
				<a href="board_list.do">Q&A�Խ���</a> |
				<a href="reboard_list.do">����ڰԽ���</a> | 
				<a href="coperation_intro.do">ȸ��Ұ�</a>
			</td>
		</tr>
		<tr>
			<td>
				<img src="resources/img/Entrance.jpg" width="100%" height="100%">
			</td>
		</tr>
		<tr height="10%">
			<td align="center">Y H �� �� �� ��</td>
		</tr>
	</table>
	</div>
</body>
</html>