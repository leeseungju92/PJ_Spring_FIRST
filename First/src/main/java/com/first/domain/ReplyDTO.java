package com.first.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReplyDTO {
		private int rno;
		private String type;
		private int bno;
		private String content;
		private String writer;
		private Date regdate;
	    
}
