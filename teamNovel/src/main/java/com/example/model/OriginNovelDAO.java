package com.example.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OriginNovelDAO {
	@Autowired
	private DataSource dataSource;
	
	// write_ok
	public int Origin_Request_Ok( admin_origin_requestTO to ) {	 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int flag = 1;
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "insert into novel_origin_request values (0, ?, ?, ?, ?)";
				
				pstmt = conn.prepareStatement( sql );
				pstmt.setString( 1, to.getRequest_title() );
				pstmt.setString( 2, to.getRequest_category() );
				pstmt.setString( 3, to.getUser_email() );
				pstmt.setString( 4, to.getUser_nickname() );		
				
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