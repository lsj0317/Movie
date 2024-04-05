package com.firstgroup.movies.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria {

  private int pageNum;
  private int amount;
  
  private String type;//검색용 제목내용글쓴이
  private String keyword;//검색용 %Test%

  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  
  public String[] getTypeArr() {//검색 조건 처리를 위함
    
    return type == null? new String[] {}: type.split("");
  }
  
}
