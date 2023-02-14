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
public class admin_origin_requestDAO {
	@Autowired
	private DataSource dataSource;
	// 전체 요청 list
	public ArrayList<admin_origin_requestTO> origin_request_list() {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<admin_origin_requestTO> requestLists = new ArrayList<>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select request_seq, request_title, request_category, user_email, user_nickname from novel_origin_request order by request_seq desc";
			
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				admin_origin_requestTO to = new admin_origin_requestTO();
				to.setRequest_seq( rs.getString( "request_seq" ) );
				to.setRequest_title( rs.getString( "request_title" ) );
				to.setRequest_category( rs.getString( "request_category" ) );
				to.setUser_email( rs.getString( "user_email" ));
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				
				requestLists.add( to );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return requestLists;
	}
	
	
	public admin_RQPagingTO requestLists(  admin_RQPagingTO arqTO ){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int cpage = arqTO.getCpage();
		int recordPerPage = arqTO.getRecordPerPage();
		int blockPerPage = arqTO.getBlockPerPage();
		
		try {
			conn = dataSource.getConnection();

			String sql = "select request_seq, request_title, request_category, user_email, user_nickname from novel_origin_request order by request_seq desc";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			rs.last();
			arqTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			arqTO.setTotalPage( ( ( arqTO.getTotalRecord() - 1 ) / recordPerPage ) + 1 );
			
			int skip = ( cpage - 1 ) * recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			ArrayList<admin_origin_requestTO> lists = new ArrayList<>();

			for( int i=0 ; i < recordPerPage && rs.next() ; i++ ) {
				
				admin_origin_requestTO to = new admin_origin_requestTO();
				to.setRequest_seq( rs.getString( "request_seq" ) );
				to.setRequest_title( rs.getString( "request_title" ) );
				to.setRequest_category( rs.getString( "request_category" ) );
				to.setUser_email( rs.getString( "user_email" ));
				to.setUser_nickname( rs.getString( "user_nickname" ) );
				
				lists.add( to );
			}
			
			arqTO.setRequestLists(lists);

			arqTO.setStartBlock( ( ( cpage - 1 ) / blockPerPage ) * blockPerPage + 1 );
			arqTO.setEndBlock( ( ( cpage -1 ) / blockPerPage ) * blockPerPage + blockPerPage );
			if( arqTO.getEndBlock() >= arqTO.getTotalPage() ) {
				arqTO.setEndBlock( arqTO.getTotalPage() );
			}
			
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return arqTO;
		
	}
	
	

	// delete_ok
	public int originRequestDeleteOk( admin_origin_requestTO to ) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "delete from novel_origin_request where request_seq=?";
			
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getRequest_seq() );		
			
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
