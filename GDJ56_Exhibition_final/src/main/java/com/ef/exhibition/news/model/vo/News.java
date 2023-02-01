package com.ef.exhibition.news.model.vo;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.ef.exhibition.member.model.vo.Member;
import com.google.inject.internal.Nullable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"files"})
public class News {
	private int newsNo;
//	private Integer newsNo;
	private String newsTitle;
	private int memberNo;
	private Member newsWriter;
	private String newsContent;
	
	private Date newsEnrollDate;
	private List<Attachment> files;
}
