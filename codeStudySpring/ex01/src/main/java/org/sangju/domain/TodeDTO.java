package org.sangju.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodeDTO {
	
	private String title;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date dueDate;
}
