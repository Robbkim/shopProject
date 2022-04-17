package com.itbank.shop;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.shop.model.BoardDTO;
import com.itbank.shop.model.ReBoardDTO;
import com.itbank.shop.service.ReBoardMapper;



@Controller
public class ReBoardController {

	@Autowired
	private ReBoardMapper reboardMapper;
	
	
	@RequestMapping("/reboard_list.do")
	public String listBoard(HttpServletRequest req) {
		List<ReBoardDTO> rlist = reboardMapper.listBoard();
		req.setAttribute("relistBoard", rlist);
		return "user/reboard/list";
	}

	@RequestMapping(value="/reboard_write.do", method=RequestMethod.GET)
	public String writeFormBoard(HttpServletRequest req) {
		String snum = req.getParameter("num");
		int num = 0, re_step = 0, re_level = 0;
		if (snum != null) {
			num = Integer.parseInt(snum);
			re_step = Integer.parseInt(req.getParameter("re_step"));
			re_level = Integer.parseInt(req.getParameter("re_level"));
		}
		req.setAttribute("num", num);
		req.setAttribute("re_step", re_step);
		req.setAttribute("re_level", re_level);
		return "user/reboard/writeForm";
	}
	
	@RequestMapping(value="/reboard_write.do", method=RequestMethod.POST)
	public String writeProBoard(HttpServletRequest req, @ModelAttribute ReBoardDTO dto) {
		dto.setIp(req.getRemoteAddr());
		if (dto.getNum() == 0) {
			int res = reboardMapper.updateReStep(-1);
		}else {
			int res = reboardMapper.updateReStep(dto.getRe_step());
			dto.setRe_step(dto.getRe_step() + 1);
			dto.setRe_level(dto.getRe_level() + 1);
		}
		int res = reboardMapper.insertBoard(dto);
		return "redirect:reboard_list.do";
	}
	
	@RequestMapping("/reboard_content.do")
	public String contentBoard(HttpServletRequest req, @RequestParam int num) {
		ReBoardDTO dto = reboardMapper.getBoard(num, "content");
		req.setAttribute("regetBoard", dto);
		return "user/reboard/content";		
	}
	
	@RequestMapping(value="/reboard_delete.do", method=RequestMethod.GET)
	public String deleteFormBoard() {
		return "user/reboard/deleteForm";
	}
	
	@RequestMapping(value="/reboard_delete.do", method=RequestMethod.POST)
	public String deleteProBoard(@RequestParam Map<String, String> params) {
		int res = reboardMapper.deleteBoard(Integer.parseInt(params.get("num")), params.get("passwd"));
		return "redirect:reboard_list.do";
	}
	
	@RequestMapping(value="/reboard_update.do", method=RequestMethod.GET)
	public String updateFormBoard(HttpServletRequest req, @RequestParam int num) {
		ReBoardDTO dto = reboardMapper.getBoard(num, "update");
		req.setAttribute("regetBoard", dto);
		return "user/reboard/updateForm";
	}
	
	@RequestMapping(value="/reboard_update.do", method=RequestMethod.POST)
	public String updateProBoard(@ModelAttribute ReBoardDTO dto) {
		int res = reboardMapper.updateBoard(dto);
		return "redirect:reboard_list.do";
	
}
}






