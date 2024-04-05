package com.firstgroup.movies.common;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.PageVO;
import com.firstgroup.movies.mapper.MemberMapper;
import com.firstgroup.movies.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TestCode {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	//@Test
	public void stringParser() {
		String intList = "{1,2,3,4}";
		List<Integer> list = new ArrayList<Integer>();
		list.add(1);
		list.add(2);
		list.add(3);
		list.add(4);
		log.info(list);
		int[] intValues = list.stream().mapToInt(Integer::intValue).toArray();
		for(int intVal : intValues) {
			log.info(intVal);
		}
		String parsingList = list.toString();
		log.info(parsingList);
		String values = parsingList.substring(1,parsingList.length()-1);
		log.info(values);
		String[] valueList = values.replace(" ","").split(",");
		List<Integer> parsingIntList = new ArrayList<Integer>();
		for(String value : valueList) {
			log.info(value);
			log.info(Integer.parseInt(value));
			parsingIntList.add(Integer.parseInt(value));
		}
	}
	
	public List<Integer> parseToList(String listString){
		List<Integer> parsingIntList = new ArrayList<Integer>();
		String[] valueList = listString.replace(" ","").split(",");
		for(String value : valueList) {
			parsingIntList.add(Integer.parseInt(value));
		}
		return parsingIntList;
	}
	
	public int[] listToIntList(List<Integer> list) {
		return list.stream().mapToInt(Integer::intValue).toArray();
	}
	
	//@Test
	public void test() {
		String id= "manager1";
		log.info(loadUserByUsername(id));
	}
	
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName : " + id);

		// userName means userid
		MemberVO vo = memberMapper.read(id);

		log.warn("queried by member mapper: " + vo);

		return vo == null ? null : new CustomUser(vo);
	}
	
	@Test
	public void pageTest() {
		PageVO page = new PageVO(new Criteria(), 9);
		log.info(page);
	}
}
