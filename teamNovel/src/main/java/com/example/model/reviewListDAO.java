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
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,a.novel_content,"
					+ "b.user_nickname,b.review_content,b.review_date,avg( b.review_star_grade ) as average FROM novel_information "
					+ "a left outer join novel_review_board b on a.novel_title = b.novel_title "
					+ "left outer join novel_user_information c on b.user_nickname = c.user_nickname group by a.novel_title";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setNovel_content(rs.getString("novel_content"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				to.setReview_star_grade(rs.getString("average"));
				
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
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,a.novel_content,"
					+ "b.user_nickname,b.review_content,b.review_date,avg( b.review_star_grade ) as average FROM novel_information "
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
				to.setNovel_content(rs.getString("novel_content"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				to.setReview_star_grade(rs.getString("average"));
				
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
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,a.novel_content,"
					+ "b.user_nickname,b.review_content,b.review_date,avg( b.review_star_grade ) as average FROM novel_information "
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
				to.setNovel_content(rs.getString("novel_content"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				to.setReview_date(rs.getString("average"));
				
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
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,a.novel_content,"
					+ "b.user_nickname,b.review_content,b.review_date,avg( b.review_star_grade ) as average FROM novel_information "
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
				to.setNovel_content(rs.getString("novel_content"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				to.setReview_star_grade(rs.getString("average"));
				
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
	
	public ArrayList<reviewListTO> reviewSearch(String novel_title) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<reviewListTO> reviewsearch = new ArrayList<reviewListTO>();

		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,a.novel_content,"
					+ "b.user_nickname,b.review_content,b.review_date,avg( b.review_star_grade ) as average FROM novel_information "
					+ "a left outer join novel_review_board b on a.novel_title = b.novel_title "
					+ "left outer join novel_user_information c on b.user_nickname = c.user_nickname where a.novel_title like ?";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, "%"+novel_title+"%"  );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setNovel_content(rs.getString("novel_content"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				to.setReview_star_grade(rs.getString("average"));
				
				reviewsearch.add( to );
				
				//System.out.println(to.getNovel_title());
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
	
public NovelPagingTO Paging_reviewall_list(NovelPagingTO novelTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();
		
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,a.novel_content,"
					+ "b.user_nickname,b.review_content,b.review_date,avg( b.review_star_grade ) as average FROM novel_information "
					+ "a left join novel_review_board b on a.novel_title = b.novel_title group by a.novel_title";
			
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<reviewListTO> reviewall = new ArrayList<>();
			
			for( int i=0 ; i< recordPerPage && rs.next(); i++) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setNovel_content(rs.getString("novel_content"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				to.setReview_star_grade(rs.getString("average"));
				
				reviewall.add( to );
			}
			
			novelTO.setReviewList(reviewall);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		

	return novelTO;
	}
	
	public NovelPagingTO Paging_reviewRomance(NovelPagingTO novelTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();
		
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,a.novel_content,"
					+ "b.user_nickname,b.review_content,b.review_date,avg( b.review_star_grade ) as average FROM novel_information "
					+ "a left join novel_review_board b on a.novel_title = b.novel_title where a.novel_genre = 'romance' group by a.novel_title ";
			
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<reviewListTO> reviewRomance = new ArrayList<reviewListTO>();
			
			for( int i=0 ; i< recordPerPage && rs.next(); i++) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setNovel_content(rs.getString("novel_content"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				to.setReview_star_grade(rs.getString("average"));
				
				reviewRomance.add( to );
			}
			
			novelTO.setReviewList(reviewRomance);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		

	return novelTO;
	}
	
	public NovelPagingTO Paging_reviewromancefantasy(NovelPagingTO novelTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();
		
		ArrayList<reviewListTO> reviewromancefantasy = new ArrayList<reviewListTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,a.novel_content,"
					+ "b.user_nickname,b.review_content,b.review_date,avg( b.review_star_grade ) as average FROM novel_information "
					+ "a left join novel_review_board b on a.novel_title = b.novel_title where a.novel_genre = 'romancefantasy' group by a.novel_title ";
					
			
pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<reviewListTO> reviewromanceFantasy = new ArrayList<reviewListTO>();
			
			for( int i=0 ; i< recordPerPage && rs.next(); i++) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setNovel_content(rs.getString("novel_content"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				to.setReview_star_grade(rs.getString("average"));
				
				reviewromanceFantasy.add( to );
			}
novelTO.setReviewList(reviewromanceFantasy);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		

		return novelTO;
	}
	
	public NovelPagingTO Paging_reviewFantasy(NovelPagingTO novelTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();
		
		
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,a.novel_content,"
					+ "b.user_nickname,b.review_content,b.review_date,avg( b.review_star_grade ) as average FROM novel_information "
					+ "a left join novel_review_board b on a.novel_title = b.novel_title where a.novel_genre = 'fantasy' group by a.novel_title";

			
pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<reviewListTO> reviewfantasy = new ArrayList<reviewListTO>();
			
			for( int i=0 ; i< recordPerPage && rs.next(); i++) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setNovel_content(rs.getString("novel_content"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				to.setReview_star_grade(rs.getString("average"));
				
				reviewfantasy.add( to );
			}
novelTO.setReviewList(reviewfantasy);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		

	return novelTO;
	}
	
	public NovelPagingTO Paging_reviewSearch(String novel_title, NovelPagingTO novelTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();
		
		

		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT a.novel_genre,a.novel_title,a.novel_writer,a.novel_img,a.novel_content,"
					+ "b.user_nickname,b.review_content,b.review_date,avg( b.review_star_grade ) as average FROM novel_information "
					+ "a left join novel_review_board b on a.novel_title = b.novel_title where a.novel_title like ? group by a.novel_title";

			
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, "%"+novel_title+"%"  );
			
rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<reviewListTO> reviewsearch = new ArrayList<reviewListTO>();
			
			for( int i=0 ; i< recordPerPage && rs.next(); i++) {
				reviewListTO to = new reviewListTO();
				to.setNovel_genre(rs.getString("novel_genre"));
				to.setNovel_title(rs.getString("novel_title"));
				to.setNovel_writer(rs.getString("novel_writer"));
				to.setNovel_img(rs.getString("novel_img"));
				to.setNovel_content(rs.getString("novel_content"));
				to.setUser_nickname(rs.getString("user_nickname"));
				to.setReview_content(rs.getString("review_content"));
				to.setReview_date(rs.getString("review_date"));
				to.setReview_star_grade(rs.getString("average"));
				
				reviewsearch.add( to );
				
				//System.out.println(to.getNovel_title());
			}
			
novelTO.setReviewList(reviewsearch);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		

	return novelTO;
	}

}