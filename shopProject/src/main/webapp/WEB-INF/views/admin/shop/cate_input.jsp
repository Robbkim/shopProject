<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- cate_input.jsp -->
<%@ include file="top.jsp" %>
	<div align="center">
		<form name="f" action="shop_cateInput.do" method="post">
			<table border="1" width="300">
			<caption><h3>카테고리 등록</h3></caption>
				<tr>
					<th width="40%" bgcolor="yellow">카테고리코드</th>
					<td><input type="text" name="code"></td>
				</tr>
				<tr>
					<th width="40%" bgcolor="yellow">카테고리이름</th>
					<td><input type="text" name="cname"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="등록">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file="bottom.jsp" %>