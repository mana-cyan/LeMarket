package com.lemarket.service.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import edu.fudan.nlp.cn.tag.CWSTagger;

public class WordSegmentation {

    /**
     * 分词
     * @param sentence 句子
     * @return wordList
     */
    public static List<String> getWord(String sentence)throws Exception{


        CWSTagger tag = new CWSTagger(getRoot()+"/WEB-INF/classes/models/seg.m");
        String s = tag.tag(sentence);
        String words[] = s.split(" ");
        List<String> wordList = new ArrayList<>();
        wordList.addAll(Arrays.asList(words));
        return wordList;
    }

    private static String getRoot()
    {
        String result = WordSegmentation.class.getResource("WordSegmentation.class").toString();
        int index = result.indexOf("WEB-INF");
        if(index == -1){
            index = result.indexOf("bin");
        }
        result = result.substring(0,index);
        if(result.startsWith("jar")){
            // 当class文件在jar文件中时，返回"jar:file:/F:/ ..."样的路径
            result = result.substring(10);
        }else if(result.startsWith("file")){
            // 当class文件在class文件中时，返回"file:/F:/ ..."样的路径
            result = result.substring(6);
        }
        if(result.endsWith("/"))result = result.substring(0,result.length()-1);//不包含最后的"/"
        return result;
    }
}
