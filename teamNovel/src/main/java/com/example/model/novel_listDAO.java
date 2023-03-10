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
	
	public NovelPagingTO kakao_romance(NovelPagingTO novelTO) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();

		try {
			conn = dataSource.getConnection();
			
			String sql = "select n.novel_title, novel_genre, novel_writer, novel_img, avg(review_star_grade) avg from novel_information n left join novel_review_board r on n.novel_title = r.novel_title where novel_kakao != 'null' and novel_genre='romance' group by n.novel_title ";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<novelInfoTO> lists = new ArrayList<>();
			
			for( int i=0 ; i < recordPerPage && rs.next() ; i++ ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				to.setNovel_avgstar( rs.getString("avg") );
				lists.add(to);
			}
			
			novelTO.setNovelLists(lists);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[??????] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return novelTO;
	}
	
	
	public NovelPagingTO kakao_fantasy(NovelPagingTO novelTO) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();

		try {
			conn = dataSource.getConnection();

			String sql = "select n.novel_title, novel_genre, novel_writer, novel_img, avg(review_star_grade) avg from novel_information n left join novel_review_board r on n.novel_title = r.novel_title where novel_kakao != 'null' and novel_genre='fantasy' group by n.novel_title ";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<novelInfoTO> lists = new ArrayList<>();
			
			for( int i=0 ; i < recordPerPage && rs.next() ; i++ ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				to.setNovel_avgstar( rs.getString("avg") );
				lists.add(to);
			}
			
			novelTO.setNovelLists(lists);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[??????] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return novelTO;
	}
	

	public NovelPagingTO kakao_romancefantasy(NovelPagingTO novelTO) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();

		try {
			conn = dataSource.getConnection();

			String sql = "select n.novel_title, novel_genre, novel_writer, novel_img, avg(review_star_grade) avg from novel_information n left join novel_review_board r on n.novel_title = r.novel_title where novel_kakao != 'null' and novel_genre='romancefantasy' group by n.novel_title ";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<novelInfoTO> lists = new ArrayList<>();
			
			for( int i=0 ; i < recordPerPage && rs.next() ; i++ ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				to.setNovel_avgstar( rs.getString("avg") );
				lists.add(to);
			}
			
			novelTO.setNovelLists(lists);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[??????] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return novelTO;
	}
	

	public NovelPagingTO naver_romance(NovelPagingTO novelTO) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();

		try {
			conn = dataSource.getConnection();

			String sql = "select n.novel_title, novel_genre, novel_writer, novel_img, avg(review_star_grade) avg from novel_information n left join novel_review_board r on n.novel_title = r.novel_title where novel_series != 'null' and novel_genre='romance' group by n.novel_title ";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<novelInfoTO> lists = new ArrayList<>();
			
			for( int i=0 ; i < recordPerPage && rs.next() ; i++ ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				to.setNovel_avgstar( rs.getString("avg") );
				lists.add(to);
			}
			
			novelTO.setNovelLists(lists);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[??????] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return novelTO;
	}

	public NovelPagingTO naver_fantasy(NovelPagingTO novelTO) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();

		try {
			conn = dataSource.getConnection();

			String sql = "select n.novel_title, novel_genre, novel_writer, novel_img, avg(review_star_grade) avg from novel_information n left join novel_review_board r on n.novel_title = r.novel_title where novel_series != 'null' and novel_genre='fantasy' group by n.novel_title ";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<novelInfoTO> lists = new ArrayList<>();
			
			for( int i=0 ; i < recordPerPage && rs.next() ; i++ ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				to.setNovel_avgstar( rs.getString("avg") );
				lists.add(to);
			}
			
			novelTO.setNovelLists(lists);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[??????] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return novelTO;
	}

	public NovelPagingTO naver_romancefantasy(NovelPagingTO novelTO) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();

		try {
			conn = dataSource.getConnection();

			String sql = "select n.novel_title, novel_genre, novel_writer, novel_img, avg(review_star_grade) avg from novel_information n left join novel_review_board r on n.novel_title = r.novel_title where novel_series != 'null' and novel_genre='romancefantasy' group by n.novel_title ";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<novelInfoTO> lists = new ArrayList<>();
			
			for( int i=0 ; i < recordPerPage && rs.next() ; i++ ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				to.setNovel_avgstar( rs.getString("avg") );
				lists.add(to);
			}
			
			novelTO.setNovelLists(lists);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[??????] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return novelTO;
	}
	
	public NovelPagingTO search_list(NovelPagingTO novelTO , String search) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = novelTO.getCpage();
		int recordPerPage = novelTO.getRecordPerPage();
		int blockPerPage = novelTO.getBlockPerPage();

		try {
			conn = dataSource.getConnection();

			String sql = "select n.novel_title, novel_genre, novel_writer, novel_img, avg(review_star_grade) avg from novel_information n left join novel_review_board r on n.novel_title = r.novel_title where n.novel_title like ? group by n.novel_title";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			pstmt.setString( 1 , "%"+search+"%" );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			novelTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			novelTO.setTotalPage( ( ( novelTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<novelInfoTO> lists = new ArrayList<>();
			
			for( int i=0 ; i < recordPerPage && rs.next() ; i++ ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_title( rs.getString("novel_title") );
				to.setNovel_genre( rs.getString("novel_genre") );
				to.setNovel_writer( rs.getString("novel_writer") );
				to.setNovel_img( rs.getString("novel_img") );
				to.setNovel_avgstar( rs.getString("avg") );
				lists.add(to);
			}
			
			novelTO.setNovelLists(lists);
			
			novelTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			novelTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( novelTO.getEndBlock() >= novelTO.getTotalPage() ) {
				novelTO.setEndBlock( novelTO.getTotalPage() );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[??????] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return novelTO;
	}
}
