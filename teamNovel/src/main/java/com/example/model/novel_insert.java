package com.example.model;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class novel_insert {
	@Autowired
	private DataSource dataSource;
	
	public void novelInsert() {

		Connection conn= null;;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		BufferedReader br = null;

			try {
				conn = dataSource.getConnection();
										
				br = new BufferedReader(new FileReader("/Users/jowonbeom/Java/project-workspace/teamNovel/src/main/webapp/datas/리디북스_ 로맨스.csv"));
				
				String str = null;
				String datas = null;
				while((str = br.readLine())!=null) {
					datas += str;
				}

				str = datas.replaceAll( "\n", "" ).replaceAll(",나눔", "\n");
				
				String [] data = str.split( "\n" );
				
//				System.out.println( data.length );
				
				int i = 0;
				for( String novels : data ) {
					String [] novel = novels.split(",");
					
					String sql = ( "select count(*) from novel_information where novel_title = ? " );
					pstmt = conn.prepareStatement( sql );
					pstmt.setNString(1, novel[0]);
					
					rs = pstmt.executeQuery();
					
					if( rs.getRow() == 0 ) {
						sql = String.format("insert into novel_information values ('%s','%s','%s','%s','%s','%s','%s','%s');",
						novel[0],novel[1],novel[2],novel[3],novel[4],novel[5],null,null);

						System.out.println( sql );
						pstmt = conn.prepareStatement( sql );
						pstmt.executeUpdate(sql);
						i++;	
					}
				}

				System.out.println( i );
				
				System.out.println("저장 완료");
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println( "[에러] " + e.getMessage() );
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println( "[에러] " + e.getMessage() );
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println( "[에러] " + e.getMessage() );
			} finally {
				if( rs != null) try { rs.close(); } catch( SQLException e ) {}
				if( pstmt != null) try { pstmt.close(); } catch( SQLException e ) {}
				if( conn != null) try { conn.close(); } catch( SQLException e ) {}
			}	

		
	}
	
}
