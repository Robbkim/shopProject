<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- content.jsp -->

	<div align="center">
		<b>�۳��� ����</b>
		<table border="1" width="600">
			<tr>
				<th width="20%" bgcolor="yellow">�۹�ȣ</th>
				<td align="center">${getBoard.num}</td>
				<%-- request�� getBoard��� �̸����� ������ dto�� getNum()���� ��� --%>
				<th width="20%" bgcolor="yellow">��ȸ��</th>
				<td align="center">${getBoard.readcount}</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">�ۼ���</th>
				<td align="center">${getBoard.writer}</td>
				<th width="20%" bgcolor="yellow">�ۼ���</th>
				<td align="center">${getBoard.reg_date}</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">������</th>
				<td align="center" colspan="3">${getBoard.subject}</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">�۳���</th>
				<td align="center" colspan="3">${getBoard.content}</td>
			</tr>
			<tr bgcolor="yellow">
				<td colspan="4" align="right">
					<input type="button" value="�ۼ���"
						onclick="window.location='board_update.do?num=${getBoard.num}'">
					<input type="button" value="�ۻ���"
					 	onclick="window.location='board_delete.do?num=${getBoard.num}'">
					<input type="button" value="�۸��" onclick="window.location='board_list.do'">
				</td>
			</tr>
		</table>
	</div>








