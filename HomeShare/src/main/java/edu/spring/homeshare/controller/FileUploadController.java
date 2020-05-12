package edu.spring.homeshare.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import edu.spring.homeshare.util.FileUploadUtil;
import edu.spring.homeshare.util.MediaUtil;

@Controller
public class FileUploadController {
	private static final Logger logger =
			LoggerFactory.getLogger(FileUploadController.class);
	
	// servlet-context.xml ���Ͽ� ������ ���ڿ� ���ҽ��� ����(inject)
	@Resource(name = "uploadPath")
	private String uploadPath;
	

	@RequestMapping(value="/file-upload-test", method = RequestMethod.GET)
	public void fileUploadTest() {
		logger.info("/homeshare/file-upload-test ȣ��" );
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public void uploadGet() {
		logger.info("uploadGet() ȣ��" + uploadPath);
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void uploadPost(MultipartFile file, Model model) {
		logger.info("uploadPost() ȣ��");
		logger.info("���� �̸� : " + file.getOriginalFilename());
		logger.info("���� ũ�� : " + file.getSize());
		
		String savedFile = saveUploadFile(file);
		model.addAttribute("savedFile", savedFile);
	}
	
	@RequestMapping(value = "/upload2", method = RequestMethod.POST)
	public String uploadPost2(MultipartFile[] files, Model model) {
		logger.info("uploadPost2() ȣ�� : ���� ���� = " + files.length);
		
		String result = "";
		for (MultipartFile f : files) {
			result += saveUploadFile(f) + " ";
		}
		model.addAttribute("savedFile", result);
		return "upload";
	}
	
	@RequestMapping(value = "/upload-ajax", 
			method = RequestMethod.GET)
	public void uploadAjaxGET() {
		logger.info("uploadAjaxGET() ȣ��");
	}
	
	@RequestMapping(value = "/upload-ajax", 
			method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> uploadAjaxPOST(MultipartFile[] files,HttpServletRequest req) throws IOException {
		logger.info("uploadAjaxPOST() ȣ��");
		
		//���� ���̵� ��������
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("memId"); //���ǿ��� ���̵� ��������
		logger.info("���ǰ� : " + memId);
		
		// ���� �ϳ��� ����
		String result = null;
		result = FileUploadUtil.saveUploadedFile(
				uploadPath, 
				memId,
				files[0].getOriginalFilename(), 
				files[0].getBytes());
		
		int filelength  = FileUploadUtil.countFile(uploadPath, memId);
		logger.info("���� ���� : " + filelength);
		for(int i =0; i<filelength; i++) {
			logger.info("getpath2 : " + FileUploadUtil.getPath2(uploadPath, memId, i));
		}
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
	
	@RequestMapping(value="getpath",method = RequestMethod.GET)
	public ResponseEntity<String> getPath(HttpServletRequest req){
		
		//���� ���̵� ��������
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("memId"); //���ǿ��� ���̵� ��������
		logger.info("���ǰ� : " + memId);
		
		//���ϱ���
		int filelength = FileUploadUtil.countFile(uploadPath, memId);
		
		String strings = null;
		for(int i =0; i<filelength; i++) {
			 strings += FileUploadUtil.getPath2(uploadPath, memId, i) + ",";
		}
		
		return new ResponseEntity<String>(strings,HttpStatus.OK);
	}
	
	
	
	
	
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(String fileName) throws IOException {
		logger.info("display() ȣ��");
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		
		String filePath = uploadPath + fileName;
		in = new FileInputStream(filePath);
		
		// ���� Ȯ����
		String extension = 
				filePath.substring(filePath.lastIndexOf(".") + 1);
		
		// ���� ���(response header)�� Content-Type ����
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaUtil.geMediaType(extension));
		
		// ������ ����
		entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), // ���Ͽ��� ���� ������
					httpHeaders, // ���� ���
					HttpStatus.OK // ���� �ڵ�
				);
		return entity;
	}

	private String saveUploadFile(MultipartFile file) {
		// UUID : ���ε��ϴ� ���� �̸��� �ߺ����� �ʵ���
		UUID uuid = UUID.randomUUID();
		String savedName = uuid + "_" + file.getOriginalFilename();
		File target = new File(uploadPath, savedName); // ������ ���� ��ü ����
		
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			logger.info("���� ���� ���� : " + savedName);
			return savedName;
		} catch (IOException e) {
			logger.error("���� ���� ����");
			return null;
		}
	}


}















