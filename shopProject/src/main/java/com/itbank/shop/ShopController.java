package com.itbank.shop;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.shop.model.MemberDTO;
import com.itbank.shop.service.MemberMapper;

@Controller
public class ShopController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping(value = {"/", "/index.do"})
	public String index() {
		return "index";
	}
	 
	@RequestMapping("/adminIndex.do")
	public String adminIndex() {
		return "admin/adminIndex";
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "user/login/login";
	}
	
	@RequestMapping("/login_ok.do")
	public String login_ok(HttpServletRequest req, @RequestParam Map<String, String> params) {
		MemberDTO dto = memberMapper.login(params.get("id"));
		if (dto == null) {
			req.setAttribute("msg", "���̵� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���!!");
			req.setAttribute("url", "login.do");
		}else if (dto.getPasswd().equals(params.get("passwd"))) {
			req.setAttribute("msg", dto.getName()+"���� �α��� �ϼ̽��ϴ�.");
			HttpSession session = req.getSession();
			session.setAttribute("member", dto);
			if (dto.getId().equals("admin")) {
				req.setAttribute("url", "adminIndex.do");
			}else {
				req.setAttribute("url", "index.do");
			}
		}else {
			req.setAttribute("msg", "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���!!");
			req.setAttribute("url", "login.do");
		}
		return "message";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		req.setAttribute("msg", "�α׾ƿ� �Ǿ����ϴ�.");
		req.setAttribute("url", "index.do");
		return "message";
	}
}



