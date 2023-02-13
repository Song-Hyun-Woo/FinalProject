package com.ef.exhibition.question.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Answer {
	private int answerNo;
	private Question questionNo;
	private String answerContent;
	private Date answerDate;
	private int answerRef;
	
}
