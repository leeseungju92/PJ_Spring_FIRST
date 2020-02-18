package com.first.domain;



import java.sql.Date;

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
public class ProductDTO {
	private int nno;
	private String ntitle;
	private String ncontent;
	private String nhref; // 다음에서 가져왔는지 네이버에서 가져왔는지 타사이트에서 가져왔는지 알기위해.
	private Date regdate;	
}
