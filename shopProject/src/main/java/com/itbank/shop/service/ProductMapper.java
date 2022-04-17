package com.itbank.shop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.shop.model.ProductDTO;

@Service
public class ProductMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<ProductDTO> prod_list(){
		List<ProductDTO> list = sqlSession.selectList("listProduct");
		return list;
	}
	
	public int prod_input(ProductDTO dto) {
		int res = sqlSession.insert("insertProduct", dto);
		return res;
	}
	
	public ProductDTO prod_getProduct(int pnum) {
		return sqlSession.selectOne("getProduct", pnum);
	}
	
	public int prod_delete(int pnum) {
		return sqlSession.delete("deleteProduct", pnum);
	}
	
	public int prod_update(ProductDTO dto) {
		return sqlSession.update("updateProduct", dto);
	}
	
	public List<ProductDTO> prod_listPspec(String spec){
		return sqlSession.selectList("listPspec", spec);
	}
	
	public List<ProductDTO> prod_listCode(String code){
		return sqlSession.selectList("listCode", code);
	}
}
