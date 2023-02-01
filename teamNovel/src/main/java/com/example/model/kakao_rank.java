package com.example.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Repository;

@Repository
public class kakao_rank {

	public ArrayList<novelInfoTO> kakao_romance() {
		
		ArrayList<novelInfoTO> rank_img = new ArrayList<>();
		
		BufferedReader br = null;
		
		try {
			URL url = new URL("https://page.kakao.com/landing/ranking/11/89?ranking_type=monthly");
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			
			String line = null;
			
			String strHtml = "";
			
			while( (line = br.readLine()) != null ) {
				strHtml += line.trim();
			}
			
			Document doc = Jsoup.parse(strHtml);
			
			Elements novel_rank_names = doc.select("img");

			for( Element novel_rank_name : novel_rank_names ) {
				if( novel_rank_name.attr("alt").equals("썸네일") ) {

					novelInfoTO to = new novelInfoTO();
//					System.out.println(novel_rank_name.attr( "src" ));
					to.setNovel_img( novel_rank_name.attr( "src" ) );
					rank_img.add(to);
				}
			}
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} finally {
			if( br != null ) try { br.close(); } catch (IOException e) { }
		}
		
		return rank_img;
	}

	public ArrayList<novelInfoTO> kakao_fantasy() {
		
		ArrayList<novelInfoTO> rank_img = new ArrayList<>();
		
		BufferedReader br = null;
		
		try {
			URL url = new URL("https://page.kakao.com/landing/ranking/11/86?ranking_type=monthly");
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			
			String line = null;
			
			String strHtml = "";
			
			while( (line = br.readLine()) != null ) {
				strHtml += line.trim();
			}
			
			Document doc = Jsoup.parse(strHtml);
			
			Elements novel_rank_names = doc.select("img");

			for( Element novel_rank_name : novel_rank_names ) {
				if( novel_rank_name.attr("alt").equals("썸네일") ) {
					novelInfoTO to = new novelInfoTO();
					to.setNovel_img( novel_rank_name.attr( "src" ) );
					rank_img.add(to);
				}
			}
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} finally {
			if( br != null ) try { br.close(); } catch (IOException e) { }
		}
		
		return rank_img;
	}

	public ArrayList<novelInfoTO> kakao_romancefantasy() {
		
		ArrayList<novelInfoTO> rank_img = new ArrayList<>();
		
		BufferedReader br = null;
		
		try {
			URL url = new URL("https://page.kakao.com/landing/ranking/11/117?ranking_type=monthly");
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			
			String line = null;
			
			String strHtml = "";
			
			while( (line = br.readLine()) != null ) {
				strHtml += line.trim();
			}
			
			Document doc = Jsoup.parse(strHtml);
			
			Elements novel_rank_names = doc.select("img");

			for( Element novel_rank_name : novel_rank_names ) {
				if( novel_rank_name.attr("alt").equals("썸네일") ) {
					System.out.println( novel_rank_name.attr( "src" ) );
				}
			}
			
			for( Element novel_rank_name : novel_rank_names ) {
				if( novel_rank_name.attr("alt").equals("썸네일") ) {
					novelInfoTO to = new novelInfoTO();
					to.setNovel_img( novel_rank_name.attr( "src" ) );
					rank_img.add(to);
				}
			}
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println( "[에러] : " +e.getMessage() );
		} finally {
			if( br != null ) try { br.close(); } catch (IOException e) { }
		}
		
		return rank_img;
	}
}
