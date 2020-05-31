package com.baidu.mapper;

import java.util.List;

import com.baidu.entity.History;


public interface HistoryMapperI {

	void insertHistory(History history);

	List<History> listhistory();

	void updateHistory(History history);

	void deleteHistory(String historyid);
	
	
}
