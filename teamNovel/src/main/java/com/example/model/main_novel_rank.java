package com.example.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class main_novel_rank {

	@Autowired
	private DataSource dataSource;
	
	public mainRankTO kakao_romance() {
		
		ArrayList<novelInfoTO> rank_img = new ArrayList<>();
		
		BufferedReader br = null;

		mainRankTO novelTO = new mainRankTO();
		
		try {
			URL url = new URL("https://page.kakao.com/landing/ranking/11/89?ranking_type=monthly");
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			
			String line = null;
			
			String strHtml = "";
			
			while( (line = br.readLine()) != null ) {
				strHtml += line.trim();
			}
			
			Document doc = Jsoup.parse(strHtml);

			Elements lists = doc.select("div[class='grid under-tablet:grid-cols-2 under-tablet:grid-inner-border-cols2 tablet:grid-cols-2 tablet:grid-inner-border-cols2 css-1pd6zje']>div");
			
			for( Element list : lists ) {
				Elements names = list.select("span[class='font-medium2 pb-2pxr text-el-70 line-clamp-2 css-0']");
				novelInfoTO to = new novelInfoTO();
				for( Element name : names ) {
//					System.out.println( name.text() );
					to.setNovel_title(name.text());
				}
				Elements imgs = list.select("img");

				for( Element img : imgs ) {
					if( img.attr("alt").equals("썸네일") ) {
						to.setNovel_img( img.attr( "src" ) );
					}
				}
				rank_img.add(to);
			}
			
			novelTO.setNovelLists(rank_img);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} finally {
			if( br != null ) try { br.close(); } catch (IOException e) { }
		}
		
		return novelTO;
	}

	public mainRankTO kakao_fantasy() {
		
		ArrayList<novelInfoTO> rank_img = new ArrayList<>();
		
		BufferedReader br = null;

		mainRankTO novelTO = new mainRankTO();
		try {
			URL url = new URL("https://page.kakao.com/landing/ranking/11/86?ranking_type=monthly");
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			
			String line = null;
			
			String strHtml = "";
			
			while( (line = br.readLine()) != null ) {
				strHtml += line.trim();
			}
			
			Document doc = Jsoup.parse(strHtml);

			Elements lists = doc.select("div[class='flex w-full grow flex-col py-5px']>div>div>div>div");
			
			for( Element list : lists ) {
				Elements names = list.select("span[class='font-medium2 pb-2pxr text-el-70 line-clamp-2 css-0']");
				novelInfoTO to = new novelInfoTO();
				for( Element name : names ) {
//					System.out.println( name.text() );
					to.setNovel_title(name.text());
				}
				Elements imgs = list.select("img");

				for( Element img : imgs ) {
					if( img.attr("alt").equals("썸네일") ) {
//						System.out.println( img.attr( "src" ) );
						to.setNovel_img( img.attr( "src" ) );
					}
				}
				rank_img.add(to);
			}

			novelTO.setNovelLists(rank_img);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} finally {
			if( br != null ) try { br.close(); } catch (IOException e) { }
		}
		
		return novelTO;
	}

	public mainRankTO kakao_romancefantasy() {
		
		ArrayList<novelInfoTO> rank_img = new ArrayList<>();
		
		BufferedReader br = null;

		mainRankTO novelTO = new mainRankTO();
		try {
			URL url = new URL("https://page.kakao.com/landing/ranking/11/117?ranking_type=monthly");
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			
			String line = null;
			
			String strHtml = "";
			
			while( (line = br.readLine()) != null ) {
				strHtml += line.trim();
			}
			
			Document doc = Jsoup.parse(strHtml);

			Elements lists = doc.select("div[class='flex w-full grow flex-col py-5px']>div>div>div>div");
			
			for( Element list : lists ) {
				Elements names = list.select("span[class='font-medium2 pb-2pxr text-el-70 line-clamp-2 css-0']");
				novelInfoTO to = new novelInfoTO();
				for( Element name : names ) {
//					System.out.println( name.text() );
					to.setNovel_title(name.text());
				}
				Elements imgs = list.select("img");

				for( Element img : imgs ) {
					if( img.attr("alt").equals("썸네일") ) {
//						System.out.println( img.attr( "src" ) );
						to.setNovel_img( img.attr( "src" ) );
					}
				}
				rank_img.add(to);
			}
			novelTO.setNovelLists(rank_img);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} finally {
			if( br != null ) try { br.close(); } catch (IOException e) { }
		}
		
		return novelTO;
	}
	
	public mainRankTO naver_romace(){

		ArrayList<novelInfoTO> rank_img = new ArrayList<>();
		
		BufferedReader br = null;

		mainRankTO novelTO = new mainRankTO();
		
		try {
			URL url = new URL("https://series.naver.com/novel/top100List.series?rankingTypeCode=MONTHLY&categoryCode=201");
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			
			String line = null;
			
			String strHtml = "";
			
			while( (line = br.readLine()) != null ) {
				strHtml += line.trim();
			}
			
			Document doc = Jsoup.parse(strHtml);
			
			Elements lists = doc.select("ul[class='comic_top_lst']>li");

			for( Element list : lists ) {
				novelInfoTO to = new novelInfoTO();
				
				Elements imgs = list.select("img");
				for( Element img : imgs ) {
					String imgsrc = img.attr("src").replace("type=m79", "type=m260");
					to.setNovel_img( imgsrc );
					to.setNovel_title( img.attr( "alt" ) );
					rank_img.add(to);
				}
				
			}
			novelTO.setNovelLists(rank_img);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} finally {
			if( br != null ) try { br.close(); } catch (IOException e) { }
		}
		
		return novelTO;
	}
	public mainRankTO naver_fantasy(){

		ArrayList<novelInfoTO> rank_img = new ArrayList<>();
		
		BufferedReader br = null;
		mainRankTO novelTO = new mainRankTO();
		
		try {
			URL url = new URL("https://series.naver.com/novel/top100List.series?rankingTypeCode=MONTHLY&categoryCode=202");
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			
			String line = null;
			
			String strHtml = "";
			
			while( (line = br.readLine()) != null ) {
				strHtml += line.trim();
			}
			
			Document doc = Jsoup.parse(strHtml);
			
			Elements lists = doc.select("ul[class='comic_top_lst']>li");

			for( Element list : lists ) {
				novelInfoTO to = new novelInfoTO();
				
				Elements imgs = list.select("img");
				for( Element img : imgs ) {
					String imgsrc = img.attr("src").replace("type=m79", "type=m260");
					to.setNovel_img( imgsrc );
					to.setNovel_title( img.attr( "alt" ) );
					rank_img.add(to);
				}
				
			}
			novelTO.setNovelLists(rank_img);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} finally {
			if( br != null ) try { br.close(); } catch (IOException e) { }
		}
		
		return novelTO;
	}
	public mainRankTO naver_romacefantasy(){

		ArrayList<novelInfoTO> rank_img = new ArrayList<>();
		
		BufferedReader br = null;
		mainRankTO novelTO = new mainRankTO();
		
		try {
			URL url = new URL("https://series.naver.com/novel/top100List.series?rankingTypeCode=MONTHLY&categoryCode=207");
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			
			String line = null;
			
			String strHtml = "";
			
			while( (line = br.readLine()) != null ) {
				strHtml += line.trim();
			}
			
			Document doc = Jsoup.parse(strHtml);
			
			Elements lists = doc.select("ul[class='comic_top_lst']>li");

			for( Element list : lists ) {
				novelInfoTO to = new novelInfoTO();
				
				Elements imgs = list.select("img");
				for( Element img : imgs ) {
					String imgsrc = img.attr("src").replace("type=m79", "type=m260");
					to.setNovel_img( imgsrc );
					to.setNovel_title( img.attr( "alt" ) );
					rank_img.add(to);
				}
				
			}
			novelTO.setNovelLists(rank_img);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} finally {
			if( br != null ) try { br.close(); } catch (IOException e) { }
		}
		
		return novelTO;
	}

	public mainRankTO pop_list(){

		ArrayList<novelInfoTO> rank_img = new ArrayList<>();

		mainRankTO novelTO = new mainRankTO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();
			
			String sql = "Select r.novel_title, avg(review_star_grade) avg, novel_img from novel_review_board r left join novel_information n on r.novel_title = n.novel_title group by novel_title order by avg desc limit 10";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				novelInfoTO to = new novelInfoTO();
				to.setNovel_img( rs.getString("novel_img") );
				to.setNovel_title( rs.getString("novel_title") );
				rank_img.add(to);
			}

			novelTO.setNovelLists(rank_img);
			
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
