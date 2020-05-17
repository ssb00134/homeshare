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

	public static String saveUploadedFile(String uploadPath, String memId, int memNoCount, String fileName, byte[] data)
			throws IOException {

		// 파일의 갯수
		int fileLength = 0;
		fileLength = countFile(uploadPath, memId+File.separator + memNoCount);////path : memId+File.separator + memNoCount

		System.out.println(
				"FileUploadUtil.saveuploadfile 실행 " + "\n" + "memId 폴더의 파일 개수 : " + countFile(uploadPath, memId+File.separator + memNoCount));

		String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
		String saveName = memId + (fileLength / 2 + 1) + "." + extension;
		String savePath = getUploadPath(uploadPath, (memId + File.separator + memNoCount));
		/**/
		logger.info("uploadPath : " + uploadPath);
		logger.info("saveName :" + saveName);
		logger.info("savePath : " + savePath);
		getPath(uploadPath, memId);

		File target = new File(uploadPath + File.separator + savePath, saveName);
		System.out.println("target : " + target);
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

	// 폴더안에 파일이 있는지 확인하는 함수
	public static boolean isFile(String uploadPath, String memId) {
		String savePath = getUploadPath(uploadPath, memId);
		String path = uploadPath + "\\" + savePath;
		File f = new File(path);
		if (f.exists()) {
			System.out.println("파일 존재");
			return true;
		} else {
			System.out.println("파일 없음");
			return false;
		}

	}


	// 파일이 저장되는 폴더 이름을 날짜 형식(yyyy/MM/dd)으로 생성하기 위한 유틸
	private static String getUploadPath(String uploadPath, String path) { // path =memId+File.separator + memNoCount)
		makeDir(uploadPath, path);
		return path;
	}

	private static void makeDir(String uploadPath, String path) { // path = memId+File.separator + memNoCount)
		File dirPath = new File(uploadPath, path);
		if (!dirPath.exists()) {
			dirPath.mkdir();
			logger.info(dirPath.getPath() + " successfully created.");
		} else {
			logger.info(dirPath.getPath() + " already exists.");
		}
	}

	// 디렉토리를 삭제하는 함수
	private static void deleteDir(String uploadPath, String path) { // path = memId+File.separator + memNoCount)
		File folder = new File(uploadPath + File.separator + path);
		try {
			while (folder.exists()) {
				File[] folder_list = folder.listFiles(); // 파일리스트 얻어오기

				for (int j = 0; j < folder_list.length; j++) {
					folder_list[j].delete(); // 파일 삭제
					System.out.println("파일이 삭제되었습니다.");
				}
				if (folder_list.length == 0 && folder.isDirectory()) {
					folder.delete(); // 대상폴더 삭제
					System.out.println("폴더가 삭제되었습니다.");
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	// 파일의 개수를 구하는 함수
	public static int countFile(String uploadPath, String path){ //path : memId+File.separator + memNoCount
		File dirPath = new File(uploadPath, path);

		File[] files = dirPath.listFiles();
		return (files == null ? 0 : files.length);
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