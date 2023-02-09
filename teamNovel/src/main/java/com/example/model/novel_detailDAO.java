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
public class novel_detailDAO {
	@Autowired
	private DataSource dataSource;
	
	// write_ok
	public int novel_review_write_ok( novel_detailTO to ) {	 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "insert into novel_review_board values (0, ?, now(), ?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getReview_content() );
			pstmt.setString( 2, to.getReview_ip() );
			pstmt.setString( 3, to.getReview_star_grade() );
			pstmt.setString( 4, to.getUser_email() );
			pstmt.setString( 5, to.getNovel_title() );		
			pstmt.setString( 6, to.getUser_nickname() );		
			
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
	
	// novel_detail view 
	public novel_detailTO novel_detail_view(novel_detailTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select novel_genre, novel_writer, novel_title, novel_content,"
					+ "novel_img, novel_series, novel_kakao, novel_ridi from novel_information where novel_title=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getNovel_title() );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to.setNovel_genre( rs.getString( "novel_genre" ) );
				to.setNovel_writer( rs.getString( "novel_writer" ) );
				to.setNovel_title( rs.getString( "novel_title" ) );
				to.setNovel_content( rs.getString( "novel_content") );
				to.setNovel_img( rs.getString( "novel_img" ));
				to.setNovel_series( rs.getString( "novel_series" ));
				to.setNovel_kakao( rs.getString("novel_kakao"));
				to.setNovel_ridi( rs.getString( "novel_ridi" ));
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

	

}