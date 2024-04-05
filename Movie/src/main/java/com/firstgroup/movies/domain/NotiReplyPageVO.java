package com.firstgroup.movies.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class NotiReplyPageVO {
	
	private int replyCnt;
	private List<NotiReplyVO> list;
}
