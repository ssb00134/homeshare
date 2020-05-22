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

	// servlet-context.xml ���Ͽ� ������ ���ڿ� ���ҽ��� ����(inject)
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Resource(name="MockUploadPath")
	private String MockUploadPath;
	
	@Autowired
	private HouseService houseService;
	

	@RequestMapping(value = "/file-upload-test", method = RequestMethod.GET)
	public void fileUploadTest() {
		logger.info("/homeshare/file-upload-test ȣ��");
	}




	@RequestMapping(value = "/upload-ajax", method = RequestMethod.GET)
	public void uploadAjaxGET() {
		logger.info("uploadAjaxGET() ȣ��");
	}

	@RequestMapping(value = "/upload-ajax", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> uploadAjaxPOST(MultipartFile[] files, HttpServletRequest req) throws Exception {
		logger.info("uploadAjaxPOST() ȣ��");

		// ���� ���̵� ��������
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("memId"); // ���ǿ��� ���̵� ��������
		logger.info("���ǰ� : " + memId);
		
		//���� vo ��������
		int memNo = (int) session.getAttribute("memNo");
		logger.info("memno ���ǰ� : " + memNo);
		int memNoCount = houseService.getCountByMemNo(memNo);
		logger.info("memno�� ����memno�� �Ͽ콺 ���� : " + memNoCount);
		
		
		int filelength = FileUploadUtil.countFile(uploadPath, memId+File.separator + memNoCount);//path = memId+File.separator + memNoCount
		logger.info("���� ���� : " + filelength);
		String fail = "not more 10 items";
		
		logger.info("���� ����? : " +FileUploadUtil.isFile(uploadPath, memId));
		//logger.info("��ϵ� memno�� ���� : " + houseService.selectByHouseNo(houseNo));
		
		if (filelength < 20) { // ������ 10�� �����϶��� ����
			// ���� �ϳ��� ����
			String result = null;
			logger.info("filelength : " + filelength);
			result = FileUploadUtil.saveUploadedFile(uploadPath, memId,memNoCount, files[0].getOriginalFilename(),
					files[0].getBytes());
			logger.info("result �� : " + result.toString());

			 
			return new ResponseEntity<String>(result, HttpStatus.OK);
		} else
			return new ResponseEntity<String>(fail, HttpStatus.OK);
	}
	// end upload ajax
	
	/* ��¥ MockUploadPath */
	@RequestMapping(value = "/mock-upload-ajax", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> MockuploadAjaxPOST(MultipartFile[] files, HttpServletRequest req) throws Exception {
		logger.info("Mock uploadAjaxPOST() ȣ��");

		// ���� ���̵� ��������
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("memId"); // ���ǿ��� ���̵� ��������
		logger.info("���ǰ� : " + memId);
		
		//���� vo ��������
		int memNo = (int) session.getAttribute("memNo");
		logger.info("memno ���ǰ� : " + memNo);
		//memnocount : ��ϵ� ��ȣ
		int memNoCount = houseService.getCountByMemNo(memNo);
		//memno�� �Ͽ콺no ��������
		
		//int houseNo = houseService.sele;
		logger.info("memno�� ����memno�� �Ͽ콺 ���� : " + memNoCount);
		
		/* ���� �ʱ�ȭ
		 * memid���� ��� ������ �����Ѵ�.
		 * */
		FileUploadUtil.deleteDir( MockUploadPath + File.separator + memId);
		
		int filelength = FileUploadUtil.countFile(MockUploadPath, memId+File.separator + memNoCount);//path = memId+File.separator + memNoCount
		logger.info("���� ���� : " + filelength);
		String fail = "not more 5 items";
		
		logger.info("���� ����? : " +FileUploadUtil.isFile(MockUploadPath, memId));
		//logger.info("��ϵ� memno�� ���� : " + houseService.selectByHouseNo(houseNo));
		
		if (filelength < 20) { // ������ 10�� �����϶��� ����
			// ���� �ϳ��� ����
			String result = null;
			logger.info("filelength : " + filelength);
			result = FileUploadUtil.saveUploadedFile(MockUploadPath, memId,memNoCount, files[0].getOriginalFilename(),
					files[0].getBytes());
			logger.info("result �� : " + result.toString());

			 
			return new ResponseEntity<String>(result, HttpStatus.OK);
		} else
			return new ResponseEntity<String>(fail, HttpStatus.OK);
	}
	// end upload ajax


	
	
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(String fileName,HttpServletRequest req) throws IOException, FileNotFoundException {
		try {
			logger.info("display() ȣ��");

			ResponseEntity<byte[]> entity = null;
			InputStream in = null;

			String filePath = uploadPath + fileName;
			in = new FileInputStream(filePath);
			
			// ���� Ȯ����
			String extension = filePath.substring(filePath.lastIndexOf(".") + 1);

			// ���� ���(response header)�� Content-Type ����
			HttpHeaders httpHeaders = new HttpHeaders();
			httpHeaders.setContentType(MediaUtil.geMediaType(extension));

		
			
			// ������ ����
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), // ���Ͽ��� ���� ������
					httpHeaders, // ���� ���
					HttpStatus.OK // ���� �ڵ�
			);
			logger.info("display entity : " + entity.toString());
			
			
			return entity ;
		} catch (Exception e) {
			logger.info("filenotFound �߻�");
			return null;
		}
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void delete(
			String path) { // ��θ� �Ű������� �޴´�
		logger.info("delete ���� ");
		FileUploadUtil.deleteDir(path);
		
	}



}
