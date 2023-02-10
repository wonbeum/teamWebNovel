package com.example.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class loginDAO {
	
	@Autowired
	private DataSource dataSource;
	
	public userInfoTO login( userInfoTO to ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select user_email, user_nickname, user_gender, user_birth from novel_user_information "
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
			
			String sql = "select user_email, user_nickname, user_gender, user_birth from novel_user_information "
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
