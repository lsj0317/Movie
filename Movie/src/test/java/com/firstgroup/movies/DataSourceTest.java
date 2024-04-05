package com.firstgroup.movies;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.PseudoColumnUsage;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaxxer.hikari.HikariDataSource;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
	  })
public class DataSourceTest {

	private HikariDataSource dataSource;
	
	@Test
	public void testConnection() {
		try(
			Connection con = dataSource.getConnection();	
		){
			
		System.out.println("con="+con);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	

	
	  
	  @Test
	  public void testInsertMember() {
	   
	  }
}