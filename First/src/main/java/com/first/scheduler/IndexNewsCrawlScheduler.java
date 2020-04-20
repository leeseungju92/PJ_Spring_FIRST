package com.first.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.first.service.index.IndexService;

@Component
public class IndexNewsCrawlScheduler {
	@Autowired
	IndexService iService;
	
	@Scheduled(cron = "30 40 16 * * *")
	public void insertProduct() throws Exception{
		iService.addNews();
			// TODO Auto-generated method stub
		
	}
		
	
}
