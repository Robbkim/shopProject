<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_input.jsp -->
<html>
<head>
	<title>ȸ������</title>
	<script type="text/javascript">
		function check(){
			if (f.id.value==""){
				alert("���̵� �Է��� �ּ���!!")
				f.id.focus()
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
		<form name="f" action="member_input.do" method="post" onsubmit="return check()">
			<table border="1" width="600">
				<tr>
					<th colspan="2">ȸ������</th>
				</tr>
				<tr>
					<th>�̸�</th>
					<td><input type="text" name="name" value="${name}" readOnly>
					</td>
				</tr>
				<tr>
					<th>���̵�</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>��й�ȣ</th>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<th>�ֹι�ȣ</th>
					<td><input type="text" name="ssn1" value="${ssn1}" readOnly>-
					<input type="password" name="ssn2" value="${ssn2}" readOnly></td>
				</tr>
				<tr>
					<th>�̸���</th>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<th>��ȭ��ȣ</th>
					<td><input type="text" name="hp1" size="3" maxlength="3"> -
					<input type="text" name="hp2" size="4" maxlength="4"> -
					<input type="text" name="hp3" size="4" maxlength="4"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="�Է�">
						<input type="reset" value="���">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>