/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;

/**
 *
 * @author dovan
 */
public class Utils {

   

    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
//        sb.substring(1);
        return sb.toString();
    }

    private String crawlData(String path) {
        String baseApi =  path;
        String dataCrawl = "";
        try {
            InputStream inputStream = new URL(baseApi).openStream();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, Charset.forName("UTF-8")));
            dataCrawl = readAll(bufferedReader);
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return dataCrawl;
    }
    
     public  Object convertToObject(String api, TypeToken token) {
        Gson gson = new Gson();
        Object result = gson.fromJson(crawlData(api), token.getType());
        return result;
    }
}
