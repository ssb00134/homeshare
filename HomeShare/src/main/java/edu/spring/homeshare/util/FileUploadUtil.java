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

	private static final Logger logger =
			LoggerFactory.getLogger(FileUploadUtil.class);
	
	public static String saveUploadedFile(String uploadPath,
			String memId,
			String fileName, byte[] data) throws IOException {
		
		//파일의 갯수
		int fileLength = countFile(uploadPath, memId);
		
		System.out.println("memId 폴더의 파일 개수 : " + countFile(uploadPath, memId));
		
		String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		String saveName = memId + "_" +fileLength + "." + extension;
		
		String savePath = getUploadPath(uploadPath,memId);
		
		File target = new File(uploadPath + File.separator + savePath,
				saveName);
		
		FileCopyUtils.copy(data, target);
		
		
		
		String result = null;
		if (MediaUtil.geMediaType(extension) != null) {
			result = createThumbnail(uploadPath, savePath, saveName);
		} else {
			result = createIcon(uploadPath, savePath, saveName);
		}
		
		return result;
	}
	
	// 파일이 저장되는 폴더 이름을 날짜 형식(yyyy/MM/dd)으로 생성하기 위한 유틸
	// 상위 폴더가 생성되어 있지 않으면 하위 폴더를 생성할 수 없다
	// -> 연도 폴더 생성 -> 달 폴더 생성 -> 날짜 폴더 생성
	// 마지막 리턴은 yyyy/MM/dd 형식으로
	private static String getUploadPath(String uploadPath,String memId) {
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
	//파일의 개수를 구하는 함수
	public static int countFile(String uploadPath, String memId) {
		File dirPath = new File(uploadPath, memId);
		
		File[] files = dirPath.listFiles();
		return files.length;
	}
	
	//n번째 파일 가져오는 함수
	public File getFile(String uploadPath, String memId,int i) {
		File dirPath = new File(uploadPath, memId);
		File[] files = dirPath.listFiles();
		return files[i];
	}

	private static String createThumbnail(String uploadPath,
			String savePath, String fileName) throws IOException {
		
		String parent = uploadPath + File.separator + savePath;
		BufferedImage source = 
				ImageIO.read(new File(parent, fileName));
		BufferedImage destination = 
				Scalr.resize(source, Scalr.Method.AUTOMATIC, 
						Scalr.Mode.FIT_TO_HEIGHT, 100);
		String thumbnailName = 
				uploadPath + File.separator 
				+ savePath + File.separator
				+ "s_" + fileName;
		File thumbnail = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf('.') + 1);
		
		boolean result = ImageIO.write(destination, formatName, thumbnail);
		logger.info("create thumbnail result: " + result);
		
		return thumbnailName.substring(uploadPath.length())
				.replace(File.separatorChar, '/');
	}
	
	private static String createIcon(String uploadPath,
			String savePath, String fileName) {
		
		String iconName = uploadPath + File.separator 
				+ savePath + File.separator + fileName;
		
		return iconName
				.substring(uploadPath.length())
				.replace(File.separatorChar, '/');
		
	}
	
}