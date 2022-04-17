<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%@ include file="top.jsp" %>
<h3>Welcome to My Mall</h3> 
<c:if test="${empty plist.hit}">
	<b></b><c:out value="HIT상품이 없습니다"/></b><br>
</c:if>	  
<c:if test="${not empty plist.hit}">
	<hr color="green" width="80%">
	<font color="red" size="3">HIT</font>
	<hr color="green" width="80%">
	<br>
	<table width="100%" border="0" align="center">
		<tr>
		<c:set var="count" value="0"/>
		<c:forEach var="pdto" items="${plist.hit}">
			<c:set var="count" value="${count+1}"/>
			<td align="center">
				<a href="mall_prodView.do?pnum=${pdto.pnum}&select=hit">
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
<c:if test="${empty plist.newa}">
	<b></b><c:out value="NEW상품이 없습니다"/></b><br>
</c:if>	  
<c:if test="${not empty plist.newa}">
	<hr color="green" width="80%">
		<font color="red" size="3">NEW</font>
		<hr color="green" width="80%">
		<br>
		<table width="100%" border="0" align="center">
		<tr>
		<c:set var="count" value="0"/>
		<c:forEach var="pdto" items="${plist.newa}">
			<c:set var="count" value="${count+1}"/>
			<td align="center">
				<a href="mall_prodView.do?pnum=${pdto.pnum}&select=newa">
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
<c:if test="${empty plist.best}">
	<b></b><c:out value="BEST상품이 없습니다"/></b><br>
</c:if>	  
<c:if test="${not empty plist.best}">
	<hr color="green" width="80%">
		<font color="red" size="3">BEST</font>
		<hr color="green" width="80%">
		<br>
		<table width="100%" border="0" align="center">
		<tr>
		<c:set var="count" value="0"/>
		<c:forEach var="pdto" items="${plist.best}">
			<c:set var="count" value="${count+1}"/>
			<td align="center">
				<a href="mall_prodView.do?pnum=${pdto.pnum}&select=best">
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
			
			
			
			
			
			
			
			
			
			
			