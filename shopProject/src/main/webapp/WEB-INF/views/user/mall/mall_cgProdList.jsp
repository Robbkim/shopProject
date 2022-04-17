<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>
<h3>Welcome to My Mall</h3> 

	<hr color="green" width="80%">
	<font color="red" size="3">${cname}</font>
	<hr color="green" width="80%">	
	<c:if test="${empty plist[param.code]}">
		<b></b><c:out value="준비된 상품이 없습니다."/></b>
	</c:if>
	<c:if test="${not empty plist[param.code]}">
		<table width="100%" border="0" align="center">
		<tr>
		<c:set var="count" value="0"/>
		<c:forEach var="pdto" items="${plist[param.code]}">
			<c:set var="count" value="${count+1}"/>
			<td align="center">
				<a href="mall_prodView.do?pnum=${pdto.pnum}&select=${param.code}">
					<img src="resources/img/${pdto.pimage}" width="80" height="60" border="0"><br>
				</a>	
				${pdto.pname}<br>
				<font color="red">${pdto.price}</font>원<br>
				<font color="blue">[${pdto.point}]</font>point
			</td>
			<c:if test="${count%3==0}">
				</tr><tr>
			</c:if>	
		</c:forEach>
		</tr>
	</table>
	</c:if>
<%@ include file="bottom.jsp"%>

 
 
 
 
 
 
 
 
 