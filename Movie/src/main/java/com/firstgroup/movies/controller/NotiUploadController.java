package com.firstgroup.movies.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class NotiUploadController {
	//나중에 rest방식으로 수정    미완성입니다 합치지 않는걸 권장합니다.
	
	@GetMapping("/notice/uploadForm")
	public void uploadForm() {
		
	}
	
	@PostMapping("/notice/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "C:\\upload";
		
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("---------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
	
			try {
				multipartFile.transferTo(saveFile);
			} catch(Exception e) {
				log.error(e.getMessage());
			}//end catch
		
		}//end for
	}
	
	@GetMapping("/notice/uploadAjax")
	public void uploadAjax() {
		//Ajax를 이용한 파일 업로드
		log.info("upload ajax");
		
	}
}
