package com.itbank.shop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.shop.model.CategoryDTO;

@Service
public class CategoryMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<CategoryDTO> listCate(){
		List<CategoryDTO> list = sqlSession.selectList("listCate");
		return list;
	}
	
	public int insertCate(CategoryDTO dto) {
		int res = sqlSession.insert("insertCate", dto);
		return res;
	}
	
	public int deleteCate(int cnum) {
		return sqlSession.delete("deleteCate", cnum);
	}
}
