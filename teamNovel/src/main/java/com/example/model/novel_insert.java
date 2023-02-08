package com.example.model;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class novel_insert {
	@Autowired
	private DataSource dataSource;
	
	public void novel_ridiRomance_Insert() {

		Connection conn= null;;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn = dataSource.getConnection();
			
			Reader reader = new FileReader("./src/main/webapp/datas/리디북스_로맨스.json");
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(reader);
			
			JSONArray jsonArr = ( JSONArray ) obj;
			
			int j = 0;
			int k = 0;
			
			for( int i = 0; i < jsonArr.size() ; i ++ ) {
				JSONObject jsonObj = ( JSONObject ) jsonArr.get(i);
				
//				System.out.println( jsonObj.get("novel_title") );
				
				String sql = ( "select * from novel_information where novel_title = ? " );
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, (String) jsonObj.get("novel_title") );
				
				rs = pstmt.executeQuery();
				
				rs.last();
				int rowCount = rs.getRow();
				rs.beforeFirst();
				
//				System.out.println(rowCount);
				if( rowCount == 0 ) {
					sql = String.format("insert into novel_information values ('%s','%s','%s','%s','%s','%s','%s','%s');",
							(String) jsonObj.get("novel_title"),(String) jsonObj.get("novel_genre"),
							(String) jsonObj.get("novel_writer"),(String) jsonObj.get("novel_img"),
							(String) jsonObj.get("novel_content"),
							(String) jsonObj.get("platform_series"),(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("novel_ridi"));

					//System.out.println( sql );
					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					j++;	
				} else {
					sql = String.format("UPDATE novel_information SET novel_ridi ='%s' WHERE novel_title = '%s' ",
							(String) jsonObj.get("novel_ridi"),(String) jsonObj.get("novel_title") );

					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					k++;
				}
			}
			System.out.println( "리디로맨스 : " + j );
			System.out.println( "중복 : " + k );
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}	
	}

	public void novel_ridiFantasy_Insert() {

		Connection conn= null;;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn = dataSource.getConnection();
			
			Reader reader = new FileReader("./src/main/webapp/datas/리디북스_판타지.json");
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(reader);
			
			JSONArray jsonArr = ( JSONArray ) obj;

			int j = 0;
			int k = 0;
			for( int i = 0; i < jsonArr.size() ; i ++ ) {
				JSONObject jsonObj = ( JSONObject ) jsonArr.get(i);
				
//				System.out.println( jsonObj.get("novel_title") );
				
				String sql = ( "select * from novel_information where novel_title = ? " );
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, (String) jsonObj.get("novel_title") );
				
				rs = pstmt.executeQuery();
				
				rs.last();
				int rowCount = rs.getRow();
				rs.beforeFirst();
				
//				System.out.println(rowCount);
				if( rowCount == 0 ) {
					sql = String.format("insert into novel_information values ('%s','%s','%s','%s','%s','%s','%s','%s');",
							(String) jsonObj.get("novel_title"),(String) jsonObj.get("novel_genre"),
							(String) jsonObj.get("novel_writer"),(String) jsonObj.get("novel_img"),
							(String) jsonObj.get("novel_content"),
							(String) jsonObj.get("platform_series"),(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("platform_ridi"));

					//System.out.println( sql );
					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					j++;	
				} else {
					sql = String.format("UPDATE novel_information SET novel_ridi ='%s' WHERE novel_title = '%s' ",
							(String) jsonObj.get("platform_ridi"),(String) jsonObj.get("novel_title") );

					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					k++;
				}
			}
			System.out.println( "리디판타지 : " + j );
			System.out.println( "중복 : " + k );
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
	}
	
	public void novel_ridiRomanceFatasy_Insert() {

		Connection conn= null;;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn = dataSource.getConnection();
			
			Reader reader = new FileReader("./src/main/webapp/datas/리디북스_로맨스판타지.json");
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(reader);
			
			JSONArray jsonArr = ( JSONArray ) obj;
			int j = 0;
			int k = 0;
			for( int i = 0; i < jsonArr.size() ; i ++ ) {
				JSONObject jsonObj = ( JSONObject ) jsonArr.get(i);
				
//				System.out.println( jsonObj.get("novel_title") );
				
				String sql = ( "select * from novel_information where novel_title = ? " );
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, (String) jsonObj.get("novel_title") );
				
				rs = pstmt.executeQuery();
				
				rs.last();
				int rowCount = rs.getRow();
				rs.beforeFirst();
				
//				System.out.println(rowCount);
				if( rowCount == 0 ) {
					sql = String.format("insert into novel_information values ('%s','%s','%s','%s','%s','%s','%s','%s');",
							(String) jsonObj.get("novel_title"),(String) jsonObj.get("novel_genre"),
							(String) jsonObj.get("novel_writer"),(String) jsonObj.get("novel_img"),
							(String) jsonObj.get("novel_content"),
							(String) jsonObj.get("platform_series"),(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("platform_ridi"));

					//System.out.println( sql );
					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					j++;	
				} else {
					sql = String.format("UPDATE novel_information SET novel_ridi ='%s' WHERE novel_title = '%s' ",
							(String) jsonObj.get("platform_ridi"),(String) jsonObj.get("novel_title") );

					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					k++;
				}
			}
			System.out.println( "리디로맨스판타지 : " + j );
			System.out.println( "중복 : " + k );
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
	}
	
	public void novel_naverRomance_Insert() {

		Connection conn= null;;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn = dataSource.getConnection();
			
			Reader reader = new FileReader("./src/main/webapp/datas/naver_romance.json");
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(reader);
			
			JSONArray jsonArr = ( JSONArray ) obj;

			int j = 0;
			int k = 0;
			for( int i = 0; i < jsonArr.size() ; i ++ ) {
				JSONObject jsonObj = ( JSONObject ) jsonArr.get(i);
				
//				System.out.println( jsonObj.get("novel_title") );
				
				String sql = ( "select * from novel_information where novel_title = ? " );
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, (String) jsonObj.get("novel_title") );
				
				rs = pstmt.executeQuery();
				
				rs.last();
				int rowCount = rs.getRow();
				rs.beforeFirst();
				
//				System.out.println(rowCount);
				if( rowCount == 0 ) {
					sql = String.format("insert into novel_information values ('%s','%s','%s','%s','%s','%s','%s','%s');",
							(String) jsonObj.get("novel_title"),(String) jsonObj.get("novel_genre"),
							(String) jsonObj.get("novel_writer"),(String) jsonObj.get("Image"),
							(String) jsonObj.get("novel_content"),
							(String) jsonObj.get("platform_series"),(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("novel_ridi"));

					//System.out.println( sql );
					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					j++;	
				} else {
					sql = String.format("UPDATE novel_information SET novel_series ='%s' WHERE novel_title = '%s' ",
							(String) jsonObj.get("platform_series"),(String) jsonObj.get("novel_title") );

					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					k++;
				}
			}
			System.out.println( "네이버로맨스 : " + j );
			System.out.println( "중복 : " + k );
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
	}

	public void novel_naverFantasy_Insert() {

		Connection conn= null;;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn = dataSource.getConnection();
			
			Reader reader = new FileReader("./src/main/webapp/datas/naver_fantasy.json");
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(reader);
			
			JSONArray jsonArr = ( JSONArray ) obj;

			int j = 0;
			int k = 0;
			for( int i = 0; i < jsonArr.size() ; i ++ ) {
				JSONObject jsonObj = ( JSONObject ) jsonArr.get(i);
				
//				System.out.println( jsonObj.get("novel_title") );
				
				String sql = ( "select * from novel_information where novel_title = ? " );
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, (String) jsonObj.get("novel_title") );
				
				rs = pstmt.executeQuery();
				
				rs.last();
				int rowCount = rs.getRow();
				rs.beforeFirst();
				
//				System.out.println(rowCount);
				if( rowCount == 0 ) {
					sql = String.format("insert into novel_information values ('%s','%s','%s','%s','%s','%s','%s','%s');",
							(String) jsonObj.get("novel_title"),(String) jsonObj.get("novel_genre"),
							(String) jsonObj.get("novel_writer"),(String) jsonObj.get("novel_img"),
							(String) jsonObj.get("novel_content"),
							(String) jsonObj.get("platform_series"),(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("novel_ridi"));

					//System.out.println( sql );
					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					j++;	
				} else {
					sql = String.format("UPDATE novel_information SET novel_series ='%s' WHERE novel_title = '%s' ",
							(String) jsonObj.get("platform_series"),(String) jsonObj.get("novel_title") );

					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					k++;
				}
			}
			System.out.println( "네이버판타지 : " + j );
			System.out.println( "중복 : " + k );
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
	}

	public void novel_naverRomanceFantasy_Insert() {

		Connection conn= null;;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn = dataSource.getConnection();
			
			Reader reader = new FileReader("./src/main/webapp/datas/naver_romancefantasy.json");
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(reader);
			
			JSONArray jsonArr = ( JSONArray ) obj;

			int j = 0;
			int k = 0;
			for( int i = 0; i < jsonArr.size() ; i ++ ) {
				JSONObject jsonObj = ( JSONObject ) jsonArr.get(i);
				
//				System.out.println( jsonObj.get("novel_title") );
				
				String sql = ( "select * from novel_information where novel_title = ? " );
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, (String) jsonObj.get("novel_title") );
				
				rs = pstmt.executeQuery();

				rs.last();
				int rowCount = rs.getRow();
				rs.beforeFirst();
				
//				System.out.println(rowCount);
				if( rowCount == 0 ) {
					sql = String.format("insert into novel_information values ('%s','%s','%s','%s','%s','%s','%s','%s');",
							(String) jsonObj.get("novel_title"),(String) jsonObj.get("novel_genre"),
							(String) jsonObj.get("novel_writer"),(String) jsonObj.get("novel_img"),
							(String) jsonObj.get("novel_content"),
							(String) jsonObj.get("platform_seriese"),(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("novel_ridi"));

//					System.out.println( sql );
					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					j++;	
				} else {
					sql = String.format("UPDATE novel_information SET novel_series ='%s' WHERE novel_title = '%s' ",
							(String) jsonObj.get("platform_seriese"),(String) jsonObj.get("novel_title") );

					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					k++;
				}
			}
			System.out.println( "네이버로맨스판타지 : " + j );
			System.out.println( "중복 : " + k );
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
	}

	public void novel_kakaoRomance_Insert() {

		Connection conn= null;;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn = dataSource.getConnection();
			
			Reader reader = new FileReader("./src/main/webapp/datas/kakao_romance.json");
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(reader);
			
			JSONArray jsonArr = ( JSONArray ) obj;

			int j = 0;
			int k = 0;
			for( int i = 0; i < jsonArr.size() ; i ++ ) {
				JSONObject jsonObj = ( JSONObject ) jsonArr.get(i);
				
//				System.out.println( jsonObj.get("novel_title") );
				
				String sql = ( "select * from novel_information where novel_title = ? " );
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, (String) jsonObj.get("novel_title") );
				
				rs = pstmt.executeQuery();
				
				rs.last();
				int rowCount = rs.getRow();
				rs.beforeFirst();
				
//				System.out.println(rowCount);
				if( rowCount == 0 ) {
					sql = String.format("insert into novel_information values ('%s','%s','%s','%s','%s','%s','%s','%s');",
							(String) jsonObj.get("novel_title"),(String) jsonObj.get("novel_genre"),
							(String) jsonObj.get("novel_writer"),(String) jsonObj.get("novel_img"),
							(String) jsonObj.get("novel_content"),
							(String) jsonObj.get("platform_series"),(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("novel_ridi"));

					//System.out.println( sql );
					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					j++;	
				} else {
					sql = String.format("UPDATE novel_information SET novel_kakao ='%s' WHERE novel_title = '%s' ",
							(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("novel_title") );

					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					k++;
				}
			}
			System.out.println( "카카오로맨스 : " + j );
			System.out.println( "중복 : " + k );
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
	}

	public void novel_kakaoFantasy_Insert() {

		Connection conn= null;;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn = dataSource.getConnection();
			
			Reader reader = new FileReader("./src/main/webapp/datas/kakao_fantasy.json");
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(reader);
			
			JSONArray jsonArr = ( JSONArray ) obj;

			int j = 0;
			int k = 0;
			for( int i = 0; i < jsonArr.size() ; i ++ ) {
				JSONObject jsonObj = ( JSONObject ) jsonArr.get(i);
				
//				System.out.println( jsonObj.get("novel_title") );
				
				String sql = ( "select * from novel_information where novel_title = ? " );
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, (String) jsonObj.get("novel_title") );
				
				rs = pstmt.executeQuery();
				
				rs.last();
				int rowCount = rs.getRow();
				rs.beforeFirst();
				
//				System.out.println(rowCount);
				if( rowCount == 0 ) {
					sql = String.format("insert into novel_information values ('%s','%s','%s','%s','%s','%s','%s','%s');",
							(String) jsonObj.get("novel_title"),(String) jsonObj.get("novel_genre"),
							(String) jsonObj.get("novel_writer"),(String) jsonObj.get("novel_img"),
							(String) jsonObj.get("novel_content"),
							(String) jsonObj.get("platform_series"),(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("novel_ridi"));

					//System.out.println( sql );
					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					j++;	
				} else {
					sql = String.format("UPDATE novel_information SET novel_kakao ='%s' WHERE novel_title = '%s' ",
							(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("novel_title") );

					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					k++;
				}
			}
			System.out.println( "카카오판타지 : " + j );
			System.out.println( "중복 : " + k );
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
	}

	public void novel_kakaoRomanceFantasy_Insert() {

		Connection conn= null;;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			conn = dataSource.getConnection();
			
			Reader reader = new FileReader("./src/main/webapp/datas/kakao_romancefantasy.json");
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(reader);
			
			JSONArray jsonArr = ( JSONArray ) obj;

			int j = 0;
			int k = 0;
			for( int i = 0; i < jsonArr.size() ; i ++ ) {
				JSONObject jsonObj = ( JSONObject ) jsonArr.get(i);
				
//				System.out.println( jsonObj.get("novel_title") );
				
				String sql = ( "select * from novel_information where novel_title = ? " );
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, (String) jsonObj.get("novel_title") );
				
				rs = pstmt.executeQuery();
				
				rs.last();
				int rowCount = rs.getRow();
				rs.beforeFirst();
				
//				System.out.println(rowCount);
				if( rowCount == 0 ) {
					sql = String.format("insert into novel_information values ('%s','%s','%s','%s','%s','%s','%s','%s');",
							(String) jsonObj.get("novel_title"),(String) jsonObj.get("novel_genre"),
							(String) jsonObj.get("novel_writer"),(String) jsonObj.get("novel_img"),
							(String) jsonObj.get("novel_content"),
							(String) jsonObj.get("platform_series"),(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("novel_ridi"));

//					System.out.println( sql );
					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					j++;	
				} else {
					sql = String.format("UPDATE novel_information SET novel_kakao ='%s' WHERE novel_title = '%s' ",
							(String) jsonObj.get("platform_kakao"),(String) jsonObj.get("novel_title") );

					pstmt = conn.prepareStatement( sql );
					pstmt.executeUpdate(sql);
					k++;
				}
			}
			System.out.println( "카카오로맨스판타지 : " + j );
			System.out.println( "중복 : " + k );
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null) try { conn.close(); } catch( SQLException e ) {}
		}
	}
}