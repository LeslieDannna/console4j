package com.leslie.security.admin;

import com.leslie.security.admin.mapper.SysUserInsertMapper;
import com.leslie.security.admin.model.SysUserInsert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.concurrent.*;
import java.util.stream.Collectors;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AdminApplicationTests {

	@Autowired
	private SysUserInsertMapper insertMapper;

	ExecutorService executor = Executors.newFixedThreadPool(5);

	@Test
	public void simpleInsert(){
		Date date = new Date();
		List<SysUserInsert> list = new ArrayList<>();
		list.add(getUser(date,2));
		list.add(getUser(date,3));
		insertMapper.insertList(list);
		insertMapper.insert(getUser(date,4));
	}

	@Test
	public void testInsert() throws InterruptedException, ExecutionException {
		Date date = new Date();
		List<SysUserInsert> list = new ArrayList<>();
		for (int i = 0; i < 100000; i++) {
			list.add(getUser(date,i));
		}
		System.out.println(Thread.currentThread().getName()+"插入开始=======");
		List<Future<Long>> futures = new ArrayList<>();
		for (int i = 0; i < list.size(); i+=20000){
			List<SysUserInsert> collect = list.stream().skip(i).limit(20000).collect(Collectors.toList());
			Future<Long> submit = executor.submit(() -> {
				long l = System.currentTimeMillis();
				System.out.println(Thread.currentThread().getName() + "插入开始=======");
				for (int j = 0; j < collect.size(); j += 2000) {
					insertMapper.insertList(collect.stream().skip(j).limit(2000).collect(Collectors.toList()));
				}
				System.out.println(Thread.currentThread().getName() + String.format("消耗%d毫秒", System.currentTimeMillis() - l));
				return System.currentTimeMillis() - l;
			});
			futures.add(submit);
		}
		List<Long> totals = new ArrayList<>();
		for (int i = 0; i < futures.size(); i++) {
			totals.add(futures.get(i).get());
		}
		System.out.println(Thread.currentThread().getName()+"插入结束，"+String.format("最多消耗%d毫秒", totals.stream().max(Comparator.comparingLong(o -> o)).get()));
		TimeUnit.SECONDS.sleep(120);
	}

	private SysUserInsert getUser(Date date, int i){
		SysUserInsert insert = new SysUserInsert();
		insert.setUserName("leslie"+i);
		insert.setEnabled((byte)1);
		insert.setPassword("$08$UIbl948v1vaFLzwr3Hea7uJECTdYsEA8gkxWxNgBLBVXbIG1ODyLO");
		insert.setName("李拉拉");
		insert.setEmail("sadsadsadsa");
		insert.setPhone("15811705092");
		insert.setMobile("15811705092");
		insert.setRemarks("suiahgdijsahdiuwqbedgsvsh");
		insert.setCreateTime(date);
		insert.setOpTime(date);
		insert.setIsDel((byte)0);
		return insert;
	}

}
