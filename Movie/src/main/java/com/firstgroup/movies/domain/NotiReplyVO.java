package com.firstgroup.movies.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NotiReplyVO {
	// 우상제 댓글용 클래스
	private Long rno;
	private Long bno;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
}
