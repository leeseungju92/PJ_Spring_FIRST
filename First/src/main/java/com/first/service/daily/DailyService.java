package com.first.service.daily;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.domain.DailyDTO;
import com.first.persistence.DailyDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DailyService {
	@Autowired
	SqlSession sqlsession;
	
	DailyDAO dDao;
	@Autowired
	public void newDao() {
		dDao = sqlsession.getMapper(DailyDAO.class);
	}
	
	public void dc(DailyDTO dDto) {
		// TODO Auto-generated method stub
		dDao.dc(dDto);
	}

	public void dd() {
		// TODO Auto-generated method stub
		dDao.dd();
	}

	public void du() {
		// TODO Auto-generated method stub
		dDao.du();
	}

	public void dr() {
		// TODO Auto-generated method stub
		dDao.dr();
	}
	
}
