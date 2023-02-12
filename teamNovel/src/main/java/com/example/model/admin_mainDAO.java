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
public class admin_mainDAO {
	@Autowired
	private DataSource dataSource;
	
	// 회원리스트 5개 출력
	public ArrayList<userInfoTO> AdminUserLists(){
		ArrayList<userInfoTO> AdminUserLists = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select user_email, user_nickname, user_cdate from novel_user_information limit 5";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				userInfoTO to = new userInfoTO();
				to.setUser_email( rs.getString("user_email") );
				to.setUser_nickname( rs.getString("user_nickname") );
				to.setUser_cdate( rs.getString("user_cdate") );
				
				AdminUserLists.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return AdminUserLists;
	}
	
	// 커뮤니티 게시글 5개 출력
	public ArrayList<freeboardTO> AdminFreeBoardlist() {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<freeboardTO> AdminFreeBoardlist = new ArrayList<freeboardTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select free_seq, free_category, free_subject, user_nickname from novel_free_board order by free_seq desc limit 5";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				freeboardTO to = new freeboardTO();
				to.setFree_seq( rs.getString( "free_seq" ) );
				to.setFree_category( rs.getString( "free_category" ) );
				to.setFree_subject( rs.getString( "free_subject" ) );
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				
				AdminFreeBoardlist.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return AdminFreeBoardlist;
	}
	
	// 리뷰리스트 5개 출력
	public ArrayList<reviewTO> Adminreviewlist() {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<reviewTO> Adminreviewlist = new ArrayList<reviewTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select review_seq, novel_title, review_star_grade, user_nickname from novel_review_board order by review_seq desc limit 5";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				reviewTO to = new reviewTO();
				to.setReview_seq( rs.getString( "review_seq"));
				to.setNovel_title( rs.getString( "novel_title" ));
				to.setReview_star_grade( rs.getString("review_star_grade"));
				to.setUser_nickname( rs.getString("user_nickname"));
				
				Adminreviewlist.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return Adminreviewlist;
	}
	
	// 요청하기 5개 출력
	
	public ArrayList<admin_origin_requestTO> admin_request_list() {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<admin_origin_requestTO> AdminrequestList = new ArrayList<admin_origin_requestTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select request_seq, request_title, request_category, user_email from novel_origin_request order by request_seq desc limit 5";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				admin_origin_requestTO to = new admin_origin_requestTO();
				to.setRequest_seq( rs.getString( "request_seq" ) );
				to.setRequest_title( rs.getString( "request_title" ) );
				to.setRequest_category( rs.getString( "request_category" ) );
				to.setUser_email( rs.getString( "user_email" ));
				
				AdminrequestList.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return AdminrequestList;
	}

	
}
