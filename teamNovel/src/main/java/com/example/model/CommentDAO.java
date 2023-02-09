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
public class CommentDAO {
	@Autowired
	private DataSource dataSource;
	
	// write_ok
	public int Comment_Write_Ok( commentTO to ) {	 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "insert into novel_free_comment values (0, ?, now(), '공개', ?, ?, ?)";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getCmt_content() );
			pstmt.setString( 2, to.getUser_email() );
			pstmt.setString( 3, to.getFree_seq() );
			pstmt.setString( 4, to.getUser_nickname() );		
			
			int result = pstmt.executeUpdate();
			if(result == 1) {
				System.out.println("insert 성공");
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

	
	// 전체 댓글 list (공개만)
	public ArrayList<commentTO> Comment_list(String free_seq) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<commentTO> commentlists = new ArrayList<commentTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select cmt_seq, free_seq, cmt_content, date_format(cmt_date,'%y-%m-%d') cmt_date, user_nickname, user_email from novel_free_comment where free_seq = ? and cmt_status = '공개' order by free_seq desc";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1,  free_seq );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				commentTO to = new commentTO();
				to.setCmt_seq( rs.getString( "cmt_seq" ) );
				to.setFree_seq( rs.getString( "free_seq" ) );
				to.setCmt_content( rs.getString( "cmt_content" ) );
				to.setCmt_date( rs.getString( "cmt_date" ) );
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				to.setUser_email( rs.getString( "user_email" ) );
				
				commentlists.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return commentlists;
	}

	
	///댓글 delete_ok
	public int Comment_Delete_Ok( commentTO to ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "update novel_free_comment set cmt_status='차단' where free_seq=? and cmt_seq=?";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getFree_seq() );		
			pstmt.setString( 2, to.getCmt_seq() );		
			
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

	
	// 글의 like 갯수 가져오기
		public int Comment_num(String free_seq) {
			 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int result = 0;
			try {
				conn = dataSource.getConnection();
				
				String sql = "select count(cmt_seq)commentnum from novel_free_comment where free_seq = ? and cmt_status = '공개'";
				
				pstmt = conn.prepareStatement( sql );
				pstmt.setString( 1,  free_seq );
				
				rs = pstmt.executeQuery();
				while( rs.next() ) {
					result = rs.getInt("commentnum");
					//System.out.println("좋아요수 :"+result );
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
}
