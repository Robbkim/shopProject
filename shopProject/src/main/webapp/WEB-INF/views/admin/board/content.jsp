<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- content.jsp -->

	<div align="center">
		<b>글내용 보기</b>
		<table border="1" width="600">
			<tr>
				<th width="20%" bgcolor="yellow">글번호</th>
				<td align="center">${getBoard.num}</td>
				<%-- request의 getBoard라는 이름으로 저장한 dto의 getNum()값을 출력 --%>
				<th width="20%" bgcolor="yellow">조회수</th>
				<td align="center">${getBoard.readcount}</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">작성자</th>
				<td align="center">${getBoard.writer}</td>
				<th width="20%" bgcolor="yellow">작성일</th>
				<td align="center">${getBoard.reg_date}</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">글제목</th>
				<td align="center" colspan="3">${getBoard.subject}</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">글내용</th>
				<td align="center" colspan="3">${getBoard.content}</td>
			</tr>
			<tr bgcolor="yellow">
				<td colspan="4" align="right">
					<input type="button" value="글수정"
						onclick="window.location='board_update.do?num=${getBoard.num}'">
					<input type="button" value="글삭제"
					 	onclick="window.location='board_delete.do?num=${getBoard.num}'">
					<input type="button" value="글목록" onclick="window.location='board_list.do'">
				</td>
			</tr>
		</table>
	</div>








