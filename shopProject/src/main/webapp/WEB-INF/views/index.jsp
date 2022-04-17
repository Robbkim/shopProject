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
				<a href="login.do">로그인</a> | <a href="memberSsn.do">회원가입</a>
			</c:if>
			<c:if test="${not empty member}">
				${member.name}님 로그인중......
				<a href="member_updateUser.do">내정보수정</a> | <a href="logout.do">로그아웃</a>
			</c:if>
		</td>	
			
		</tr>
	</table>
	<table border="1" width="800" height="650">
		<tr height="10%">
			<td align="center">
				<a href="index.do">홈</a> | 
				<a href="mall_index.do">쇼핑몰</a> | 
				<a href="board_list.do">Q&A게시판</a> |
				<a href="reboard_list.do">사용자게시판</a> | 
				<a href="coperation_intro.do">회사소개</a>
			</td>
		</tr>
		<tr>
			<td>
				<img src="resources/img/Entrance.jpg" width="100%" height="100%">
			</td>
		</tr>
		<tr height="10%">
			<td align="center">Y H 아 기 세 상</td>
		</tr>
	</table>
	</div>
</body>
</html>