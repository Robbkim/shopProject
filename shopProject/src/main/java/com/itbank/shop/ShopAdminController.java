package com.itbank.shop;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.shop.model.CategoryDTO;
import com.itbank.shop.model.ProductDTO;
import com.itbank.shop.service.CategoryMapper;
import com.itbank.shop.service.ProductMapper;

@Controller
public class ShopAdminController {
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ProductMapper productMapper;
	
	@RequestMapping("/shop_admin.do")
	public String index() {
		return "admin/shop/shopIndex";
	}
	
	@RequestMapping(value="/shop_cateInput.do", method=RequestMethod.GET)
	public String cate_input() {
		return "admin/shop/cate_input";
	}
	
	@RequestMapping(value="/shop_cateInput.do", method=RequestMethod.POST)
	public String cate_input_ok(CategoryDTO dto) {
		int res = categoryMapper.insertCate(dto);
		return "redirect:shop_cateList.do";
	}
	
	@RequestMapping("/shop_cateList.do")
	public String cate_list(HttpServletRequest req) {
		List<CategoryDTO> list = categoryMapper.listCate();
		req.setAttribute("listCate", list);
		return "admin/shop/cate_list";
	}
	
	@RequestMapping("/shop_cateDelete.do")
	public String cate_delete(int cnum) {
		int res = categoryMapper.deleteCate(cnum);
		return "redirect:shop_cateList.do";
	}
	
	@RequestMapping(value="/shop_prodInput.do", method=RequestMethod.GET)
	public String prod_input(HttpServletRequest req) {
		List<CategoryDTO> list = categoryMapper.listCate();
		if (list == null && list.size()==0) {
			return "admin/shop/cate_input";
		}
		req.setAttribute("listCate", list);
		return "admin/shop/prod_input";
	}
	
	@RequestMapping(value="/shop_prodInput.do", method=RequestMethod.POST)
	public String prod_input_ok(HttpServletRequest req, 
			ProductDTO dto, BindingResult result) {
		if (result.hasErrors()) {
			dto.setPimage("");
		}
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("pimage");
		
		String newFile = mf.getOriginalFilename();
		dto.setPimage(newFile);
		String pcode = req.getParameter("pcode");
		dto.setPcategory_fk(dto.getPcategory_fk() + pcode);
		int res = productMapper.prod_input(dto);
		try {
			File file = new File(uploadPath, newFile);
			mf.transferTo(file);
		}catch(IOException e) {}
		
		return "redirect:shop_prodList.do";
	}
	
	@RequestMapping("/shop_prodList.do")
	public String prod_list(HttpServletRequest req) {
		List<ProductDTO> list = productMapper.prod_list();
		req.setAttribute("listProd", list);
		return "admin/shop/prod_list";
	} 
	
	@RequestMapping("/shop_prodView.do")
	public String prod_view(HttpServletRequest req, int pnum) {
		ProductDTO dto = productMapper.prod_getProduct(pnum);
		req.setAttribute("getProduct", dto);
		return "admin/shop/prod_view";
	}
	
	@RequestMapping("/shop_prodDelete.do")
	public String prod_delete(@RequestParam Map<String, String> params) {
		int res = productMapper.prod_delete(Integer.parseInt(params.get("pnum")));
		if (res>0) {
			File file =	new File("C:\\Users\\USER\\eclipse-workspace-maven\\shopProject\\src\\main\\webapp\\resources\\img", params.get("pimage"));
			file.delete();
		}
		
		return "redirect:shop_prodList.do";
	}
	
	@RequestMapping(value="/shop_prodUpdate.do", method=RequestMethod.GET)
	public String prod_update(HttpServletRequest req, int pnum) {
		ProductDTO dto = productMapper.prod_getProduct(pnum);
		req.setAttribute("getProduct", dto);
		return "admin/shop/prod_update";
	}

	@RequestMapping(value="/shop_prodUpdate.do", method=RequestMethod.POST)
	public String prod_update_ok(HttpServletRequest req, 
			ProductDTO dto, BindingResult result) {
		if (result.hasErrors()) {
			dto.setPimage("");
		}
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("pimage");
		
		String newFile = mf.getOriginalFilename();
		try {
			File file = new File(uploadPath, newFile);
			if (file.length() == 0) {
				dto.setPimage(req.getParameter("pimage2"));
			}else {
				dto.setPimage(newFile);
				mf.transferTo(file);
			}
		}catch(IOException e) {}
				
		int res = productMapper.prod_update(dto);
				
		return "redirect:shop_prodList.do";
	}
	
	@RequestMapping("/moneylist.do")
	public String money() {
		return "admin/money/moneylist";

}
}
