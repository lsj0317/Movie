package com.firstgroup.movies.domain;

import lombok.Getter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@Getter
@ToString
@Log4j2
public class PageVO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil((double)cri.getPageNum()/10.0)*10);
		log.info(endPage);
		this.startPage = this.endPage-9;
		
		int realEnd = (int)(Math.ceil((double)total * 1.0)/cri.getAmount());
		log.info(realEnd);
		if(realEnd < this.endPage) {
			if(realEnd == 0) {
				this.endPage = 1;
			} else {
				this.endPage = realEnd;
			}
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
