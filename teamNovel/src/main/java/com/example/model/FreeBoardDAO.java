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
public class FreeBoardDAO {
	@Autowired
	private DataSource dataSource;
	
	// write_ok
	public int FreeBoard_Write_Ok( freeboardTO to ) {	 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "insert into novel_free_board values (0, ?, ?, ?, now(), ?, 0, 0, 0, ?, ?)";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getFree_category() );
			pstmt.setString( 2, to.getFree_subject() );
			pstmt.setString( 3, to.getFree_content() );
			pstmt.setString( 4, to.getFree_ip() );
			pstmt.setString( 5, to.getUser_email() );		
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

	
	// 전체 글 list
	public ArrayList<freeboardTO> FreeBoard_list() {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<freeboardTO> boardlists = new ArrayList<freeboardTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select free_seq, free_category, free_subject, user_nickname, "
					+ "date_format(free_date,'%y-%m-%d') free_date, free_hit, "
					+ "(select count(user_nickname) from novel_free_like where free_seq = f.free_seq) as free_like, "
					+ "(select count(cmt_seq) from novel_free_comment where free_seq= f.free_seq and cmt_status='공개') as free_comment "
					+ "from novel_free_board f order by free_seq desc";
			
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
				to.setFree_comment( rs.getString( "free_comment" ) );
				
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
	
	// 공지 글 
	public ArrayList<freeboardTO> Notice_list() {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<freeboardTO> boardlists = new ArrayList<freeboardTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select free_seq, free_category, free_subject, user_nickname, "
					+ "date_format(free_date,'%y-%m-%d') free_date, free_hit, "
					+ "(select count(user_nickname) from novel_free_like where free_seq = f.free_seq) as free_like, "
					+ "(select count(cmt_seq) from novel_free_comment where free_seq= f.free_seq and cmt_status='공개') as free_comment "
					+ "from novel_free_board f where free_category='공지' order by free_seq desc";
			
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
				to.setFree_comment( rs.getString( "free_comment" ) );
				
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
		//System.out.println(boardlists);
		return boardlists;
	}
	
	// 서치 list
	public ArrayList<freeboardTO> Search_list( String menu, String content ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<freeboardTO> boardlists = new ArrayList<freeboardTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select free_seq, free_category, free_subject, user_nickname, free_date, "
					+ "free_hit, free_like from novel_free_board where ? like ? order by free_seq desc";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, menu  );
			pstmt.setString( 2, content+"%"  );
		
			
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
		//System.out.println(boardlists);
		return boardlists;
	}

	// 인기 글
	public ArrayList<freeboardTO> Best_list() {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<freeboardTO> boardlists = new ArrayList<freeboardTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select free_seq, free_category, free_subject, user_nickname, "
					+ "date_format(free_date,'%y-%m-%d') free_date, free_hit, "
					+ "(select count(user_nickname) from novel_free_like where free_seq = f.free_seq) as free_like, "
					+ "(select count(cmt_seq) from novel_free_comment where free_seq= f.free_seq and cmt_status='공개') as free_comment "
					+ "from novel_free_board f where free_like>=10 order by free_seq desc";
			
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
				to.setFree_like( rs.getString( "free_comment" ) );
				
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
	
	// view 
	public freeboardTO FreeBoard_View(freeboardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "update novel_free_board set free_hit=free_hit+1 where free_seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getFree_seq() );

			pstmt.executeUpdate();
			
			pstmt.close();
			
			sql = "select free_category, free_content, date_format(free_date,'%y-%m-%d') free_date,"
					+ "free_hit, free_like, free_subject, free_ip, user_email, user_nickname from novel_free_board where free_seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getFree_seq() );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to.setFree_category( rs.getString( "free_category" ) );
				to.setFree_content( rs.getString( "free_content" ) );
				to.setFree_date( rs.getString( "free_date" ) );
				to.setFree_hit( rs.getString( "free_hit" ) );
				to.setFree_like( rs.getString( "free_like" ) );
				to.setFree_subject( rs.getString( "free_subject" ) );
				to.setFree_ip( rs.getString( "free_ip" ) );
				to.setUser_email( rs.getString( "user_email" ));
				to.setUser_nickname( rs.getString("user_nickname"));
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

	// modify
	public freeboardTO FreeBoard_Modify(freeboardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select free_category, free_content, date_format(free_date,'%y-%m-%d') free_date,"
					+ "free_hit, free_like, free_subject, user_nickname from novel_free_board where free_seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getFree_seq() );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to.setFree_category( rs.getString( "free_category" ) );
				to.setFree_content( rs.getString( "free_content" ) );
				to.setFree_date( rs.getString( "free_date" ) );
				to.setFree_hit( rs.getString( "free_hit" ) );
				to.setFree_like( rs.getString( "free_like" ) );
				to.setFree_subject( rs.getString( "free_subject" ) );
				to.setUser_nickname( rs.getString("user_nickname"));
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
	
	// modify_ok
	public int FreeBoard_Modify_Ok( freeboardTO to ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "update novel_free_board set free_category=?, free_subject=?, free_content=? where free_seq=?";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getFree_category() );
			pstmt.setString( 2, to.getFree_subject() );
			pstmt.setString( 3, to.getFree_content() );
			pstmt.setString( 4, to.getFree_seq() );		
			
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
	
	// delete_ok
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
