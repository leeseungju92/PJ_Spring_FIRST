package com.first.service.index;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.domain.ProductDTO;
import com.first.persistence.ProductDAO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class IndexServiceImpl implements IndexService{
	//기존에는 DAO > Mybatis > DB 순차적 실행
	//스프링에서는 DAO+Mapper를 결합사용
	
	//SqlSession을 사용하기 위한 의존성 주입
	//:root-context.xml에서 생성된 sqlSession 빈즈를 주입받음!
	@Autowired
	private SqlSession sqlSession;
	
	ProductDAO pDao;
	@Autowired
	public void newProductDAO() {
		pDao = sqlSession.getMapper(ProductDAO.class);
	}
	
	@Override
	public List<ProductDTO> bestPdtList() {
		//비즈니스로직
		//:베스트상품 5건을 조회해서 View(메인)단에 출력
		//log.info("@을 사용한 방법:" + pDao.getCount());
		//log.info("xml을 사용한방법:" + pDao.getCount2());
		//:베스트상품 5건을 조회해서 View(메인)단에 출력
		List<ProductDTO> list=pDao.bestPdtList();
		for(ProductDTO productDTO :list) {
			log.info(productDTO.toString());
		}
		return pDao.bestPdtList();
	}
	
	@Override
	public void addNews() throws IOException {
		String url = "https://news.daum.net/breakingnews/economic/estate";

		Document doc = Jsoup.connect(url).get();
		Elements urls = doc.select("ul.list_allnews strong.tit_thumb > a.link_txt");
		
		
		for (Element element : urls) {
			// attr()을 사용하여 원하는 속성값 추출/ 우리가href만 필요로 하니까			
			String href = element.attr("href");// 포문 한번돌면서 엘리먼트에 기사하나 들어감
			Document docNews = Jsoup.connect(href).get();//IOException 예외처리해줘야 실행이 가능하다.

			// 전체 태그에서 원하는 항목만 select함
			Elements title = docNews.select("h3.tit_view"); // h3태그중에서 클래스가 tit뷰인걸 찾아라 / 제목추출
			Elements content = docNews.select("div#harmonyContainer");// 본문추출
			String ntitle = title.text();
			String ncontent = content.text();
			int ntlen = ntitle.length();
			int nclen = ncontent.length();			
			if(ntlen>100){			
				ntitle = ntitle.substring(50);
			}
			if(nclen>3000){				
				ncontent = ncontent.substring(500);
			}
			if(nclen>2500) {
				ncontent = ncontent.substring(500);
			}
			if(nclen>1500) {
				ncontent = ncontent.substring(500);
			}
			if(nclen>1000) {
				ncontent = ncontent.substring(500);
			}
			if(nclen>500) {
				ncontent = ncontent.substring(250);
			}
			
			
			ProductDTO pDto = new ProductDTO(ntitle,ncontent,href);
			// DTO에 담긴 1건의 평점을 DB에 저장
			pDao.addnews(pDto);
		}
	}

	

}
