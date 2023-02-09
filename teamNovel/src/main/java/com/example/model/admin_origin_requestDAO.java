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
public class admin_origin_requestDAO {
	@Autowired
	private DataSource dataSource;
	
	
	// 전체 요청 list
	public ArrayList<admin_origin_requestTO> origin_request_list() {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<admin_origin_requestTO> requestLists = new ArrayList<admin_origin_requestTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select request_seq, request_title, request_category, user_email, user_nickname from novel_origin_request order by request_seq desc";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				admin_origin_requestTO to = new admin_origin_requestTO();
				to.setRequest_seq( rs.getString( "request_seq" ) );
				to.setRequest_title( rs.getString( "request_title" ) );
				to.setRequest_category( rs.getString( "request_category" ) );
				to.setUser_email( rs.getString( "user_email" ));
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				
				requestLists.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return requestLists;
	}
	

	// delete_ok
	public int origin_request_delete_Ok( admin_origin_requestTO to ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "delete from novel_origin_request where free_seq=?";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getRequest_seq() );		
			
			int result = pstmt.executeUpdate();
			if(result == 1) {
				flag = 0;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return flag;
	}

}
