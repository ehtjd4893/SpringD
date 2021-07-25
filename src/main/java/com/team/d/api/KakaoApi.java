package com.team.d.api;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoApi {
		
	private final static String client_id ="9ab84d473da9b37db0b56a531ebd800d"; // REST API 키
	private final static String redirect_uri ="http://localhost:9090/d/kakao";
    
	public static String getRedirectURL() {
		return "https://kauth.kakao.com/oauth/authorize?"
			   + "client_id=" + client_id
			   + "&redirect_uri=" + redirect_uri
			   + "&response_type=code";
	}
    
	// 토큰 받아오기
	public JsonNode getAccessToken(String autorize_code) {
        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
        postParams.add(new BasicNameValuePair("client_id", client_id));
        postParams.add(new BasicNameValuePair("redirect_uri", redirect_uri));
        postParams.add(new BasicNameValuePair("code", autorize_code));
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
        JsonNode returnNode = null;
 
        try {
 
            post.setEntity(new UrlEncodedFormEntity(postParams));
            final HttpResponse response = client.execute(post);
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
        } catch(UnsupportedEncodingException e){
            e.printStackTrace();
        } catch(ClientProtocolException e){
            e.printStackTrace();
        } catch(IOException e){
            e.printStackTrace();
        } finally {
 
        }
        return returnNode;
    }
	
	// 사용자 정보 받아오기
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
	       final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
	       final HttpClient client = HttpClientBuilder.create().build();
	       final HttpPost post = new HttpPost(RequestUrl);
	 
	       // add header
	       post.addHeader("Authorization", "Bearer " + accessToken);
	       JsonNode returnNode = null;
	 
	       try {
	           final HttpResponse response = client.execute(post);
	           final int responseCode = response.getStatusLine().getStatusCode();
	           System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	           System.out.println("Response Code : " + responseCode);
	
	           // JSON 형태 반환값 처리
	           ObjectMapper mapper = new ObjectMapper();
	           returnNode = mapper.readTree(response.getEntity().getContent());
	 
	       } catch(ClientProtocolException e){
	           e.printStackTrace();
	       } catch (IOException e){
	           e.printStackTrace();
	       } finally {
	          
	       }
	       return returnNode;
	}
	
}
