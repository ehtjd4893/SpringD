package com.team.d.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import com.team.d.command.board.BoardListCommand;
import com.team.d.command.board.InsertBoardCommand;
import com.team.d.command.board.SearchBoardCommand;
import com.team.d.command.board.SelectInformCommand;
import com.team.d.command.board.ShowBoardCommand;
import com.team.d.command.member.AdminLoginCommand;
import com.team.d.command.member.EmailAuthCommand;
import com.team.d.command.member.EmailCheckCommand;
import com.team.d.command.member.FindIdCommand;
import com.team.d.command.member.FindPwCommand;
import com.team.d.command.member.IdAndEmailCheckCommand;
import com.team.d.command.member.IdCheckCommand;
import com.team.d.command.member.JoinCommand;
import com.team.d.command.member.LeaveCommand;
import com.team.d.command.member.LoginCommand;
import com.team.d.command.member.LogoutCommand;
import com.team.d.command.member.PresentPwCheckCommand;
import com.team.d.command.member.UpdateCommand;
import com.team.d.command.member.UpdatePwCommand;
import com.team.d.command.reservation.CancelRevCommand;
import com.team.d.command.reservation.MyReservationCommand;
import com.team.d.command.reservation.ReceiptCommand;
import com.team.d.command.reservation.ReceiptCommand2;
import com.team.d.command.reservation.RevInfoCommand;
import com.team.d.command.reservation.SelectRemainingRoom;
import com.team.d.command.reservation.SelectRoomCommand;
import com.team.d.command.room.SelectRoomListCommand;
import com.team.d.command.room.SelectRoomViewCommand;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
public class TeamConfiguration { 

	/* 이 아래부터는 커넥션풀과 관련된 bean 생성*/
	@Bean
	public HikariConfig hikariConfig() {
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName("oracle.jdbc.OracleDriver");
		hikariConfig.setJdbcUrl("jdbc:oracle:thin:@127.0.0.1:1521:xe");
		hikariConfig.setUsername("SERVER_USER");
		hikariConfig.setPassword("1111");
		return hikariConfig;
	}
	
	@Bean(destroyMethod="close")
	public HikariDataSource hikariDataSource() {
		return new HikariDataSource(hikariConfig());
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(hikariDataSource());
		sqlSessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:com/team/d/dao/mapper/*.xml"));
		return sqlSessionFactory.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSession() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());
	}    
	
	/* Board 관련 */
	@Bean
	public InsertBoardCommand InsertBoardCommand() {
		return new InsertBoardCommand();
	}
	@Bean
	public BoardListCommand boardListCommand() {
		return new BoardListCommand();
	}
	@Bean
	public SearchBoardCommand searchBoardCommand() {
		return new SearchBoardCommand();		
	}
	@Bean
	public SelectInformCommand selectInformCommand() {
		return new SelectInformCommand();
	}
	@Bean
	public ShowBoardCommand showBoardCommand() {
		return new ShowBoardCommand();
	}
	/* Member 관련*/
	@Bean
	public LoginCommand loginCommand() { // 로그인
		return new LoginCommand();
	}
	@Bean
	public LogoutCommand logoutCommand(){ // 로그아웃
		return new LogoutCommand();
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
	@Bean
	public PresentPwCheckCommand presentPwCheckCommand(){ // 현재 비밀번호 확인
		return new PresentPwCheckCommand();
	}
	@Bean
	public UpdatePwCommand updatePwCommand(){ // 비밀번호 변경
		return new UpdatePwCommand();
	}
	@Bean
	public UpdateCommand updateCommand(){ // 회원정보 변경
		return new UpdateCommand();
	}
	@Bean
	public FindIdCommand findIdCommand(){ // 아이디 찾기
		return new FindIdCommand();
	}
	@Bean
	public IdAndEmailCheckCommand idAndEmailCheckCommand(){ // 아이디&이메일 일치 확인(비밀번호 찾을 때 필요) : 보류 중..
		return new IdAndEmailCheckCommand();
	}
	@Bean
	public FindPwCommand findPwCommand(){ // 비밀번호 찾기
		return new FindPwCommand();
	}
	@Bean
	public LeaveCommand leaveCommand(){ // 회원탈퇴
		return new LeaveCommand();
	}
	
	@Bean
	public AdminLoginCommand adminLoginCommand() {
		return new AdminLoginCommand();
	}

	
	/* reservation 관련 */ 
	@Bean
	public SelectRemainingRoom selectRemainingRoom() {
		return new SelectRemainingRoom();
	}

	@Bean
	public SelectRoomCommand selectRoomCommand() {
		return new SelectRoomCommand();
	}

	@Bean
	public ReceiptCommand receiptCommand() {
		return new ReceiptCommand();
	}
	@Bean
	public RevInfoCommand revInfoCommand() {
		return new RevInfoCommand();
	}
	@Bean
	public ReceiptCommand2 receiptCommand2() {
		return new ReceiptCommand2();
	}
	
	@Bean
	public MyReservationCommand myReservationCommand() {
		return new MyReservationCommand();
	}
	@Bean
	public CancelRevCommand cancelRevCommand() {
		return new CancelRevCommand();
	}
	/* Room 관련*/
	@Bean
	public SelectRoomListCommand selectRoomListCommand() {
		return new SelectRoomListCommand();
	}
	
	@Bean
	public SelectRoomViewCommand selectRoomViewCommand() {
		return new SelectRoomViewCommand();
	}
}
