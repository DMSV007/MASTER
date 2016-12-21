package com.dmsv.schedule;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Configuration
@EnableScheduling
public class ScheduleJob {
	@Scheduled(cron = "0 48 9 * * ?")
	public void print(){
		System.out.println("---------------> Here i am ");
	}

}
