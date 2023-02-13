package com.ef.exhibition.question.model.vo;

import java.sql.Date;

import javax.persistence.Id;

import com.ef.exhibition.exh.model.vo.Exhibition;
import com.ef.exhibition.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Question {
	@Id
	private int questionNo;
	
	private Member memberId;
	private int questionWriter;
	private String questionTitle;
	private String questrionContent;
	private Date questionDate;
	private String questionState;
	private Exhibition exNo;
	private String questionType;
	
	
	
}
