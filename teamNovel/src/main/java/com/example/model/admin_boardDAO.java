package com.example.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Repository
public class admin_boardDAO {
	@Autowired
	private DataSource dataSource;
	
	// 전체 게시물 List + paging
	public  FreeBoardPagingTO adminboardLists(FreeBoardPagingTO pagingTO) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = pagingTO.getCpage();
		int recordPerPage = pagingTO.getRecordPerPage();
		int blockPerPage = pagingTO.getBlockPerPage();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select free_seq, free_category, free_subject, user_nickname, date_format(free_date,'%y-%m-%d') free_date, free_hit, (select count(user_nickname) from novel_free_like where free_seq = f.free_seq) as free_like, (select count(cmt_seq) from novel_free_comment where free_seq= f.free_seq and cmt_status='공개') as free_comment from novel_free_board f order by free_seq desc;";
			
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY  );

			
			rs = pstmt.executeQuery();
			
			// 전체 데이터 설정하기 위함
			rs.last();
			pagingTO.setTotalRecord(rs.getRow());
			
			// 다시 처음으로 와서 데이터 설정
			rs.beforeFirst();
			
			// 전체 페이지수 설정 = ( (전체데이터 -1) / 한페이지당 데이터수 ) +1
			pagingTO.setTotalPage(( ( pagingTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			// 레코드 시작번호 skip 설정
			int skip = (cpage -1) * recordPerPage;
			if (skip != 0) rs.absolute(skip);
			
			ArrayList<freeboardTO> boardlists = new ArrayList<freeboardTO>();
			
			for( int i=0; i< recordPerPage && rs.next() ; i++ ) {
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
				
				pagingTO.setBoardLists(boardlists);
				
				pagingTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
				pagingTO.setEndBlock(( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage);
				if( pagingTO.getEndBlock() >= pagingTO.getTotalPage() ) {
					pagingTO.setEndBlock( pagingTO.getTotalPage() );
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println( "[에러] " + e.getMessage() );
			} finally {
				if( rs != null) try { rs.close(); } catch( SQLException e ) {}
				if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
				if( conn != null) try { conn.close(); } catch( SQLException e ) {}
			}	
			
			return pagingTO;
		}
	
	
	// 제목 검색 List + paging
	public  FreeBoardPagingTO boardSearch_title(FreeBoardPagingTO pagingTO, String category, String keyword) {
			 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int cpage = pagingTO.getCpage();
			int recordPerPage = pagingTO.getRecordPerPage();
			int blockPerPage = pagingTO.getBlockPerPage();
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "select free_seq, free_category, free_subject, user_nickname, date_format(free_date,'%y-%m-%d') free_date, free_hit, (select count(user_nickname) from novel_free_like where free_seq = f.free_seq) as free_like, (select count(cmt_seq) from novel_free_comment where free_seq= f.free_seq and cmt_status='공개') as free_comment from novel_free_board f where free_category=? and free_subject like ? order by free_seq desc;";
				
				pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY  );
				pstmt.setString( 1, category );
				pstmt.setString( 2, '%'+keyword+'%' );
				
				rs = pstmt.executeQuery();
				
				// 전체 데이터 설정하기 위함
				rs.last();
				pagingTO.setTotalRecord(rs.getRow());
				
				// 다시 처음으로 와서 데이터 설정
				rs.beforeFirst();
				
				// 전체 페이지수 설정 = ( (전체데이터 -1) / 한페이지당 데이터수 ) +1
				pagingTO.setTotalPage(( ( pagingTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
				
				// 레코드 시작번호 skip 설정
				int skip = (cpage -1) * recordPerPage;
				if (skip != 0) rs.absolute(skip);
				
				ArrayList<freeboardTO> boardlists = new ArrayList<freeboardTO>();
				
				for( int i=0; i< recordPerPage && rs.next() ; i++ ) {
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
					
					pagingTO.setBoardLists(boardlists);
					
					pagingTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
					pagingTO.setEndBlock(( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage);
					if( pagingTO.getEndBlock() >= pagingTO.getTotalPage() ) {
						pagingTO.setEndBlock( pagingTO.getTotalPage() );
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					System.out.println( "[에러] " + e.getMessage() );
				} finally {
					if( rs != null) try { rs.close(); } catch( SQLException e ) {}
					if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
					if( conn != null) try { conn.close(); } catch( SQLException e ) {}
				}	
				
				return pagingTO;
			}

	
	// 제목+내용 검색 List + paging
	public FreeBoardPagingTO boardSearch_content(FreeBoardPagingTO pagingTO, String category, String keyword ) {
			 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = pagingTO.getCpage();
		int recordPerPage = pagingTO.getRecordPerPage();
		int blockPerPage = pagingTO.getBlockPerPage();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select free_seq, free_category, free_content, free_subject, user_nickname, date_format(free_date,'%y-%m-%d') free_date, free_hit, (select count(user_nickname) from novel_free_like where free_seq = f.free_seq) as free_like,"
					+ "(select count(cmt_seq) from novel_free_comment where free_seq= f.free_seq and cmt_status='공개') as free_comment from novel_free_board f where free_category=? and (free_subject like ? or free_content like ?) order by free_seq desc";
			
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY  );
			pstmt.setString( 1, category );
			pstmt.setString( 2, '%'+keyword+'%' );
			pstmt.setString( 3, '%'+keyword+'%' );
			
			rs = pstmt.executeQuery();
			
			// 전체 데이터 설정하기 위함
			rs.last();
			pagingTO.setTotalRecord(rs.getRow());
			
			// 다시 처음으로 와서 데이터 설정
			rs.beforeFirst();
			
			// 전체 페이지수 설정 = ( (전체데이터 -1) / 한페이지당 데이터수 ) +1
			pagingTO.setTotalPage(( ( pagingTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			// 레코드 시작번호 skip 설정
			int skip = (cpage -1) * recordPerPage;
			if (skip != 0) rs.absolute(skip);
			
			ArrayList<freeboardTO> boardlists = new ArrayList<freeboardTO>();
			
			for( int i=0; i< recordPerPage && rs.next() ; i++ ) {
					freeboardTO to = new freeboardTO();
					to.setFree_seq( rs.getString( "free_seq" ) );
					to.setFree_category( rs.getString( "free_category" ) );
					to.setFree_subject( rs.getString( "free_subject" ) );
					to.setUser_nickname( rs.getString( "user_nickname" ) );
					to.setFree_date( rs.getString( "free_date" ) );
					to.setFree_hit( rs.getString( "free_hit" ) );
					to.setFree_like( rs.getString( "free_like" ) );
					to.setFree_comment( rs.getString( "free_content" ) );
					to.setFree_comment( rs.getString( "free_comment" ) );
					
					boardlists.add( to );
				}
				
				pagingTO.setBoardLists(boardlists);
				
				pagingTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
				pagingTO.setEndBlock(( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage);
				if( pagingTO.getEndBlock() >= pagingTO.getTotalPage() ) {
					pagingTO.setEndBlock( pagingTO.getTotalPage() );
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println( "[에러] " + e.getMessage() );
			} finally {
				if( rs != null) try { rs.close(); } catch( SQLException e ) {}
				if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
				if( conn != null) try { conn.close(); } catch( SQLException e ) {}
			}	
			
			return pagingTO;
		}
}
