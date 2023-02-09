package com.example.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class novel_rank_listDAO {
	@Autowired
	private DataSource dataSource;

	public ArrayList<novelInfoTO> kakao_rank_romance() {

		ArrayList<novelInfoTO> ranklists = new ArrayList<novelInfoTO>();

		BufferedReader br = null;

		try {
			URL url = new URL("https://page.kakao.com/landing/ranking/11/89?ranking_type=monthly");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			String line = null;

			String strHtml = "";

			while ((line = br.readLine()) != null) {
				strHtml += line.trim();
			}

			Document doc = Jsoup.parse(strHtml);

			Elements lists = doc.select("div[class='grid under-tablet:grid-cols-2 under-tablet:grid-inner-border-cols2 tablet:grid-cols-2 tablet:grid-inner-border-cols2 css-1pd6zje']>div");
			
			for( Element list : lists ) {
				Elements names = list.select("span[class='font-medium2 pb-2pxr text-el-70 line-clamp-2 css-0']");
				novelInfoTO to = new novelInfoTO();
				for( Element name : names ) {
					to.setNovel_title(name.text());
				}
				Elements imgs = list.select("img");

				for( Element img : imgs ) {
					if( img.attr("alt").equals("썸네일") ) {
						to.setNovel_img( img.attr( "src" ) );
					}
				}
				ranklists.add(to);
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null) try { br.close(); } catch (IOException e) {}
		}

		return ranklists;
	}

	public ArrayList<novelInfoTO> kakao_rank_fantasy() {

		ArrayList<novelInfoTO> ranklists = new ArrayList<novelInfoTO>();

		BufferedReader br = null;

		try {
			URL url = new URL("https://page.kakao.com/landing/ranking/11/86?ranking_type=monthly");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			String line = null;

			String strHtml = "";

			while ((line = br.readLine()) != null) {
				strHtml += line.trim();
			}

			Document doc = Jsoup.parse(strHtml);

			Elements lists = doc.select("div[class='grid under-tablet:grid-cols-2 under-tablet:grid-inner-border-cols2 tablet:grid-cols-2 tablet:grid-inner-border-cols2 css-1pd6zje']>div");
			
			for( Element list : lists ) {
				Elements names = list.select("span[class='font-medium2 pb-2pxr text-el-70 line-clamp-2 css-0']");
				novelInfoTO to = new novelInfoTO();
				for( Element name : names ) {
					to.setNovel_title(name.text());
				}
				Elements imgs = list.select("img");

				for( Element img : imgs ) {
					if( img.attr("alt").equals("썸네일") ) {
						to.setNovel_img( img.attr( "src" ) );
					}
				}
				ranklists.add(to);
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null) try { br.close(); } catch (IOException e) {}
		}

		return ranklists;
	}

	public ArrayList<novelInfoTO> kakao_rank_romancefantasy() {

		ArrayList<novelInfoTO> ranklists = new ArrayList<novelInfoTO>();

		BufferedReader br = null;

		try {
			URL url = new URL("https://page.kakao.com/landing/ranking/11/117?ranking_type=monthly");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			String line = null;

			String strHtml = "";

			while ((line = br.readLine()) != null) {
				strHtml += line.trim();
			}

			Document doc = Jsoup.parse(strHtml);

			Elements lists = doc.select("div[class='grid under-tablet:grid-cols-2 under-tablet:grid-inner-border-cols2 tablet:grid-cols-2 tablet:grid-inner-border-cols2 css-1pd6zje']>div");
			
			for( Element list : lists ) {
				Elements names = list.select("span[class='font-medium2 pb-2pxr text-el-70 line-clamp-2 css-0']");
				novelInfoTO to = new novelInfoTO();
				for( Element name : names ) {
					to.setNovel_title(name.text());
				}
				Elements imgs = list.select("img");

				for( Element img : imgs ) {
					if( img.attr("alt").equals("썸네일") ) {
						to.setNovel_img( img.attr( "src" ) );
					}
				}
				ranklists.add(to);
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null) try { br.close(); } catch (IOException e) {}
		}

		return ranklists;
	}

	public ArrayList<novelInfoTO> naver_rank_romance() {

		ArrayList<novelInfoTO> ranklists = new ArrayList<novelInfoTO>();

		BufferedReader br = null;

		try {
			URL url = new URL(
					"https://series.naver.com/novel/top100List.series?rankingTypeCode=MONTHLY&categoryCode=201&page=1");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			String line = null;

			String strHtml = "";

			while ((line = br.readLine()) != null) {
				strHtml += line.trim();
			}

			url = new URL(
					"https://series.naver.com/novel/top100List.series?rankingTypeCode=MONTHLY&categoryCode=201&page=2");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			while ((line = br.readLine()) != null) {
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
					ranklists.add(to);
				}
				
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null) try { br.close(); } catch (IOException e) {}
		}

		return ranklists;
	}

	public ArrayList<novelInfoTO> naver_rank_fantasy() {

		ArrayList<novelInfoTO> ranklists = new ArrayList<novelInfoTO>();

		BufferedReader br = null;

		try {
			URL url = new URL(
					"https://series.naver.com/novel/top100List.series?rankingTypeCode=MONTHLY&categoryCode=202&page=1");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			String line = null;

			String strHtml = "";

			while ((line = br.readLine()) != null) {
				strHtml += line.trim();
			}

			url = new URL(
					"https://series.naver.com/novel/top100List.series?rankingTypeCode=MONTHLY&categoryCode=202&page=2");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			while ((line = br.readLine()) != null) {
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
					ranklists.add(to);
				}
				
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null) try { br.close(); } catch (IOException e) {}
		}

		return ranklists;
	}


	public ArrayList<novelInfoTO> naver_rank_romancefantasy() {

		ArrayList<novelInfoTO> ranklists = new ArrayList<novelInfoTO>();

		BufferedReader br = null;

		try {
			URL url = new URL(
					"https://series.naver.com/novel/top100List.series?rankingTypeCode=MONTHLY&categoryCode=207&page=1");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			String line = null;

			String strHtml = "";

			while ((line = br.readLine()) != null) {
				strHtml += line.trim();
			}

			url = new URL(
					"https://series.naver.com/novel/top100List.series?rankingTypeCode=MONTHLY&categoryCode=207&page=2");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			while ((line = br.readLine()) != null) {
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
					ranklists.add(to);
				}
				
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null) try { br.close(); } catch (IOException e) {}
		}

		return ranklists;
	}

}
