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
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

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
        String baseApi = path;
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

    public Object convertToObject(String api, TypeToken token) {
        Gson gson = new Gson();
        Object result = gson.fromJson(crawlData(api), token.getType());
        return result;
    }
    
    

    public void excutePost(String api) {
        CloseableHttpClient httpclient = HttpClients.createDefault();

        HttpPost httpPost = new HttpPost(api);
        CloseableHttpResponse response2 = null;
        try {
            response2 = httpclient.execute(httpPost);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                response2.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
    public void excuteGet(String api) {
        CloseableHttpClient httpclient = HttpClients.createDefault();

        HttpGet httpGet = new HttpGet(api);
        CloseableHttpResponse response2 = null;
        try {
            response2 = httpclient.execute(httpGet);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                response2.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
