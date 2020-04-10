package com.first.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.first.service.board.BoardService;
import com.first.utill.MediaUtils;
import com.first.utill.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired
	BoardService bService;
	
	//업로드 디렉토리 servlet-context .xml 설정되어있는
	@Resource(name="uploadPath")
	String uploadPath;	
	@ResponseBody
	@RequestMapping(value="/upload/uploadAjax",produces="text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath,file.getOriginalFilename(),file.getBytes()),HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath+fileName);			
				fileName =fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("utf-8"),"iso-8859-1")+"\"");			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if(in!=null) {
				in.close();
			}
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping("/upload/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		log.info("fileName:"+fileName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		if(mType!=null) {
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			new File(uploadPath+(front+end).replace('/',File.separatorChar)).delete();
		}
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
