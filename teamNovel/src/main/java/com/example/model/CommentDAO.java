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
			
			String sql = "insert into novel_free_comment (cmt_seq, cmt_content, cmt_date, cmt_status, user_email, free_seq, user_nickname) "
					+ "value (0, ?, now(), ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getCmt_content() );
			pstmt.setString( 2, to.getCmt_status() );
			pstmt.setString( 3, to.getUser_email() );
			pstmt.setString( 4, to.getFree_seq() );
			pstmt.setString( 5, to.getUser_nickname() );		
			
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

	
	// 전체 댓글 list
	public ArrayList<freeboardTO> FreeBoard_list() {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<freeboardTO> boardlists = new ArrayList<freeboardTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select free_seq, free_category, free_subject, user_nickname, "
					+ "date_format(free_date,'%y-%m-%d') free_date, free_hit, free_like "
					+ "from novel_free_board order by free_seq desc";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				freeboardTO to = new freeboardTO();
				to.setFree_seq( rs.getString( "free_seq" ) );
				to.setFree_category( rs.getString( "free_category" ) );
				to.setFree_subject( rs.getString( "free_subject" ) );
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				to.setFree_date( rs.getString( "free_date" ) );
				to.setFree_hit( rs.getString( "free_hit" ) );
				to.setFree_like( rs.getString( "free_like" ) );
				
				boardlists.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return boardlists;
	}

	
	// 내가 쓴 댓글 delete_ok
	public int FreeBoard_Delete_Ok( freeboardTO to ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "delete from novel_free_board where free_seq=?";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getFree_seq() );		
			
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
