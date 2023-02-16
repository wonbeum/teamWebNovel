package com.example.model;

import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

@Repository
public class loginDAO {
	
	@Autowired
	private DataSource dataSource;

	@Autowired
	private JavaMailSender javamailsender;
	
	public userInfoTO login( userInfoTO to ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select user_email, user_nickname, user_gender, user_birth, user_grade from novel_user_information "
					+ "where user_email = ? and user_password = ?";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getUser_email() );
			pstmt.setString( 2, to.getUser_password() );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setUser_email( rs.getString( "user_email" ) );
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				to.setUser_birth( rs.getString( "user_birth" ) );
				to.setUser_gender( rs.getString( "user_gender" ) );
				to.setUser_grade( rs.getString("user_grade") );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return to;
		
	}
	
	public userInfoTO adminlogin( userInfoTO to ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select user_email, user_nickname, user_gender, user_birth, user_grade from novel_user_information "
					+ "where user_email = ? and user_password = ? and user_grade = 'master' ";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getUser_email() );
			pstmt.setString( 2, to.getUser_password() );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setUser_email( rs.getString( "user_email" ) );
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				to.setUser_birth( rs.getString( "user_birth" ) );
				to.setUser_gender( rs.getString( "user_gender" ) );
				to.setUser_grade( rs.getString("user_grade") );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return to;
		
	}
	
	public int user_reset_password( userInfoTO to ) {
		
		int flag = 2;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select user_email from novel_user_information where user_email = ? and user_birth = ? ";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getUser_email() );
			pstmt.setString( 2, to.getUser_birth() );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setUser_email( rs.getString( "user_email" ) );
			}
			
			String reset_password = getRamdomPassword();
			
			sql = "update novel_user_information set user_password = ? where user_email= ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString( 1, reset_password );
			pstmt.setString( 2, to.getUser_email() );

			if( pstmt.executeUpdate()== 0 ) {
				flag = 1;
			} else if ( pstmt.executeUpdate() == 1 ) {
				flag = 0;
			}
			
			String toEmail = to.getUser_email();;
			String toName="gathervel";
			String subject="gathervel 비밀번호 재설정 메일입니다.";
			String content="gathervel 비밀번호 재설정 메일입니다 <br/> 비밀번호는 ( " + reset_password + " ) 입니다.";

			MimeMessage mimeMessage = javamailsender.createMimeMessage();

			mimeMessage.addRecipient( RecipientType.TO, new InternetAddress( toEmail, toName, "utf-8" ) );
			mimeMessage.setSubject(subject, "utf-8");
			mimeMessage.setText(content,"utf-8","html");
			
			mimeMessage.setSentDate( new java.util.Date() );
			
			javamailsender.send( mimeMessage );
			
			//System.out.println( "전송이 완료되었습니다." );

			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
	
		return flag;
	}
	
	public String getRamdomPassword() {
		 char[] charSet = new char[] {
	                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	                '!', '@', '#', '$', '%', '^', '&' };

	        StringBuffer sb = new StringBuffer();
	        SecureRandom sr = new SecureRandom();
	        sr.setSeed(new Date().getTime());

	        int idx = 0;
	        int len = charSet.length;
	        for (int i=0; i < 10; i++) {
	            idx = sr.nextInt(len);    // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
	            sb.append(charSet[idx]);
	        }

	        return sb.toString();
		
	}
	
	public int kakaoCheck( userInfoTO to ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 2;
		try {
			conn = dataSource.getConnection();
			
			String sql = "select count(user_email) from novel_user_information "
					+ "where user_email = ? ";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getUser_email() );
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				result = rs.getInt("count(user_email)");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return result;
		
	}
	
	public userInfoTO kakaologin( userInfoTO to ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select user_email, user_nickname, user_gender, user_birth, user_grade from novel_user_information "
					+ "where user_email = ? ";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getUser_email() );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setUser_email( rs.getString( "user_email" ) );
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				to.setUser_birth( rs.getString( "user_birth" ) );
				to.setUser_gender( rs.getString( "user_gender" ) );
				to.setUser_grade( rs.getString("user_grade") );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return to;
		
	}
}
