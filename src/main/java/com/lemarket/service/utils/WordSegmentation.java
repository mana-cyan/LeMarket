package com.lemarket.service.utils;

import java.util.ArrayList;
import java.util.List;
import edu.fudan.nlp.cn.tag.CWSTagger;

public class WordSegmentation {

    /**
     * 分词
     * @param sentence
     * @return wordList
     */
    public static List<String> getWord(String sentence)throws Exception{
        CWSTagger tag = new CWSTagger("./models/seg.m");
        String s = tag.tag(sentence);
        String words[] = s.split(" ");
        List<String> wordList = new ArrayList<>();
        for(int i=0;i<words.length;i++){
            wordList.add(words[i]);
        }
        return wordList;
    }
}
