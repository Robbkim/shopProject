package com.itbank.shop.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.shop.model.MemberDTO;

@Service
public class MemberMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<MemberDTO> listMember(){
		return sqlSession.selectList("listMember");
	}
	
	public List<MemberDTO> findMember(Map<String, String> params){
		return sqlSession.selectList("findMember", params);
	}
	
	public int deleteMember(int no) {
		return sqlSession.delete("deleteMember", no);
	}
	
	public MemberDTO getMember(int no) {
		return sqlSession.selectOne("getMember", no);
	}
	
	public int updateMember(MemberDTO dto) {
		return sqlSession.update("updateMember", dto);
	}
	
	public boolean checkMember(Map map) {
		MemberDTO dto = sqlSession.selectOne("checkMember", map);
		if (dto == null) return false;
		return true;
	}
	
	public int insertMember(MemberDTO dto) {
		return sqlSession.insert("insertMember", dto);
	}
	
	public MemberDTO login(String id) {
		return sqlSession.selectOne("login", id);
	}
	
	public int updateUserMember(MemberDTO dto) {
		return sqlSession.update("updateUserMember", dto);
	}
}








