package edu.spring.homeshare.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.memberVO;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.util.FileUploadUtil;
import edu.spring.homeshare.util.MediaUtil;

@Controller
public class FileUploadController {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

	// servlet-context.xml 파일에 설정된 문자열 리소스를 주입(inject)
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private HouseService houseService;
	

	@RequestMapping(value = "/file-upload-test", method = RequestMethod.GET)
	public void fileUploadTest() {
		logger.info("/homeshare/file-upload-test 호출");
	}

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public void uploadGet() {
		logger.info("uploadGet() 호출" + uploadPath);
	}



	@RequestMapping(value = "/upload-ajax", method = RequestMethod.GET)
	public void uploadAjaxGET() {
		logger.info("uploadAjaxGET() 호출");
	}

	@RequestMapping(value = "/upload-ajax", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> uploadAjaxPOST(MultipartFile[] files, HttpServletRequest req) throws Exception {
		logger.info("uploadAjaxPOST() 호출");

		// 세션 아이디 가져오기
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("memId"); // 세션에서 아이디 가져오기
		logger.info("세션값 : " + memId);
		
		//세션 vo 가져오기
		int memNo = (int) session.getAttribute("memNo");
		logger.info("memno 세션값 : " + memNo);
		int memNoCount = houseService.getCountByMemNo(memNo);
		logger.info("memno가 세션memno인 하우스 갯수 : " + memNoCount);
		
		
		int filelength = FileUploadUtil.countFile(uploadPath, memId);
		logger.info("파일 갯수 : " + filelength);
		String fail = "not more 5 items";
		
		logger.info("파일 존재? : " +FileUploadUtil.isFile(uploadPath, memId));
		//logger.info("등록된 memno의 갯수 : " + houseService.selectByHouseNo(houseNo));
		
		if (filelength < 10) { // 파일이 5개 이하일때만 실행
			// 파일 하나만 저장
			String result = null;
			result = FileUploadUtil.saveUploadedFile(uploadPath, memId,memNoCount, files[0].getOriginalFilename(),
					files[0].getBytes());
			logger.info("result 값 : " + result.toString());
			for (int i = 0; i < filelength; i++) {
				logger.info("getpath2 : " + FileUploadUtil.getPath2(uploadPath, memId, i));
			}
			logger.info("result.tostring : " + result.toString() );
			 
			return new ResponseEntity<String>(result, HttpStatus.OK);
		} else
			return new ResponseEntity<String>(fail, HttpStatus.OK);
	}
	// end upload ajax


	
	
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(String fileName,HttpServletRequest req) throws IOException, FileNotFoundException {
		try {
			logger.info("display() 호출");

			ResponseEntity<byte[]> entity = null;
			InputStream in = null;

			String filePath = uploadPath + fileName;
			in = new FileInputStream(filePath);
			
			
			// 세션 아이디 가져오기
			HttpSession session = req.getSession();
			String memId = (String) session.getAttribute("memId"); // 세션에서 아이디 가져오기
			logger.info("세션값 : " + memId);
			//파일 갯수 
			int filelength = FileUploadUtil.countFile(uploadPath, memId);
			
			// 파일 확장자
			String extension = filePath.substring(filePath.lastIndexOf(".") + 1);

			// 응답 헤더(response header)에 Content-Type 설정
			HttpHeaders httpHeaders = new HttpHeaders();
			httpHeaders.setContentType(MediaUtil.geMediaType(extension));

			// 데이터 전송
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), // 파일에서 읽은 데이터
					httpHeaders, // 응답 헤더
					HttpStatus.OK // 응답 코드
			);
			logger.info("display entity : " + entity.toString());
			
			//파일의 개수가 5개 이상이면 null을 출력함
			return (filelength <=10 ? entity : null);
		} catch (Exception e) {
			logger.info("filenotFound 발생");
			return null;
		}
	}



}
