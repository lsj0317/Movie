package com.firstgroup.movies.domain;

import lombok.Data;

@Data
public class ImgVO {
	private String tblName;
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long Bno;
}
