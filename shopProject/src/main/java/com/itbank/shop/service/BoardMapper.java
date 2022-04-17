package com.itbank.shop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.shop.model.BoardDTO;

@Service
public class BoardMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardDTO> listBoard(){
		List<BoardDTO> list = sqlSession.selectList("listBoard");
		return list;
	}
	
	public BoardDTO getBoard(int num, String mode) {
		if (mode.equals("content")) {
			sqlSession.update("readCount", num);
		}
		BoardDTO dto = sqlSession.selectOne("getBoard", num);
		return dto;
	}
	
	public int insertBoard(BoardDTO dto) {
		int res = sqlSession.insert("insertBoard", dto);
		return res;
	}
	
	public int deleteBoard(int num, String passwd) {
		BoardDTO dto = sqlSession.selectOne("getBoard", num);
		if (dto.getPasswd().equals(passwd)) {
			int res = sqlSession.delete("deleteBoard", num);
			return res;	
		}else {
			return -1;
		}
	}
	
	public int updateBoard(BoardDTO dto) {
		BoardDTO dbDTO = sqlSession.selectOne("getBoard", dto.getNum());
		if (dto.getPasswd().equals(dbDTO.getPasswd())) {
			int res = sqlSession.update("updateBoard", dto);
			return res;	
		}else {
			return -1;
		}
	}
}








