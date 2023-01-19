package com.ef.exhibition.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Member {
		private int member_no;
		private String member_id;
		private String password;
		private String member_name;
		private char gender;
		private Date birth;
		private String email;
		private String phone;
		private String address;
		private int member_grade;
		private String profile;

}
