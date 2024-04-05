package com.firstgroup.movies.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;


@Data
public class MemberVO {
	
	private long membno;
	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String zonecode;
	private String roadAddress;
	private String buildingName;
	private String adress;
	private String phone;
	private Date regdate;
	
	private List<AuthVO> authList;
	
	private List<ImgVO> imgList;

}
