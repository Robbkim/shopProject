package com.itbank.shop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.shop.model.BoardDTO;
import com.itbank.shop.model.ReBoardDTO;



@Service
public class ReBoardMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ReBoardDTO> listBoard(){
		List<ReBoardDTO> rlist = sqlSession.selectList("relistBoard");
		return rlist;
	}
	
	public ReBoardDTO getBoard(int num, String mode) {
		if (mode.equals("content")) {
			sqlSession.update("rereadCount", num);
		}
		ReBoardDTO dto = sqlSession.selectOne("regetBoard", num);
		return dto;
	}
	
	public int insertBoard(ReBoardDTO dto) {
		int res = sqlSession.insert("reinsertBoard", dto);
		return res;
	}
	
	public int updateReStep(int re_step) {
		int res = sqlSession.update("replusReStep", re_step);
		return res;
	}
	
	public int deleteBoard(int num, String passwd) {
		ReBoardDTO dto = sqlSession.selectOne("regetBoard", num);
		if (dto.getPasswd().equals(passwd)) {
			int res = sqlSession.delete("redeleteBoard", num);
			return res;	
		}else {
			return -1;
		}
	}
	
	public int updateBoard(ReBoardDTO dto) {
		ReBoardDTO dbDTO = sqlSession.selectOne("regetBoard", dto.getNum());
		if (dto.getPasswd().equals(dbDTO.getPasswd())) {
			int res = sqlSession.update("reupdateBoard", dto);
			return res;	
		}else {
			return -1;
		}
}
}







