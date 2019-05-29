package com.leslie.security.admin.task;

import org.springframework.scheduling.annotation.Scheduled;

/**
 * @author Leslie.Lam
 * @create 2019-03-06 14:58
 **/
//@Component
public class TestSchedule {

    @Scheduled(cron = "0 */1 * * * ?")
    public void dealCouponValidity(){
        System.out.println("hhhhhhhhh");
    }

}
