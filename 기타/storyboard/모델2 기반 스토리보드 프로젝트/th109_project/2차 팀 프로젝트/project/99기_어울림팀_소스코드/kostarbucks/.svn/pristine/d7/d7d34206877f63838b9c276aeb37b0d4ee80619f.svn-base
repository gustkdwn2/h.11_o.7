package edu.kosta.kostarbucks.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class SmartController {
		
	@RequestMapping(value = "/submit.do", method = RequestMethod.POST)
	public String submit(Locale locale, Model model, HttpServletRequest request){
		String ir1 = request.getParameter("ir1");
		model.addAttribute("ir1", ir1);
		
		return "editor";
	}
	
	//단일파일업로드
	@RequestMapping(value = "/photoUpload.do", method = RequestMethod.POST)
	public String photoUpload(HttpServletRequest request, @RequestParam("Filedata") MultipartFile file_data,@RequestParam("callback") String callback, @RequestParam("callback_func") String callback_func){
	    String file_result = "";
	    try {
	        if(file_data != null && file_data.getOriginalFilename() != null){
	            //파일이 존재하면
	            String original_name = file_data.getOriginalFilename();//파일 이름
	            String filename_extension = original_name.substring(original_name.lastIndexOf(".")+1);//파일 확장자
	            filename_extension = filename_extension.toLowerCase();//확장자를 소문자로 변경
	            //파일 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");//서버기본경로(프로젝트폴더까지: 서버내의 해당경로에 저장되는 것임)
	            //파일 기본경로 _ 상세경로
	            String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator; //파일 저장 경로             
	            
	            File file = new File(path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	            String today = formatter.format(new java.util.Date());
	            
	            //
	            String modify_name = today + "-" + UUID.randomUUID().toString().substring(20) + "." + filename_extension;
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            
	            //서버에 이미지 저장(쓰기)
	            ///////////////// 서버에 파일쓰기 ///////////////// 
	            file_data.transferTo(new File(path+modify_name));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/kostarbucks/resource/photo_upload/"+modify_name;
	        
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+ callback_func + file_result;
	}
	
	//다중파일업로드
	@RequestMapping(value = "/multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
		try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_extension = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_extension = filename_extension.toLowerCase();
	         //파일 기본경로
	         String defaultPath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;
	         File file = new File(path);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         
	         //서버에 업로드할 파일명 변경(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	         String modify_name = today + "-" + UUID.randomUUID().toString().substring(20) + "." + filename_extension;
	         
	         ///////////////// 서버에 파일쓰기 ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(path + modify_name);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/kostarbucks/resource/photo_upload/"+modify_name;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	         
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
