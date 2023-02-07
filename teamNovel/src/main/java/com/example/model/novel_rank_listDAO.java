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

			Elements novel_rank_names = doc.select("span[class='font-medium2 pb-2pxr text-el-70 line-clamp-2 css-0']");

			for (Element novel_rank_name : novel_rank_names) {
				System.out.println(novel_rank_name.text());
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
				}
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

			Elements novel_rank_names = doc.select("span[class='font-medium2 pb-2pxr text-el-70 line-clamp-2 css-0']");

			for (Element novel_rank_name : novel_rank_names) {
				System.out.println(novel_rank_name.text());
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
				}
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

			Elements novel_rank_names = doc.select("span[class='font-medium2 pb-2pxr text-el-70 line-clamp-2 css-0']");

			for (Element novel_rank_name : novel_rank_names) {
				System.out.println(novel_rank_name.text());
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
				}
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
			Elements novel_rank_names = doc.select("img");

			for (Element novel_rank_name : novel_rank_names) {
				System.out.println(novel_rank_name.attr("alt"));
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
				}
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
			Elements novel_rank_names = doc.select("img");

			for (Element novel_rank_name : novel_rank_names) {
				System.out.println(novel_rank_name.attr("alt"));
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
				}
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
			Elements novel_rank_names = doc.select("img");

			for (Element novel_rank_name : novel_rank_names) {
				System.out.println(novel_rank_name.attr("alt"));
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
				}
		}

		return ranklists;
	}
	

	public ArrayList<novelInfoTO> ridi_rank_romance() {

		ArrayList<novelInfoTO> ranklists = new ArrayList<novelInfoTO>();

		BufferedReader br = null;

		try {
			URL url = new URL(
					"https://ridibooks.com/category/bestsellers/1650?adult_exclude=y&page=1&period=monthly");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			String line = null;

			String strHtml = "";

			while ((line = br.readLine()) != null) {
				strHtml += line.trim();
			}

			Document doc = Jsoup.parse(strHtml);
			Elements novel_rank_names = doc.select("li");

			for (Element novel_rank_name : novel_rank_names) {
				if( novel_rank_name.select("h3 > a[class='fig-z0an5g']").text().equals("") ) {
					
				} else {
					System.out.println( novel_rank_name.select("h3 > a[class='fig-z0an5g']").text() );
				}
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
				}
		}

		return ranklists;
	}
	

	public ArrayList<novelInfoTO> ridi_rank_fantasy() {

		ArrayList<novelInfoTO> ranklists = new ArrayList<novelInfoTO>();

		BufferedReader br = null;

		try {
			URL url = new URL(
					"https://ridibooks.com/category/bestsellers/1750?page=1&period=monthly&adult_exclude=y");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			String line = null;

			String strHtml = "";

			while ((line = br.readLine()) != null) {
				strHtml += line.trim();
			}

			Document doc = Jsoup.parse(strHtml);
			Elements novel_rank_names = doc.select("li");

			for (Element novel_rank_name : novel_rank_names) {
				if( novel_rank_name.select("h3 > a[class='fig-z0an5g']").text().equals("") ) {
					
				} else {
					System.out.println( novel_rank_name.select("h3 > a[class='fig-z0an5g']").text() );
				}
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
				}
		}

		return ranklists;
	}

	public ArrayList<novelInfoTO> ridi_rank_romancefantasy() {

		ArrayList<novelInfoTO> ranklists = new ArrayList<novelInfoTO>();

		BufferedReader br = null;

		try {
			URL url = new URL(
					"https://ridibooks.com/category/bestsellers/6050?adult_exclude=y&page=1&period=monthly");
			br = new BufferedReader(new InputStreamReader(url.openStream()));

			String line = null;

			String strHtml = "";

			while ((line = br.readLine()) != null) {
				strHtml += line.trim();
			}

			Document doc = Jsoup.parse(strHtml);
			Elements novel_rank_names = doc.select("li");

			for (Element novel_rank_name : novel_rank_names) {
				if( novel_rank_name.select("h3 > a[class='fig-z0an5g']").text().equals("") ) {
					
				} else {
					System.out.println( novel_rank_name.select("h3 > a[class='fig-z0an5g']").text() );
				}
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
				}
		}

		return ranklists;
	}
}
