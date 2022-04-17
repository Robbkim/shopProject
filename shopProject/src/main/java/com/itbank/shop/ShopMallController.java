package com.itbank.shop;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.shop.model.CategoryDTO;
import com.itbank.shop.model.ProductDTO;
import com.itbank.shop.service.CategoryMapper;
import com.itbank.shop.service.ProductMapper;

@Controller
public class ShopMallController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ProductMapper productMapper;
	
	@RequestMapping("/mall_index.do")
	public String mall_index(HttpServletRequest req) {
		List<CategoryDTO> clist = categoryMapper.listCate();
		HttpSession session = req.getSession();
		Hashtable<String, List<ProductDTO>> plist = (Hashtable)session.getAttribute("plist");
		if (plist == null) {
			plist = new Hashtable<String, List<ProductDTO>>();
		}
		
		List<ProductDTO> list1 = productMapper.prod_listPspec("hit");
		plist.put("hit", list1);
		List<ProductDTO> list2 = productMapper.prod_listPspec("new");
		plist.put("newa", list2);
		List<ProductDTO> list3 = productMapper.prod_listPspec("best");
		plist.put("best", list3);
				
		session.setAttribute("plist", plist);
		session.setAttribute("clist", clist);
		return "user/mall/mall";
	}  
	
	@RequestMapping("/mall_cgList.do")
	public String mall_cgList(HttpServletRequest req, String code) {
		HttpSession session = req.getSession();
		Hashtable<String, List<ProductDTO>> plist = (Hashtable)session.getAttribute("plist");
		List<ProductDTO> list = productMapper.prod_listCode(code+"%");
		List<CategoryDTO> clist = (List)session.getAttribute("clist");
		String cname = null;
		for(CategoryDTO dto : clist) {
			if (dto.getCode().equals(code)) {
				cname = dto.getCname();
			}
		}
		req.setAttribute("cname", cname);
		plist.put(code, list);
		return "user/mall/mall_cgProdList";
	}
	
	@RequestMapping("/mall_prodView.do")
	public String mall_prodView(HttpServletRequest req, @RequestParam Map<String, String> params) {
		HttpSession session = req.getSession();
		Hashtable<String, List<ProductDTO>> plist = (Hashtable)session.getAttribute("plist");
		List<ProductDTO> list = plist.get(params.get("select"));
		for(ProductDTO dto : list) {
			if (dto.getPnum() == Integer.parseInt(params.get("pnum"))){
				req.setAttribute("getProduct", dto);
				break;
			}
		}
		return "user/mall/mall_prodView";
	}
	
	@RequestMapping("/mall_cartAdd.do")
	public String mall_cartAdd(HttpServletRequest req, @RequestParam Map<String, String> params) {
		HttpSession session = req.getSession();
		Hashtable<String, List<ProductDTO>> plist = (Hashtable)session.getAttribute("plist");
		List<ProductDTO> list = plist.get(params.get("select"));
		Hashtable<String, ProductDTO> cart = (Hashtable)session.getAttribute("cart");
		if (cart == null) {
			cart = new Hashtable<String, ProductDTO>();
		}
		for(ProductDTO dto : list) {
			if (dto.getPnum() == Integer.parseInt(params.get("pnum"))){
				if (cart.containsKey(params.get("pnum"))) {
					dto.setPqty(dto.getPqty() + Integer.parseInt(params.get("qty")));
				}else {
					dto.setPqty(Integer.parseInt(params.get("qty")));
					cart.put(params.get("pnum"), dto);
				}
				break;
			}
		}
		session.setAttribute("cart", cart);
		return "redirect:mall_cartList.do";
	}
	
	@RequestMapping("/mall_cartList.do")
	public String mall_cartList() {
		return "user/mall/mall_cartList";
	}
	
	@RequestMapping("/mall_cartDel.do")
	public String mall_cartDel(HttpServletRequest req, String pnum) {
		HttpSession session = req.getSession();
		Hashtable<String, ProductDTO> cart = (Hashtable)session.getAttribute("cart");
		cart.remove(pnum);
		session.setAttribute("cart", cart);
		return "user/mall/mall_cartList";
	}
	
	@RequestMapping("/mall_cartEdit.do")
	public String mall_cartEdit(HttpServletRequest req, @RequestParam Map<String, String> params) {
		HttpSession session = req.getSession();
		Hashtable<String, ProductDTO> cart = (Hashtable)session.getAttribute("cart");
		ProductDTO dto = cart.get(params.get("pnum"));
		dto.setPqty(Integer.parseInt(params.get("pqty")));
		if (dto.getPqty() == 0) {
			cart.remove(params.get("pnum"));
		}
		session.setAttribute("cart", cart);
		return "user/mall/mall_cartList";
	}
	
	@RequestMapping("/coperation_intro.do")
	public String coperation_intro() {
		return "user/coperation/intro";
}
}










