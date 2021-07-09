package com.team.d.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import com.team.d.command.member.LoginCommand;
import com.team.d.command.member.EmailAuthCommand;
import com.team.d.command.member.EmailCheckCommand;
import com.team.d.command.member.IdCheckCommand;
import com.team.d.command.member.JoinCommand;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
public class TeamConfiguration { 

	/* DBCP 처리하는 dataSource */
	@Bean
	public HikariConfig hikariConfig() {
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName("oracle.jdbc.OracleDriver");
		hikariConfig.setJdbcUrl("jdbc:oracle:thin:@127.0.0.1:1521:xe");
		hikariConfig.setUsername("SERVER_USER");
		hikariConfig.setPassword("1111");
		return hikariConfig;
	}
	/* HiKari(DBCP) */
	@Bean(destroyMethod="close")
	public HikariDataSource hikariDataSource() {
		return new HikariDataSource(hikariConfig());
	}
	/* SqlSessionFactory */
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(hikariDataSource());
		sqlSessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:com/team/d/dao/*.xml"));
		return sqlSessionFactory.getObject();
	}
	/* SqlSession */
	@Bean
	public SqlSessionTemplate sqlSession() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());
	}    
	
	// 회원(Member)
	@Bean
	public LoginCommand loginCommand() { // 로그인
		return new LoginCommand();
	}
	@Bean
	public IdCheckCommand idCheckCommand() { // 아이디 체크
		return new IdCheckCommand();
	}
	@Bean
	public EmailCheckCommand emailCheckCommand() { // 이메일 체크
		return new EmailCheckCommand();
	}
	@Bean
	public EmailAuthCommand emailAuthCommand() { // 이메일 인증
		return new EmailAuthCommand();
	}
	@Bean
	public JoinCommand joinCommand() { // 회원가입
		return new JoinCommand();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
