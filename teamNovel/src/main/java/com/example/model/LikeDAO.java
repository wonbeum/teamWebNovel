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
public class LikeDAO {
	@Autowired
	private DataSource dataSource;
	
	
	// 회원이 like 눌렀는지 확인
	public int LikeFind(String free_seq, String user_nickname) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		int result = 2;
		try {
			conn = dataSource.getConnection();
			
			String sql = "select count(user_nickname)likenum from novel_free_like where free_seq = ? and user_nickname = ?";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1,  free_seq );
			pstmt.setString( 2,  user_nickname );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				result = rs.getInt("likenum");
				//System.out.println("like 갯수 확인 :"+result);
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

	// 글의 like 갯수 가져오기
	public int Like_num(String free_seq) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		try {
			conn = dataSource.getConnection();
			
			String sql = "select count(user_nickname)likenum from novel_free_like where free_seq = ?";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1,  free_seq );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				result = rs.getInt("likenum");
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
	
	// like 입력하기
	public int Insert_Like_Ok( LikeTO to ) {	 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		String free_like=null;
		try {
			conn = dataSource.getConnection();
			
			String sql = "insert into novel_free_like values (0, ?, ?, ?)";

			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getFree_seq() );
			pstmt.setString( 2, to.getUser_email() );
			pstmt.setString( 3, to.getUser_nickname() );

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

	
	// like 삭제하기
	public int Delete_Like_Ok( LikeTO to ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "delete from novel_free_like where free_seq=? and user_nickname=?";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getFree_seq() );		
			pstmt.setString( 2, to.getUser_nickname() );		
			
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
