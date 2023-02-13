package com.ef.exhibition.question.model.service;

import java.util.List;
import java.util.Map;

import com.ef.exhibition.question.model.vo.Question;

public interface QuestionService {
	
	List<Question> selectQuestionList();
	
	List<Question> selectQuestionListPage(Map param);

	int selectQuestionCount();

	int insertQuestion(Question q);
	
	Question selectQuestion(int no);

}
