package com.first.service.index;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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

}
