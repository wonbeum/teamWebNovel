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
				//System.out.println("리뷰쓰기 성공");
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
	
	// review 리스트 가져오기
	
	public ArrayList<novel_detailTO> review_list(String novel_title) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<novel_detailTO> reviewlists = new ArrayList<novel_detailTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select novel_title, user_nickname, review_content, date_format(review_date,'%y-%m-%d') review_date, review_star_grade from novel_review_board where novel_title = ? order by review_seq desc";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1,  novel_title );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				novel_detailTO to = new novel_detailTO();
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				to.setReview_date( rs.getString( "review_date" ) );
				to.setReview_content( rs.getString( "review_content" ) );
				to.setReview_star_grade(rs.getString("review_star_grade"));
				
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
	
	public ReviewPagingTO review_listPaging( ReviewPagingTO reviewTO, String novel_title ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int cpage = reviewTO.getCpage();
		int recordPerPage = reviewTO.getRecordPerPage();
		int blockPerPage = reviewTO.getBlockPerPage();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select novel_title, user_nickname, review_content, date_format(review_date,'%y-%m-%d') review_date, review_star_grade from novel_review_board where novel_title = ? order by review_seq desc";
			
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			pstmt.setString( 1, novel_title );
			
			rs = pstmt.executeQuery();

			rs.last();
			reviewTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();

			reviewTO.setTotalPage( ( ( reviewTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<novel_detailTO> lists = new ArrayList<>();
			
			for( int i = 0 ; i< recordPerPage && rs.next() ; i++ ) {
				novel_detailTO to = new novel_detailTO();
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				to.setReview_date( rs.getString( "review_date" ) );
				to.setReview_content( rs.getString( "review_content" ) );
				to.setReview_star_grade(rs.getString("review_star_grade"));
				lists.add(to);
				
			}

			reviewTO.setReviewdetail(lists);
			

			reviewTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			reviewTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( reviewTO.getEndBlock() >= reviewTO.getTotalPage() ) {
				reviewTO.setEndBlock( reviewTO.getTotalPage() );
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return reviewTO;
	}
	

	public ReviewPagingTO review_recent( ReviewPagingTO reviewTO, String novel_title ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int cpage = reviewTO.getCpage();
		int recordPerPage = reviewTO.getRecordPerPage();
		int blockPerPage = reviewTO.getBlockPerPage();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select novel_title, user_nickname, review_content, date_format(review_date,'%y-%m-%d') review_date, review_star_grade from novel_review_board where novel_title = ? order by review_seq desc";
			
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			pstmt.setString( 1, novel_title );
			
			rs = pstmt.executeQuery();

			rs.last();
			reviewTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();

			reviewTO.setTotalPage( ( ( reviewTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<novel_detailTO> lists = new ArrayList<>();
			
			for( int i = 0 ; i< recordPerPage && rs.next() ; i++ ) {
				novel_detailTO to = new novel_detailTO();
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				to.setReview_date( rs.getString( "review_date" ) );
				to.setReview_content( rs.getString( "review_content" ) );
				to.setReview_star_grade(rs.getString("review_star_grade"));
				lists.add(to);
				
			}

			reviewTO.setReviewdetail(lists);
			

			reviewTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			reviewTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( reviewTO.getEndBlock() >= reviewTO.getTotalPage() ) {
				reviewTO.setEndBlock( reviewTO.getTotalPage() );
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return reviewTO;
	}
	public ReviewPagingTO review_star_high( ReviewPagingTO reviewTO, String novel_title ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int cpage = reviewTO.getCpage();
		int recordPerPage = reviewTO.getRecordPerPage();
		int blockPerPage = reviewTO.getBlockPerPage();
		
		try {
			conn = dataSource.getConnection();

			String sql = "select novel_title, user_nickname, review_content, date_format(review_date,'%y-%m-%d') review_date, review_star_grade from novel_review_board where novel_title = ? order by review_star_grade desc";
			
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			pstmt.setString( 1, novel_title );
			
			rs = pstmt.executeQuery();

			rs.last();
			reviewTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();

			reviewTO.setTotalPage( ( ( reviewTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<novel_detailTO> lists = new ArrayList<>();
			
			for( int i = 0 ; i< recordPerPage && rs.next() ; i++ ) {
				novel_detailTO to = new novel_detailTO();
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				to.setReview_date( rs.getString( "review_date" ) );
				to.setReview_content( rs.getString( "review_content" ) );
				to.setReview_star_grade(rs.getString("review_star_grade"));
				lists.add(to);
				
			}

			reviewTO.setReviewdetail(lists);
			

			reviewTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			reviewTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( reviewTO.getEndBlock() >= reviewTO.getTotalPage() ) {
				reviewTO.setEndBlock( reviewTO.getTotalPage() );
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return reviewTO;
	}
	public ReviewPagingTO review_star_low( ReviewPagingTO reviewTO, String novel_title ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int cpage = reviewTO.getCpage();
		int recordPerPage = reviewTO.getRecordPerPage();
		int blockPerPage = reviewTO.getBlockPerPage();
		
		try {
			conn = dataSource.getConnection();

			String sql = "select novel_title, user_nickname, review_content, date_format(review_date,'%y-%m-%d') review_date, review_star_grade from novel_review_board where novel_title = ? order by review_star_grade";
			
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			pstmt.setString( 1, novel_title );
			
			rs = pstmt.executeQuery();

			rs.last();
			reviewTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();

			reviewTO.setTotalPage( ( ( reviewTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<novel_detailTO> lists = new ArrayList<>();
			
			for( int i = 0 ; i< recordPerPage && rs.next() ; i++ ) {
				novel_detailTO to = new novel_detailTO();
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				to.setReview_date( rs.getString( "review_date" ) );
				to.setReview_content( rs.getString( "review_content" ) );
				to.setReview_star_grade(rs.getString("review_star_grade"));
				lists.add(to);
				
			}

			reviewTO.setReviewdetail(lists);
			

			reviewTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			reviewTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( reviewTO.getEndBlock() >= reviewTO.getTotalPage() ) {
				reviewTO.setEndBlock( reviewTO.getTotalPage() );
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return reviewTO;
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
