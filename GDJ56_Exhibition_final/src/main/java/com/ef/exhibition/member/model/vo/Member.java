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
		private int memberNo;
		private String memberId;
		private String password;
		private String memberName;
		private char gender;
		private Date birth;
		private String email;
		private String phone;
		private String address;
		private int grade;
		private String profile;

}
