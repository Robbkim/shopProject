<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- cate_input.jsp -->
<%@ include file="top.jsp" %>
	<div align="center">
		<form name="f" action="shop_cateInput.do" method="post">
			<table border="1" width="300">
			<caption><h3>ī�װ� ���</h3></caption>
				<tr>
					<th width="40%" bgcolor="yellow">ī�װ��ڵ�</th>
					<td><input type="text" name="code"></td>
				</tr>
				<tr>
					<th width="40%" bgcolor="yellow">ī�װ��̸�</th>
					<td><input type="text" name="cname"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="���">
						<input type="reset" value="���">
					</td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file="bottom.jsp" %>