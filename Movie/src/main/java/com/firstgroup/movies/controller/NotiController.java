package com.firstgroup.movies.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.NotiVO;
import com.firstgroup.movies.domain.PageVO;
import com.firstgroup.movies.service.NotiService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NotiController {
	//@Setter(onMethod_ = @Autowired)
	private NotiService service;
	
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	@PostMapping("/register")
	public String register(NotiVO noti, RedirectAttributes rttr) {
		
		log.info("register: " + noti);
		
		service.register(noti);
		
		rttr.addFlashAttribute("result", noti.getBno());
		
		return "redirect:/notice/list";
	}
	@GetMapping("/register")
	public void register() {

	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri")
	Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("notice", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(NotiVO noti, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if(service.modify(noti)) {
			rttr.addFlashAttribute("result", "success");
			//값을 받으면 NotiMapper에서 update를 해준다.
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/notice/list";
	}
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/notice/list";
		
	}
	
}
