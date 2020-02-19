package com.first.domain;

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
public class SampleDTO {
	private String user;
	private String pass;
	private String name;
	private String email;
	private String phone;
}
