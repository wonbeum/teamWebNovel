package com.example.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class user_adminDAO {

	@Autowired
	private DataSource dataSource;
	
	public ArrayList<userInfoTO> userLists(){
		ArrayList<userInfoTO> userLists = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select user_email, user_nickname, user_gender, user_birth, user_cdate, user_grade from novel_user_information";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				userInfoTO to = new userInfoTO();
				to.setUser_email( rs.getString("user_email") );
				to.setUser_nickname( rs.getString("user_nickname") );
				to.setUser_birth( rs.getString("user_birth") );
				to.setUser_gender( rs.getString("user_gender") );
				to.setUser_cdate( rs.getString("user_cdate") );
				
				userLists.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return userLists;
		
	}
	
	public userInfoTO userView(userInfoTO to) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {
			conn = dataSource.getConnection();
			
			String sql = "select user_email, user_nickname, user_gender, user_birth, user_cdate, user_grade from novel_user_information where user_email = ?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getUser_email() );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setUser_email( rs.getString("user_email") );
				to.setUser_nickname( rs.getString("user_nickname") );
				to.setUser_birth( rs.getString("user_birth") );
				to.setUser_gender( rs.getString("user_gender") );
				to.setUser_cdate( rs.getString("user_cdate") );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return to;
	}

	public userInfoTO userModify(userInfoTO to) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {
			conn = dataSource.getConnection();
			
			String sql = "select user_email, user_nickname, user_gender, user_birth, user_cdate, user_grade from novel_user_information where user_email = ?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getUser_email() );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setUser_email( rs.getString("user_email") );
				to.setUser_nickname( rs.getString("user_nickname") );
				to.setUser_birth( rs.getString("user_birth") );
				to.setUser_gender( rs.getString("user_gender") );
				to.setUser_cdate( rs.getString("user_cdate") );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return to;
	}

	public int userModify_ok(userInfoTO to) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 2;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "update novel_user_information set user_nickname = ? ,user_gender = ?, user_birth = ? where user_email= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString( 1, to.getUser_nickname() );
			pstmt.setString( 2, to.getUser_gender() );
			pstmt.setString( 3, to.getUser_birth() );
			pstmt.setString( 4, to.getUser_email() );
			
			if( pstmt.executeUpdate()== 0 ) {
				flag = 1;
			} else if ( pstmt.executeUpdate() == 1 ) {
				flag = 0;
			}
			
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return flag;
	}
}
