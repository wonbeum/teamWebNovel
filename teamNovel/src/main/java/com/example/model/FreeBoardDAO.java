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
	
	
	// 전체 글 List + paging
	public FreeBoardPagingTO FreeBoard_List(FreeBoardPagingTO pagingTO) {
			 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int cpage = pagingTO.getCpage();
			int recordPerPage = pagingTO.getRecordPerPage();
			int blockPerPage = pagingTO.getBlockPerPage();
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "select free_seq, free_category, free_subject, user_nickname, "
						+ "date_format(free_date,'%y-%m-%d') free_date, free_hit, "
						+ "(select count(user_nickname) from novel_free_like where free_seq = f.free_seq) as free_like, "
						+ "(select count(cmt_seq) from novel_free_comment where free_seq= f.free_seq and cmt_status='공개') as free_comment "
						+ "from novel_free_board f order by free_seq desc";
				
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
	
	// 공지 글 List + paging
	public FreeBoardPagingTO Notice_list(FreeBoardPagingTO pagingTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = pagingTO.getCpage();
		int recordPerPage = pagingTO.getRecordPerPage();
		int blockPerPage = pagingTO.getBlockPerPage();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select free_seq, free_category, free_subject, user_nickname, "
					+ "date_format(free_date,'%y-%m-%d') free_date, free_hit, "
					+ "(select count(user_nickname) from novel_free_like where free_seq = f.free_seq) as free_like, "
					+ "(select count(cmt_seq) from novel_free_comment where free_seq= f.free_seq and cmt_status='공개') as free_comment "
					+ "from novel_free_board f where free_category='공지' order by free_seq desc";
			
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
						+ "from novel_free_board f order by free_like desc";
				
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
	
	// 인기 글 List + paging
	public FreeBoardPagingTO Best_list(FreeBoardPagingTO pagingTO) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int cpage = pagingTO.getCpage();
			int recordPerPage = pagingTO.getRecordPerPage();
			int blockPerPage = pagingTO.getBlockPerPage();
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "select free_seq, free_category, free_subject, user_nickname, "
						+ "date_format(free_date,'%y-%m-%d') free_date, free_hit, "
						+ "(select count(user_nickname) from novel_free_like where free_seq = f.free_seq) as free_like, "
						+ "(select count(cmt_seq) from novel_free_comment where free_seq= f.free_seq and cmt_status='공개') as free_comment "
						+ "from novel_free_board f order by free_like desc";
				
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
		
	
	// 서치 list
	public FreeBoardPagingTO Search_list(FreeBoardPagingTO pagingTO, String keyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int cpage = pagingTO.getCpage();
		int recordPerPage = pagingTO.getRecordPerPage();
		int blockPerPage = pagingTO.getBlockPerPage();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select free_seq, free_category, free_subject, user_nickname, "
					+ "date_format(free_date,'%y-%m-%d') free_date, free_hit, "
					+ "(select count(user_nickname) from novel_free_like where free_seq = f.free_seq) as free_like, "
					+ "(select count(cmt_seq) from novel_free_comment where free_seq= f.free_seq and cmt_status='공개') as free_comment "
					+ "from novel_free_board f where user_nickname like ? or free_subject like ? order by free_seq desc";
			
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY  );
			pstmt.setString( 1, '%'+keyword+'%' );
			pstmt.setString( 2, '%'+keyword+'%' );
			rs = pstmt.executeQuery();
			
			rs.last();
			pagingTO.setTotalRecord(rs.getRow());
			
			rs.beforeFirst();
			
			pagingTO.setTotalPage(( ( pagingTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
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

	//insert 
	public int FreeBoard_Insert_Ok( ) {	 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "insert into novel_free_board values (0, '잡담', ?, ?, now(), ?, 0, 0, 0, ?, ?)";
			pstmt = conn.prepareStatement( sql );
			
			for(int i=1; i<=60; i++){
				
				pstmt.setString( 1, "제목"+i );
				pstmt.setString( 2, "내용 : "+i );
				pstmt.setString( 3, "000.000.000.000" );
				pstmt.setString( 4, "qothwjd507@google.com" );
				pstmt.setString( 5, "sjowo" );
				
				pstmt.executeUpdate();
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
