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
public class reviewDAO {
	@Autowired
	private DataSource dataSource;
	
	
	// 전체 요청 list
	public ArrayList<reviewTO> reviewlist() {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<reviewTO> reviewlist = new ArrayList<reviewTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select review_seq, review_content, novel_title, review_date, review_ip, review_star_grade, user_email, user_nickname from novel_review_board order by review_seq desc";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				reviewTO to = new reviewTO();
				to.setReview_seq( rs.getString( "review_seq"));
				to.setReview_content( rs.getString( "review_content" ));
				to.setNovel_title( rs.getString( "novel_title" ));
				to.setReview_date( rs.getString("review_date"));
				to.setReview_ip( rs.getString("review_ip"));
				to.setReview_star_grade( rs.getString("review_star_grade"));
				to.setUser_email( rs.getString("user_email"));
				to.setUser_nickname( rs.getString("user_nickname"));
				
				reviewlist.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return reviewlist;
	}
	
	

}
