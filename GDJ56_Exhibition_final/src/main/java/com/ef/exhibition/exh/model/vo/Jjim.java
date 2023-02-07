package com.ef.exhibition.exh.model.vo;

import com.ef.exhibition.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Jjim {
//	private String memberId;
	private int member_No;
	private String ex_No;
	private String ex_Title;
}
