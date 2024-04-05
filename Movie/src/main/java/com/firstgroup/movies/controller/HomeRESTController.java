package com.firstgroup.movies.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.firstgroup.movies.domain.AuthVO;
import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.PageVO;
import com.firstgroup.movies.service.ActorServiceImpl;
import com.firstgroup.movies.service.MemberServiceImpl;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class HomeRESTController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberServiceImpl memberService;
	@Setter(onMethod_ = @Autowired)
	private ActorServiceImpl actorService;
	
	@GetMapping(value="/admin/memberList")
	public ModelAndView memberList(@ModelAttribute Criteria cri) {
		log.info("MemberList : " +cri);
		
		PageVO page = new PageVO(cri, memberService.getTotal(cri));
		log.info(page);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/memberList");
		List<MemberVO> memberList = memberService.getMemListWithPasing(cri);
		for(MemberVO member : memberList) {
			log.info(member);
		}
		mv.addObject("members", memberList);
		mv.addObject("pageMaker",page);
		return mv;
	}
	
	@PostMapping(value="/admin/authChange")
	public String authChange(@RequestBody AuthVO auth) {
		log.info(auth);
		
		memberService.updateAuth(auth);
		
		return auth.getId();
	}
	
	/*
	 * @PostMapping(value="/update/{membno}", produces =
	 * MediaType.MULTIPART_FORM_DATA_VALUE) public ModelAndView
	 * updateUser(@PathVariable long membno, @RequestBody MemberVO memVo) {
	 * ModelAndView mv = new ModelAndView(); log.info(membno + " : " + memVo);
	 * //memberService.edit(memVo); mv.setViewName("/update");
	 * 
	 * return mv; }
	 */
}
