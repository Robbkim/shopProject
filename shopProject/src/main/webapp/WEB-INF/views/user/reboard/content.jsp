<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- content.jsp -->

	<div align="center">
		<b>�۳��� ����</b>  
		<table border="1" width="600">
			<tr>
				<th width="20%" bgcolor="yellow">�۹�ȣ</th>
				<td align="center">${regetBoard.num}</td>
				<%-- request�� getBoard��� �̸����� ������ dto�� getNum()���� ��� --%>
				<th width="20%" bgcolor="yellow">��ȸ��</th>
				<td align="center">${regetBoard.readcount}</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">�ۼ���</th>
				<td align="center">${regetBoard.writer}</td>
				<th width="20%" bgcolor="yellow">�ۼ���</th>
				<td align="center">${regetBoard.reg_date}</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">������</th>
				<td align="center" colspan="3">${regetBoard.subject}</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">�۳���</th>
				<td align="center" colspan="3">${regetBoard.content}</td>
			</tr>
			<tr bgcolor="yellow">
				<td colspan="4" align="right">
					<input type="button" value="��۴ޱ�"
						onclick="window.location='reboard_write.do?num=${regetBoard.num}&re_step=${regetBoard.re_step}&re_level=${regetBoard.re_level}'">
					<input type="button" value="�ۼ���"
						onclick="window.location='reboard_update.do?num=${regetBoard.num}'">
					<input type="button" value="�ۻ���"
					 	onclick="window.location='reboard_delete.do?num=${regetBoard.num}'">
					<input type="button" value="�۸��" onclick="window.location='reboard_list.do'">
				</td>
			</tr>
		</table>
	</div>








