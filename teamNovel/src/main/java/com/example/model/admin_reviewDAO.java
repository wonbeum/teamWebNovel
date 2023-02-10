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
public class admin_reviewDAO {
	@Autowired
	private DataSource dataSource;
	
	
	// 전체 요청 list
	public ArrayList<reviewTO> reviewlist() {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<reviewTO> reviewlist = new ArrayList<reviewTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select review_seq, review_content, novel_title, review_date, review_ip, review_star_grade, user_email, user_nickname from novel_review_board order by review_seq desc";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				reviewTO to = new reviewTO();
				to.setReview_seq( rs.getString( "review_seq"));
				to.setReview_content( rs.getString( "review_content" ));
				to.setNovel_title( rs.getString( "novel_title" ));
				to.setReview_date( rs.getString("review_date"));
				to.setReview_ip( rs.getString("review_ip"));
				to.setReview_star_grade( rs.getString("review_star_grade"));
				to.setUser_email( rs.getString("user_email"));
				to.setUser_nickname( rs.getString("user_nickname"));
				
				reviewlist.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return reviewlist;
	}
	
	// 전체 리뷰 List + paging
	public FreeBoardPagingTO Review_List(FreeBoardPagingTO pagingTO) {
			 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int cpage = pagingTO.getCpage();
			int recordPerPage = pagingTO.getRecordPerPage();
			int blockPerPage = pagingTO.getBlockPerPage();
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "select review_seq, review_content, novel_title, date_format(review_date,'%y-%m-%d') review_date, review_ip, review_star_grade, user_email, user_nickname from novel_review_board order by review_seq desc";
				
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
				
				ArrayList<reviewTO> reviewlists = new ArrayList<reviewTO>();
				
				while( rs.next() ) {
					reviewTO to = new reviewTO();
					to.setReview_seq( rs.getString( "review_seq"));
					to.setReview_content( rs.getString( "review_content" ));
					to.setNovel_title( rs.getString( "novel_title" ));
					to.setReview_date( rs.getString("review_date"));
					to.setReview_ip( rs.getString("review_ip"));
					to.setReview_star_grade( rs.getString("review_star_grade"));
					to.setUser_email( rs.getString("user_email"));
					to.setUser_nickname( rs.getString("user_nickname"));
					
					reviewlists.add( to );
				}
				
				pagingTO.setReviewLists(reviewlists);
				
				// 페이지(블럭) 설정
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
		
	// 작품명 검색 List + paging
	public FreeBoardPagingTO ReviewSearch_TitleList(FreeBoardPagingTO pagingTO, String keyword) {
			 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int cpage = pagingTO.getCpage();
			int recordPerPage = pagingTO.getRecordPerPage();
			int blockPerPage = pagingTO.getBlockPerPage();
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "select review_seq, review_content, novel_title, date_format(review_date,'%y-%m-%d') review_date, review_ip, review_star_grade, user_email, user_nickname "
						+ "from novel_review_board where novel_title like ? order by review_seq desc";
				
				pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY  );
				pstmt.setString( 1, '%'+keyword+'%' );
				
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
				
				ArrayList<reviewTO> reviewlists = new ArrayList<reviewTO>();
				
				while( rs.next() ) {
					reviewTO to = new reviewTO();
					to.setReview_seq( rs.getString( "review_seq"));
					to.setReview_content( rs.getString( "review_content" ));
					to.setNovel_title( rs.getString( "novel_title" ));
					to.setReview_date( rs.getString("review_date"));
					to.setReview_ip( rs.getString("review_ip"));
					to.setReview_star_grade( rs.getString("review_star_grade"));
					to.setUser_email( rs.getString("user_email"));
					to.setUser_nickname( rs.getString("user_nickname"));
					
					reviewlists.add( to );
				}
				
				pagingTO.setReviewLists(reviewlists);
				
				// 페이지(블럭) 설정
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

	// 별점 검색 List + paging
	public FreeBoardPagingTO ReviewSearch_StarList(FreeBoardPagingTO pagingTO, String keyword) {
			 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int cpage = pagingTO.getCpage();
			int recordPerPage = pagingTO.getRecordPerPage();
			int blockPerPage = pagingTO.getBlockPerPage();
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "select review_seq, review_content, novel_title, date_format(review_date,'%y-%m-%d') review_date, review_ip, review_star_grade, user_email, user_nickname "
						+ "from novel_review_board where review_star_grade like ? order by review_seq desc";
				
				pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY  );
				pstmt.setString( 1, '%'+keyword+'%' );
				
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
				
				ArrayList<reviewTO> reviewlists = new ArrayList<reviewTO>();
				
				while( rs.next() ) {
					reviewTO to = new reviewTO();
					to.setReview_seq( rs.getString( "review_seq"));
					to.setReview_content( rs.getString( "review_content" ));
					to.setNovel_title( rs.getString( "novel_title" ));
					to.setReview_date( rs.getString("review_date"));
					to.setReview_ip( rs.getString("review_ip"));
					to.setReview_star_grade( rs.getString("review_star_grade"));
					to.setUser_email( rs.getString("user_email"));
					to.setUser_nickname( rs.getString("user_nickname"));
					
					reviewlists.add( to );
				}
				
				pagingTO.setReviewLists(reviewlists);
				
				// 페이지(블럭) 설정
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
	
	// 닉네임+내용 검색 List + paging
	public FreeBoardPagingTO ReviewSearch_ContentList(FreeBoardPagingTO pagingTO, String keyword) {
			 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int cpage = pagingTO.getCpage();
			int recordPerPage = pagingTO.getRecordPerPage();
			int blockPerPage = pagingTO.getBlockPerPage();
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "select review_seq, review_content, novel_title, date_format(review_date,'%y-%m-%d') review_date, review_ip, review_star_grade, user_email, user_nickname "
						+ "from novel_review_board where user_nickname like ? or review_content like ? order by review_seq desc";
				
				pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY  );
				pstmt.setString( 1, '%'+keyword+'%' );
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
				
				ArrayList<reviewTO> reviewlists = new ArrayList<reviewTO>();
				
				while( rs.next() ) {
					reviewTO to = new reviewTO();
					to.setReview_seq( rs.getString( "review_seq"));
					to.setReview_content( rs.getString( "review_content" ));
					to.setNovel_title( rs.getString( "novel_title" ));
					to.setReview_date( rs.getString("review_date"));
					to.setReview_ip( rs.getString("review_ip"));
					to.setReview_star_grade( rs.getString("review_star_grade"));
					to.setUser_email( rs.getString("user_email"));
					to.setUser_nickname( rs.getString("user_nickname"));
					
					reviewlists.add( to );
				}
				
				pagingTO.setReviewLists(reviewlists);
				
				// 페이지(블럭) 설정
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

	// view 
		public reviewTO Review_View(reviewTO to) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = dataSource.getConnection();

				String sql = "select review_seq, review_content, novel_title, date_format(review_date,'%y-%m-%d') review_date,"
						+ " review_ip, review_star_grade, user_email, user_nickname from novel_review_board"
						+ " where review_seq = ?";
				pstmt = conn.prepareStatement( sql );
				pstmt.setString( 1, to.getReview_seq() );
				
				rs = pstmt.executeQuery();
				
				ArrayList<reviewTO> reviewlists = new ArrayList<reviewTO>();
				
				while( rs.next() ) {
					to.setReview_seq( rs.getString( "review_seq"));
					to.setReview_content( rs.getString( "review_content" ));
					to.setNovel_title( rs.getString( "novel_title" ));
					to.setReview_date( rs.getString("review_date"));
					to.setReview_ip( rs.getString("review_ip"));
					to.setReview_star_grade( rs.getString("review_star_grade"));
					to.setUser_email( rs.getString("user_email"));
					to.setUser_nickname( rs.getString("user_nickname"));
					
					reviewlists.add( to );
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
		
		public int Review_DeleteOk(reviewTO to) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int flag = 1;
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "delete from novel_review_board where review_seq=?";
				
				pstmt = conn.prepareStatement( sql );
				pstmt.setString( 1, to.getReview_seq() );		
				
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
