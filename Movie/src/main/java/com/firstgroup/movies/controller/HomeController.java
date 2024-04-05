package com.firstgroup.movies.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firstgroup.movies.domain.ImgVO;
import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.MoviesVO;
import com.firstgroup.movies.security.CustomUserDetailsService;
import com.firstgroup.movies.security.domain.CustomUser;
import com.firstgroup.movies.service.ActorServiceImpl;
import com.firstgroup.movies.service.ImgServiceImpl;
import com.firstgroup.movies.service.MemberServiceImpl;
import com.firstgroup.movies.service.MoviesService;
import com.firstgroup.movies.service.MoviesServiceImpl;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private MemberServiceImpl memberService;

	@Setter(onMethod_ = @Autowired)
	private MoviesService movService; // 영화 정보

	@Setter(onMethod_ = @Autowired)
	private ActorServiceImpl actorService;
	
	@Setter(onMethod_ = @Autowired)
	private ImgServiceImpl imgService;
	
	@Autowired
	private CustomUserDetailsService customUserDetailsService;


	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		
		List<MoviesVO> movieList = movService.getMovieList();
		 for(MoviesVO vo: movieList) {
	        vo.setImgList(imgService.findByBno("tbl_movies_img", vo.getMovBno()));
	      }
		model.addAttribute("movieList",movieList);
		
		return "home";
	}

	@GetMapping("/loginAuth")
	public void loginAuth(Model model) {
		log.info(model);
	}

	@GetMapping("/member/register")
	public String register() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof AnonymousAuthenticationToken)
			return "/member/register";
		return "redirect:/";

	}

	@PostMapping("/member/register")
	public String register(@Validated @RequestBody MemberVO memVo) {
		log.info(memVo);
		memberService.register(memVo);
		for(ImgVO img : memVo.getImgList()) {
			img.setTblName("tbl_member_img");
			img.setBno(memVo.getMembno());
			imgService.insert(img);
		}
		return "redirect:/loginAuth";
	}

	@GetMapping("/member/update") // 회원 정보 수정 페이지
	public String editPage(@AuthenticationPrincipal Model model) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		MemberVO memVo = memberService.getMember(user.getMember().getId());
		memVo.setImgList(imgService.findByBno("tbl_member_img", memVo.getMembno()));
		log.info(memVo);
		model.addAttribute("user", memVo);
		return "/member/editPage";

	}
	
	@PostMapping("/member/update")
	public String edit(@RequestBody MemberVO memVo) { //회원 정보 수정
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memVo.setId(user.getUsername());
		log.info(memVo);
		memberService.edit(memVo); 
		log.info(user);
		ImgVO tmp = memVo.getImgList().get(0);
		tmp.setBno(memVo.getMembno());
		tmp.setTblName("tbl_member_img");
		imgService.delete(tmp);
		for (ImgVO vo : memVo.getImgList()) {
			vo.setBno(memVo.getMembno());
			vo.setTblName("tbl_member_img");
			imgService.insert(vo);
		}
		sessionReset(user.getUsername());
		
		return "redirect:/"; 
	}
	
	@PostMapping("/member/delete")
	@ResponseBody
	public Map<String, String> withDrawMember(@RequestBody Map<String,String> requestData,HttpServletRequest request) {
		Map<String, String> response = new HashMap<>();
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logout(request);
		String result = requestData.get("bno");
	    Long bno = Long.parseLong(result);
		log.info("delete : " + bno);
		memberService.withdraw(bno,user.getUsername());
		ImgVO vo = new ImgVO();
		vo.setBno(bno);
		vo.setTblName("tbl_member_img");
		
		imgService.delete(vo);
		
		response.put("status","success");
		response.put("message","회원 탈퇴가 성공적으로 처리되었습니다.");
		return response;
	}
	
	@GetMapping("/home")
	public void home(Model model) {
		log.info(model);
		List<MoviesVO> movieList = movService.getMovieList();
		 for(MoviesVO vo: movieList) {
	        vo.setImgList(imgService.findByBno("tbl_movies_img", vo.getMovBno()));
	      }
		model.addAttribute("movieList",movieList);
	}
	
	public void sessionReset(String username) { //인증정보 갱신
	    UserDetails userDetails = customUserDetailsService.loadUserByUsername(username);
	    Authentication newAuthentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
	    SecurityContextHolder.getContext().setAuthentication(newAuthentication);
	}
	
	public void logout(HttpServletRequest request) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null) {
	        new SecurityContextLogoutHandler().logout(request, null, auth);
	    }
	}

}
