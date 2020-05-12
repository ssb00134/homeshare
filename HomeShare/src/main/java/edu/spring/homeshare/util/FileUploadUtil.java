package edu.spring.homeshare.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class FileUploadUtil {

	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtil.class);

	public static String saveUploadedFile(String uploadPath, String memId, String fileName, byte[] data)
			throws IOException {

		// 파일의 갯수
		int fileLength=0;
		fileLength= countFile(uploadPath, memId);

		System.out.println("memId 폴더의 파일 개수 : " + countFile(uploadPath, memId));

		String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
		String saveName = memId + fileLength + "." + extension;
		String savePath = getUploadPath(uploadPath, memId);

		logger.info("uploadPath : " + uploadPath);
		logger.info("saveName :" + saveName);
		logger.info("savePath : " + savePath);
		getPath(uploadPath, memId);

		File target = new File(uploadPath + File.separator + savePath, saveName);
		FileCopyUtils.copy(data, target);

		String result = null;
		if (MediaUtil.geMediaType(extension) != null) {
			result = createThumbnail(uploadPath, savePath, saveName);
		} else {
			result = createIcon(uploadPath, savePath, saveName);
		}

		return result;
	}

	// 파일의 경로를 구하는 함수
	public static void getPath(String uploadPath, String memId) {
		String savePath = getUploadPath(uploadPath, memId);
		String path = uploadPath + "\\" + savePath;

		File files = new File(path);
		File[] fileList = files.listFiles();

		if (fileList.length > 0) {
			for (int i = 0; i < fileList.length; i++) {
				System.out.println(fileList[i]);
			}
		}
	}
	//tostring
	public static String getPath2(String uploadPath,String memId, int i) {
		String savePath = getUploadPath(uploadPath,memId);
		String path = uploadPath + "\\" + savePath;
		
		File files = new File(path);
		File[] fileList = files.listFiles();
		
	
		return  fileList[i].toString() ;	  		
		
	}

	// 파일이 저장되는 폴더 이름을 날짜 형식(yyyy/MM/dd)으로 생성하기 위한 유틸
	private static String getUploadPath(String uploadPath, String memId) {
		makeDir(uploadPath, memId);
		return memId;
	}

	private static void makeDir(String uploadPath, String memId) {
		File dirPath = new File(uploadPath, memId);
		if (!dirPath.exists()) {
			dirPath.mkdir();
			logger.info(dirPath.getPath() + " successfully created.");
		} else {
			logger.info(dirPath.getPath() + " already exists.");
		}
	}

	// 파일의 개수를 구하는 함수
	public static int countFile(String uploadPath, String memId) {
		File dirPath = new File(uploadPath, memId);

		File[] files = dirPath.listFiles();
		return files.length;
	}

	private static String createThumbnail(String uploadPath, String savePath, String fileName) throws IOException {

		String parent = uploadPath + File.separator + savePath;
		BufferedImage source = ImageIO.read(new File(parent, fileName));
		BufferedImage destination = Scalr.resize(source, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		String thumbnailName = uploadPath + File.separator + savePath + File.separator + "s_" + fileName;
		File thumbnail = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf('.') + 1);

		boolean result = ImageIO.write(destination, formatName, thumbnail);
		logger.info("create thumbnail result: " + result);

		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	private static String createIcon(String uploadPath, String savePath, String fileName) {

		String iconName = uploadPath + File.separator + savePath + File.separator + fileName;

		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');

	}

}