package com.first.scheduler;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.first.domain.AttachDTO;
import com.first.persistence.BoardDAO;
import com.first.utill.MediaUtils;

import lombok.extern.slf4j.Slf4j;

//게시글 첨부파일 사용시
//로컬에 저장된 첨부파일과 DB에 저장된 첨부파일 이름이
// 매칭이 안되는 경우 아무도 사용하지 않는 파일  로컬에서 삭제
// 1일 1번 트래픽 적은 시간대에

@Slf4j
@Component
public class SyncFileScheduler {
	@Autowired
	private SqlSession sqlSession;
	
	private BoardDAO bDao;	
		
	@Autowired
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	String uploadPath = "c:/developer/upload";
	
	
	@Scheduled(cron = "0 0 2 * * *")
	public void checkFiles() throws Exception{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		cal.add(Calendar.DATE, -1);
		List<AttachDTO> fileList = bDao.getOldFiles(sf.format(cal.getTime()));
		List<Path> fileListPaths = fileList.stream().map(dto -> Paths.get(uploadPath+dto.getFullname())).collect(Collectors.toList());
		//스트림 맵 컬렉트 가 한쌍이다. 스트림은 배열에있는 값들을 하나씩 다 꺼내온다.
		//스트림에서 꺼내온 값들을 전 처리 하기위해 map을 씀 
		//전처리 된 값을 다시 저장하기위해
		for(AttachDTO avo : fileList) {
			String fileName= avo.getFullname();
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType !=null) {
				String front = fileName.substring(0,12);
				String end = fileName.substring(14);
				fileListPaths.add(Paths.get(uploadPath+(front+end).replace('/', File.separatorChar)));
			}					
		}		
		fileListPaths.forEach(p->log.info(""+p));
		
		File targetDir = Paths.get(uploadPath, sf.format(cal.getTime()).replace('-', File.separatorChar)).toFile();
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		for(File file : removeFiles) {
			file.delete();
		}
	}	
}
