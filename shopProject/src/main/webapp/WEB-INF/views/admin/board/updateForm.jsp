<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- updateForm.jsp -->
	<script type="text/javascript">
		function check(){
			if (f.writer.value==""){
				alert("�̸��� �Է��� �ּ���!!")
				f.writer.focus()
				return false
			}
			if (f.subject.value==""){
				alert("������ �Է��� �ּ���!!")
				f.subject.focus()
				return false
			}
			if (f.content.value==""){
				alert("������ �Է��� �ּ���!!")
				f.content.focus()
				return false
			}
			if (f.passwd.value==""){
				alert("��й�ȣ�� �Է��� �ּ���!!")
				f.passwd.focus()
				return false
			}
			return true
		}
	</script>
</head>
<body>
	<div align="center">
		<form name="f" action="board_update.do" method="post" onsubmit="return check()">
			<input type="hidden" name="num" value="${param.num}"/>
			<table border="1" width="500">
				<tr bgcolor="yellow">
					<th colspan="2">�� �� ��</th>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">�� ��</th>
					<td width="80%"><input type="text" name="writer" value="${getBoard.writer}"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">�� ��</th>
					<td width="80%"><input type="text" name="subject" size="53" value="${getBoard.subject}"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">Email</th>
					<td width="80%"><input type="text" name="email" size="53" value="${getBoard.email}"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">�� ��</th>
					<td width="80%"><textarea name="content" rows="10" cols="50">${getBoard.content}</textarea></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">��й�ȣ</th>
					<td width="80%"><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="�ۼ���">
						<input type="reset" value="�ٽ��ۼ�">
						<input type="button" value="��Ϻ���" onclick="window.location='board_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
