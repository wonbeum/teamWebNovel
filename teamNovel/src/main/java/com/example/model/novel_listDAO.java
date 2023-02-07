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
public class novel_listDAO {
	
	@Autowired
	private DataSource dataSource;
	
	public ArrayList<novelInfoTO> kakao_romance(){
		ArrayList<novelInfoTO> lists = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select novel_title, novel_genre, novel_writer, novel_img from novel_information  where novel_kakao != 'null' and novel_genre='romance' ";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				lists.add(to);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return lists;
	}

	public ArrayList<novelInfoTO> kakao_fantasy(){
		ArrayList<novelInfoTO> lists = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select novel_title, novel_genre, novel_writer, novel_img from novel_information  where novel_kakao != 'null' and novel_genre='fantasy' ";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				lists.add(to);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return lists;
	}

	public ArrayList<novelInfoTO> kakao_romancefantasy(){
		ArrayList<novelInfoTO> lists = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select novel_title, novel_genre, novel_writer, novel_img from novel_information  where novel_kakao != 'null' and novel_genre='romancefantasy' ";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				lists.add(to);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return lists;
	}

	public ArrayList<novelInfoTO> naver_romance(){
		ArrayList<novelInfoTO> lists = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select novel_title, novel_genre, novel_writer, novel_img from novel_information  where novel_series != 'null' and novel_genre='romance' ";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				lists.add(to);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return lists;
	}

	public ArrayList<novelInfoTO> naver_fantasy(){
		ArrayList<novelInfoTO> lists = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select novel_title, novel_genre, novel_writer, novel_img from novel_information  where novel_series != 'null' and novel_genre='fantasy' ";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				lists.add(to);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return lists;
	}

	public ArrayList<novelInfoTO> naver_romancefantasy(){
		ArrayList<novelInfoTO> lists = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select novel_title, novel_genre, novel_writer, novel_img from novel_information  where novel_series != 'null' and novel_genre='romancefantasy' ";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				lists.add(to);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return lists;
	}
	
}
