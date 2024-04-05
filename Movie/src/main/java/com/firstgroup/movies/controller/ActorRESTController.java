package com.firstgroup.movies.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.firstgroup.movies.domain.ActorVO;
import com.firstgroup.movies.domain.ImgVO;
import com.firstgroup.movies.service.ActorServiceImpl;
import com.firstgroup.movies.service.ImgServiceImpl;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController 						// 이 클래스가 REST 컨트롤러라는 걸 명시 여기서 URL 요청을 처리
@RequestMapping("/actor/*") 			// 이 컨트롤러에서 '/actor/'로 시작하는 모든 요청을 처리하도록 설정
@Log4j2 								// 로깅을 위한 어노테이션 로그를 쉽게 남길 수 있게 도와줌
public class ActorRESTController {
	
	@Setter(onMethod_ = @Autowired) 	// 스프링이 알아서 service를 주입 이게 있어야 서비스 사용 가능
	private ActorServiceImpl service; 	// 배우 정보를 처리하는 서비스
	@Setter(onMethod_ = @Autowired) 	// 스프링이 알아서 imgService주입 이걸로 이미지 서비스 사용
	private ImgServiceImpl imgService; 	// 이미지 정보를 처리하는 서비스
	
	@GetMapping("/list") 								// 배우 리스트 페이지로 가는 메서드 모델에 데이터 넣고 뷰로 이동
	public ModelAndView actorList(Model model) {
		log.info("REST actorList..........."); 			// 로그로 배우 리스트 요청받았다고 알려줌
		ModelAndView mv = new ModelAndView(); 			// 데이터와 뷰 함께 다룰 ModelAndView 객체를 만듦
		mv.setViewName("/actor/actorList"); 			// 뷰 이름 설정. '/actor/actorList'로 이동
		List<ActorVO> actList = service.actorList(); 	// 서비스에서 배우 리스트 가져옴
		for(ActorVO atv : actList) { 					// 배우 리스트를 돌면서
			atv.setImgList(imgService.findByBno("tbl_actor_img", atv.getActbno())); // 각 배우별로 이미지 정보 설정
		}
		log.info(actList); 								// 배우 리스트 로그 출력
		mv.addObject("actorList", actList); 			// 뷰에서 쓸 수 있게 ModelAndView 객체에 배우 리스트 추가
		return mv; 										// 설정된 ModelAndView 객체 반환 이 데이터로 페이지를 보여줌
	}
	
	@GetMapping 										// 배우 등록 페이지로 가는 메서드
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView(); 			// 페이지 이동 위한 ModelAndView 객체 생성
		mv.setViewName("/actor/register"); 				// 등록 페이지 '/actor/register'로 뷰 설정
		return mv; 										// 설정된 ModelAndView 객체 반환 페이지 이동
	}
	
	
	@PostMapping(value="/register",produces = "application/text; charset=UTF-8") // 배우 등록 처리하는 메서드 데이터 받아서 처리
	public String register(@RequestBody ActorVO atv, Model model, RedirectAttributes rttr) throws Exception{
		
		log.info("register : " + atv); 			// 등록할 배우 정보 로그 출력
		
		log.info(model); 						// 모델 정보 로그 출력
		
		service.insertActor(atv); 				// 서비스 통해 배우 정보 등록
		log.info(atv); 							// 등록된 배우 정보 다시 로그 출력
												// 등록 처리 결과에 따라 응답 데이터 설정
        for(ImgVO img : atv.getImgList()) { 	// 배우의 이미지 정보를 함께 처리
        	img.setBno(atv.getActbno()); 		// 배우 번호 설정
        	img.setTblName("tbl_Actor_img");	// 테이블 이름 설정
        	log.info(img); 						// 이미지 정보 로그 출력
            imgService.insert(img); 			// 이미지 정보 등록
        }
        
        										// 처리 결과를 페이지로 리다이렉트
		return atv.getName(); 					// 처리 결과로 배우 이름 반환
	}
	
	@GetMapping("/modify/{actbno}") 					// 배우 정보 조회해서 수정 페이지로 가는 메서드 '{actbno}'로 특정 배우를 조회
	public ModelAndView getActor(@PathVariable Long actbno, Model model) {
		ModelAndView mv = new ModelAndView(); 			// 페이지 이동 위한 ModelAndView 객체 생성
		mv.setViewName("/actor/modify"); 				// 수정 페이지 '/actor/modify'로 뷰 설정
		log.info("/actor/getActor num : " + actbno); 	// 조회하는 배우 번호 로그 출력
		ActorVO atv = service.getActor(actbno); 		// 서비스에서 배우 번호로 배우 정보 조회
		atv.setImgList(imgService.findByBno("tbl_actor_img", atv.getActbno())); // 조회된 배우의 이미지 정보 설정
		log.info(atv); 									// 조회된 배우 정보 로그 출력
		model.addAttribute("atv", atv); 				// 뷰에서 사용할 수 있게 모델에 배우 정보 추가 
		return mv; 										// 설정된 ModelAndView 객체 반환 이 데이터로 페이지 보여줌
	}
	
	@PostMapping(value="/modify",produces = "application/text; charset=UTF-8") 	// 배우 정보 수정 처리하는 메서드
	public String modify(@RequestBody ActorVO atv ,Model model, RedirectAttributes rttr) {
		log.info("modify : " + atv); 											// 수정할 배우 정보 로그 출력
		service.modify(atv); 													// 서비스 통해 배우 정보 수정
		log.info(atv); 															// 수정된 배우 정보 다시 로그 출력
		ImgVO tmp = new ImgVO(); 												// 임시 이미지 객체 생성
		tmp.setBno(atv.getActbno()); 											// 배우 번호 설정
		tmp.setTblName("tbl_Actor_img"); 										// 테이블 이름 설정
		imgService.delete(tmp); 												// 이미지 정보 삭제
																				// 수정 처리 결과에 따라 응답 데이터 설정
        for(ImgVO img : atv.getImgList()) { 									// 수정된 배우의 이미지 정보도 함께 처리
        	img.setBno(atv.getActbno()); 										// 배우 번호 설정
        	img.setTblName("tbl_Actor_img"); 									// 테이블 이름 설정
        	log.info(img); 														// 이미지 정보 로그 출력
            imgService.insert(img); 											// 이미지 정보 다시 등록
        }
        
        																		// 처리 결과 페이지로 리다이렉트
		return atv.getName(); 													// 처리 결과로 배우 이름 반환
	}
	
	@GetMapping("/delete/{actBno}") 											// 배우 정보 삭제하는 메서드 '{actBno}'로 특정 배우를 삭제
	public ResponseEntity<String> remove(@RequestParam Long actBno){
	    log.info("actBno? : " + actBno); 										// 삭제할 배우 번호 로그 출력
		
	    return service.remove(actBno) == 1 ? 									// 서비스 통해 배우 정보 삭제 성공하면
	    		new ResponseEntity<>("success", HttpStatus.OK) : 				// 'success' 메시지와 OK 상태 코드로 응답
	    		new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);			// 실패하면 내부 서버 오류 상태 코드로 응답
	}
	
}