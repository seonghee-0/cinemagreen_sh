package com.min.cinemagreen.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.min.cinemagreen.dto.PaymentDTO;
import com.min.cinemagreen.mapper.IPaymentMapper;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Transactional
@Service
public class PaymentServiceImpl implements IPaymentService {

  
  private final IPaymentMapper paymentMapper;
  
  @Value("${imp.api.key}")
  private String apiKey;
 
  @Value("${imp.api.secretkey}")
  private String secretKey;
  
  private IamportClient iamportClient;
  
  //private PrePaymentRepository prePaymentRepository;
  public void PaymentService() {
    this.iamportClient = new IamportClient("6848584747520311", "NvwsO9QDV9fzxqFpF5KmqoPpz1O9lUOM5MIKou6kKikg46ivyWoK6y7oAMGX83xf1KdOCrJxQufBsPbu");
  }
  

 //토큰 생성
 @Override
 public String getToken() throws IOException {

   HttpsURLConnection conn = null;

   URL url = new URL("https://api.iamport.kr/users/getToken");

   conn = (HttpsURLConnection) url.openConnection();

   conn.setRequestMethod("POST");
   conn.setRequestProperty("Content-type", "application/json");
   conn.setRequestProperty("Accept", "application/json");
   conn.setDoOutput(true);
   JsonObject json = new JsonObject();

   json.addProperty("imp_key", "6848584747520311");
   json.addProperty("imp_secret", "NvwsO9QDV9fzxqFpF5KmqoPpz1O9lUOM5MIKou6kKikg46ivyWoK6y7oAMGX83xf1KdOCrJxQufBsPbu");

   BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

   bw.write(json.toString());
   bw.flush();
   bw.close();

   BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

   Gson gson = new Gson();

   String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();

   System.out.println("response : " + response);

   String token = gson.fromJson(response, Map.class).get("access_token").toString();

   br.close();
   conn.disconnect();

   System.out.println(token);
   return token;
 }
 
  
  // 결제 정보 
  @Override
  public IamportResponse<Payment> getPaymentInfo(String imp_uid, String token) throws IamportResponseException, IOException{
   IamportResponse<Payment> response = iamportClient.paymentByImpUid(imp_uid);
   URL url = new URL("https://api.iamport.kr/users/getToken");
   HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

   // 요청 방식 설정
   conn.setRequestMethod("POST");

   // 요청의 Content-Type, Accept, Authorization 헤더 설정
   conn.setRequestProperty("Content-type", "application/json");
   conn.setRequestProperty("Accept", "application/json");
   conn.setRequestProperty("Authorization", token);
   conn.setRequestProperty("Access-Control-Allow-Origin", "http://localhost:9090");

   // 해당 연결을 출력 스트림(요청)으로 사용
   conn.setDoOutput(true);
   
   // JSON 객체에 해당 API가 필요로하는 데이터 추가.
   JsonObject json = new JsonObject();
   json.addProperty("imp_uid", imp_uid);
   
   System.out.println(token);
   return response;
  }
  
//  //결제 정보 불러오기
//  public String getPaymentInfo(String imp_uid, String access_token) throws IOException, ParseException {
//    HttpsURLConnection conn = null;
//
//    URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
//
//    conn = (HttpsURLConnection) url.openConnection();
//
//    conn.setRequestMethod("GET");
//    conn.setRequestProperty("Authorization", access_token);
//    conn.setDoOutput(true);
//
//    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
//
//    JSONParser parser = new JSONParser();
//
//    JSONObject p = (JSONObject) parser.parse(br.readLine());
//    
//    String response = p.get("response").toString();
//    
//    p = (JSONObject) parser.parse(response);
//    
//    String amount = p.get("amount").toString();
//    return amount;
//  }

  // 결제 취소
  public void cancelPayment(String imp_uid) throws IamportResponseException, IOException {
    
   CancelData cancelData = new CancelData(imp_uid,true);
   iamportClient.cancelPaymentByImpUid(cancelData);
  }


  @Override
  public int payInsert(Map<String, Object> pay) {
    return paymentMapper.insertPay(pay);
  }



  @Override
  public PaymentDTO getPayinfo(String imp_uid) {
    // TODO Auto-generated method stub
    return null;
  }















  
}