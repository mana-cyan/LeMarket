package com.lemarket.service.utils;

import com.lemarket.data.reponseObject.Status;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Date;

@Service
public class ImageFactory {

    public String saveFile(MultipartFile multipartFile, HttpSession session) throws IOException {
        if(multipartFile.getSize()>0){
            String fileName = multipartFile.getOriginalFilename();
            if(fileName.endsWith(".png") || fileName.endsWith(".jpg") || fileName.endsWith(".gif")){
                String uploadPath = "/static/upload/";
                String path = session.getServletContext().getRealPath(uploadPath);
                String[] splits = fileName.split(".");
                String newFileName = new Date().toString() + "." + splits[splits.length-1];
                //写入新图标
                writeFile(multipartFile.getInputStream(), path + newFileName);
                return uploadPath+newFileName;
            }
        }
        return "ERROR";
    }


    private void writeFile(InputStream fileInputStream, String path) throws IOException {
        File newFile = new File(path);
        if(!newFile.exists())
            newFile.createNewFile();
        BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(newFile));
        byte buffer[] = new byte[1024*4];
        int size;
        while ((size = bufferedInputStream.read(buffer)) > 0){
            bufferedOutputStream.write(buffer, 0, size);
        }
        bufferedInputStream.close();
        bufferedOutputStream.close();
    }

    public void deleteFile(String path){
        File file = new File(path);
        if(file.exists())
            file.delete();
    }
}
