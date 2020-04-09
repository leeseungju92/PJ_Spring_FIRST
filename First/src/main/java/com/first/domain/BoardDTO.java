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
public class BoardDTO {
		private int bno;
		private String type;
		private String title;
		private String view_content;
		private String search_content;
		private String writer;
		private int viewcnt;
		private int replycnt;
		private int goodcnt;
	    private Date regdate;
	    private Date updatedate;
	    private String show;
	    private int ref;
	    private int re_step;
	    private int re_level;
	    private String name;
}
