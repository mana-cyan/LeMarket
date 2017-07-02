package com.lemarket.service.utils;

import org.springframework.stereotype.Service;

import java.io.*;

@Service
public class ImageFactory {

    public void saveFile(InputStream fileInputStream, String path) throws IOException {
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
