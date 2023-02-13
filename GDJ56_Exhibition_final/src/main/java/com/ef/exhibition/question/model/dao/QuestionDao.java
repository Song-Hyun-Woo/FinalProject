package com.ef.exhibition.question.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ef.exhibition.question.model.vo.Question;

public interface QuestionDao {
	
	List<Question> selectQuestionList(SqlSessionTemplate session);
	
	List<Question> selectQuestionListPage(SqlSessionTemplate session,Map param);
		
	int selectQuestionCount(SqlSessionTemplate session);
	
	int insertQuestion(SqlSessionTemplate session,Question q);
	
	Question selectQuestion(SqlSessionTemplate session,int no);

}
