package org.sangju.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private Date updateDate;
}
