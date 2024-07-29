package com.min.cinemagreen.service;

import java.io.IOException;
import java.util.Map;

import com.min.cinemagreen.dto.PaymentDTO;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

public interface IPaymentService {

  //IamportResponse<Payment> getPaymentInfo(String imp_uid, String paid_amount) throws IamportResponseException, IOException ;
  //int payInsert(String imp_uid);
  int payInsert(Map <String,Object> pay);
  String getToken() throws IOException;
  IamportResponse<Payment> getPaymentInfo(String imp_uid, String token) throws IamportResponseException, IOException;
  PaymentDTO getPayinfo(String imp_uid);


}
