package com.ef.exhibition.exh.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Review {
	private int review_no;
	private String ex_no;
	private String writer;
	private String review_content;
	private Date review_date;
}
