<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- list.jsp -->
	<div align="center">
		<b>�� �� ��</b>
		<table border="0" width="800">
			<tr bgcolor="yellow">
				<td align="right"><a href="reboard_write.do">�۾���</a></td>
			</tr>
		</table>
		<table border="1" width="800">
			<tr bgcolor="green">
				<th>��ȣ</th>
				<th width="40%">����</th>
				<th>�ۼ���</th>
				<th>�ۼ���</th>
				<th>��ȸ</th>
				<th>IP</th>
			</tr>
		<c:if test="${empty relistBoard}">
			<tr>
				<td colspan="6">��ϵ� �Խñ��� �����ϴ�.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${relistBoard}">
			<tr>
				<td>${dto.num}</td>
				<td>
					<c:if test="${dto.re_level> 0}">
						<c:forEach var="i" begin="1" end="${dto.re_level}">
							&nbsp;
						</c:forEach>
						->
					</c:if>
					<a href="reboard_content.do?num=${dto.num}">${dto.subject}</a>
				</td>
				<td>${dto.writer}</td>
				<td>${dto.reg_date}</td>
				<td>${dto.readcount}</td>
				<td>${dto.ip}</td>
			</tr>
		</c:forEach>
		</table>
	</div>






