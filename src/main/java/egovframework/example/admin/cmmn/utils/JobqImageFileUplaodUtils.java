package egovframework.example.admin.cmmn.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class JobqImageFileUplaodUtils {
	private static final Logger logger = LoggerFactory.getLogger(JobqImageFileUplaodUtils.class);
	private final String DEFAULT_LOGO_DIR_PATH = "C:\\jobq_logo_file";
	
	public String uploadImageFile(String imgFileOriginalName, byte[] fileData) throws Exception{
		UUID uuid = UUID.randomUUID();
		
		String imgFileName = uuid.toString() + "_" + imgFileOriginalName;
		
		String dirPath = calculateDirPath();
		
		File file = new File(DEFAULT_LOGO_DIR_PATH + dirPath, imgFileName);	// 파일 클래스를 통해서는 경로와의 스트림을 생성한다.
		
		FileCopyUtils.copy(fileData, file);
		
		String uploadedFileFullName = makeThumbnail(dirPath, imgFileName);
		
		return uploadedFileFullName;
	}
	
	private String calculateDirPath() throws Exception{
		Calendar calendar = Calendar.getInstance();
		DecimalFormat dateFormat = new DecimalFormat("00");
		
		String yearDirPath = File.separator + calendar.get(Calendar.YEAR);
		String monthDirPath = yearDirPath + File.separator + dateFormat.format(calendar.get(Calendar.MONTH) + 1);
		String dateDirPath = monthDirPath + File.separator + dateFormat.format(calendar.get(Calendar.DATE));
		
		makeDirectory(DEFAULT_LOGO_DIR_PATH, yearDirPath, monthDirPath, dateDirPath);
		logger.info(dateDirPath);
		
		return dateDirPath;
	}
	
	private void makeDirectory(String... paths) throws Exception{
		for(String dirPath : paths){
			File dir = new File(DEFAULT_LOGO_DIR_PATH + dirPath);
			
			if(!dir.exists())
				dir.mkdir();
		}
	}
	
	private String makeThumbnail(String dirPath, String fileName) throws Exception{
		BufferedImage srcImg = ImageIO.read(new File(DEFAULT_LOGO_DIR_PATH + dirPath, fileName));	// 이미지 파일을 읽어온다.
		BufferedImage dstImg = 	Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, 160, 100, Scalr.OP_ANTIALIAS);
		
		String thumbnailName = DEFAULT_LOGO_DIR_PATH + dirPath + File.separator + "s_" + fileName;
		
		File thumbnailFile = new File(thumbnailName);
		String imgFormat = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		ImageIO.write(dstImg, imgFormat.toUpperCase(), thumbnailFile);	// thumbnailFile의 파일경로에 dstImg를 imgFormat타입으로 만든다.
		return thumbnailName.substring(DEFAULT_LOGO_DIR_PATH.length()).replace(File.separatorChar, '/');
	}
	
}
