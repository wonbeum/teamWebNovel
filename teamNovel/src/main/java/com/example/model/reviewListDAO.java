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
public class reviewListDAO {
	@Autowired
	private DataSource dataSource;

	// 전체리뷰
	public ArrayList<reviewListTO> reviewall_list() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<reviewListTO> reviewlists = new ArrayList<reviewListTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,"
					+ "b.user_nickname,b.review_content,b.review_date FROM novel_information "
					+ "a left outer join novel_review_board b on a.novel_title = b.novel_title "
					+ "left outer join novel_user_information c on b.user_nickname = c.user_nickname";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				
				reviewlists.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		

	return reviewlists;
	}
	
	public ArrayList<reviewListTO> reviewRomance() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<reviewListTO> reviewromance = new ArrayList<reviewListTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,"
					+ "b.user_nickname,b.review_content,b.review_date FROM novel_information "
					+ "a left outer join novel_review_board b on a.novel_title = b.novel_title "
					+ "left outer join novel_user_information c on b.user_nickname = c.user_nickname where a.novel_genre = 'romance' ";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				
				reviewromance.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		

	return reviewromance;
	}
	
	public ArrayList<reviewListTO> reviewRomanceFantasy() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<reviewListTO> reviewromancefantasy = new ArrayList<reviewListTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,"
					+ "b.user_nickname,b.review_content,b.review_date FROM novel_information "
					+ "a left outer join novel_review_board b on a.novel_title = b.novel_title "
					+ "left outer join novel_user_information c on b.user_nickname = c.user_nickname where a.novel_genre = 'romancefantasy'";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				
				reviewromancefantasy.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		

	return reviewromancefantasy;
	}
	
	public ArrayList<reviewListTO> reviewFantasy() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<reviewListTO> reviewfantasy = new ArrayList<reviewListTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,"
					+ "b.user_nickname,b.review_content,b.review_date FROM novel_information "
					+ "a left outer join novel_review_board b on a.novel_title = b.novel_title "
					+ "left outer join novel_user_information c on b.user_nickname = c.user_nickname where a.novel_genre = 'fantasy'";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				
				reviewfantasy.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		

	return reviewfantasy;
	}
	
	public ArrayList<reviewListTO> reviewSearch() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<reviewListTO> reviewsearch = new ArrayList<reviewListTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,"
					+ "b.user_nickname,b.review_content,b.review_date FROM novel_information "
					+ "a left outer join novel_review_board b on a.novel_title = b.novel_title "
					+ "left outer join novel_user_information c on b.user_nickname = c.user_nickname where a.novel_title = %?%";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				
				reviewsearch.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		

	return reviewsearch;
	}
}