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
import com.itbank.shop.service.BoardMapper;


@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping("/board_list.do")
	public String listBoard(HttpServletRequest req) {
		List<BoardDTO> list = boardMapper.listBoard();
		req.setAttribute("listBoard", list);
		return "admin/board/list";
	}

	@RequestMapping(value="/board_write.do", method=RequestMethod.GET)
	public String writeFormBoard() {
		return "admin/board/writeForm";
	}
	
	@RequestMapping(value="/board_write.do", method=RequestMethod.POST)
	public String writeProBoard(HttpServletRequest req, @ModelAttribute BoardDTO dto) {
		dto.setIp(req.getRemoteAddr());
		int res = boardMapper.insertBoard(dto);
		return "redirect:board_list.do";
	}
	
	@RequestMapping("/board_content.do")
	public String contentBoard(HttpServletRequest req, @RequestParam int num) {
		BoardDTO dto = boardMapper.getBoard(num, "content");
		req.setAttribute("getBoard", dto);
		return "admin/board/content";		
	}
	
	@RequestMapping(value="/board_delete.do", method=RequestMethod.GET)
	public String deleteFormBoard() {
		return "admin/board/deleteForm";
	}
	
	@RequestMapping(value="/board_delete.do", method=RequestMethod.POST)
	public String deleteProBoard(@RequestParam Map<String, String> params) {
		int res = boardMapper.deleteBoard(Integer.parseInt(params.get("num")), params.get("passwd"));
		return "redirect:board_list.do";
	}
	
	@RequestMapping(value="/board_update.do", method=RequestMethod.GET)
	public String updateFormBoard(HttpServletRequest req, @RequestParam int num) {
		BoardDTO dto = boardMapper.getBoard(num, "update");
		req.setAttribute("getBoard", dto);
		return "admin/board/updateForm";
	}
	
	@RequestMapping(value="/board_update.do", method=RequestMethod.POST)
	public String updateProBoard(@ModelAttribute BoardDTO dto) {
		int res = boardMapper.updateBoard(dto);
		return "redirect:board_list.do";
	} 

}







