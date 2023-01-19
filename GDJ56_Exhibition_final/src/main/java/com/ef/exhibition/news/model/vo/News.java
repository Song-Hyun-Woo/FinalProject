package com.ef.exhibition.news.model.vo;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.ef.exhibition.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class News {
	@Id
	private int newsNo;
	private String newsTitle;
//	private String newsWriter;
	private Member newsWriter;
	private String newsContent;
	
	@Temporal(TemporalType.DATE)
	@Column(name="news_enrolldate")
	private Date newsEnrollDate;
	
	private List<Attachment> files;
	
}
