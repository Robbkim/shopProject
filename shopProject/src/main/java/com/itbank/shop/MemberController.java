package com.itbank.shop;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.shop.model.MemberDTO;
import com.itbank.shop.service.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping("/member.do")
	public String member_index() {
		return "admin/member/index";
	}
	
	@RequestMapping("/memberAll.do")
	public String memberAll(HttpServletRequest req, 
							@RequestParam Map<String, String> params){
		List<MemberDTO> list = null;
		if (params.get("mode") == null) {
			req.setAttribute("mode", "all");
			list = memberMapper.listMember();
		}else {
			if (params.get("search") == null) {
				params.put("search", "name");
				params.put("searchString", "");
			}
			req.setAttribute("mode", "find");
			list = memberMapper.findMember(params);
		}
		req.setAttribute("listMember", list);
		return "admin/member/memberAll";
	}
	
	@RequestMapping("/member_delete.do")
	public String member_delete(@RequestParam int no) {
		int res = memberMapper.deleteMember(no);
		return "redirect:memberAll.do";
	}
	
	@RequestMapping(value="/member_update.do", method=RequestMethod.GET)
	public String member_update(HttpServletRequest req, @RequestParam int no) {
		MemberDTO dto = memberMapper.getMember(no);
		req.setAttribute("getMember", dto);
		return "admin/member/member_update";
	}
	
	@RequestMapping(value="/member_update.do", method=RequestMethod.POST)
	public String member_update(MemberDTO dto) {
		int res = memberMapper.updateMember(dto);
		return "redirect:memberAll.do";
	}
	
	@RequestMapping("/memberSsn.do")
	public String memberSsn() {
		return "user/member/memberSsn";
	}
	
	@RequestMapping("/checkMember.do")
	public String checkMember(HttpServletRequest req, 
						@RequestParam Map<String, String> params) {
		boolean isCheck = memberMapper.checkMember(params);
		if (!isCheck) {
			HttpSession session = req.getSession();
			session.setAttribute("name", params.get("name"));
			session.setAttribute("ssn1", params.get("ssn1"));
			session.setAttribute("ssn2", params.get("ssn2"));
			req.setAttribute("msg", "회원가입페이지로 이동합니다.");
			req.setAttribute("url", "member_input.do");
		}else {
			req.setAttribute("msg", "저희 회원이십니다. 로그인을 해 주세요");
			req.setAttribute("url", "index.do");
		}
		return "message"; 
	}
	
	@RequestMapping(value="/member_input.do", method=RequestMethod.GET)
	public String member_input() {
		return "user/member/member_input";
	}
	
	@RequestMapping(value="/member_input.do", method=RequestMethod.POST)
	public String member_input_ok(HttpServletRequest req, MemberDTO dto) {
		int res = memberMapper.insertMember(dto);
		if (res>0) {
			req.setAttribute("msg", "회원가입 성공!! 회원목록페이지로 이동합니다.");
			req.setAttribute("url", "index.do");
		}else {
			req.setAttribute("msg", "회원가입 실패!! 회원가입페이지로 이동합니다.");
			req.setAttribute("url", "memberSsn.do");
		}
		return "message";
	}
	@RequestMapping(value="/member_updateUser.do", method=RequestMethod.GET)
	public String member_update() {
		return "user/member/member_update";
	}
	
	@RequestMapping(value="/member_updateUser.do", method=RequestMethod.POST)
	public String member_update_ok(HttpServletRequest req, MemberDTO dto) {
		int res = memberMapper.updateUserMember(dto);
		if (res>0) {
			req.setAttribute("msg", "회원수정 성공!! main 페이지로 이동합니다.");
			req.setAttribute("url", "index.do");
		}else {
			req.setAttribute("msg", "회원수정 실패!! 다시 입력해 주세요.");
			req.setAttribute("url", "member_updateUser.do");
		}
		return "message";
	}
}
