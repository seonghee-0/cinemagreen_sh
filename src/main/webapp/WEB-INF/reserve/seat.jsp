<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="예매" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${contextPath}/static/css/reserve.css">

<div class="width_con">
		<div class="reserve_wrap">
				<h5 class="title">영화예매</h5>
				<div class="box_con rsv_seat">
					<div class="list_head">
		        <h5 class="sub_title line">인원선택 <span class="btm_txt">최대 4 까지 선택 가능</span></h5>
		      </div>
		     	<div class="list_body ">
		     	 <!-- <form action="#" id="rsv_seat" method="post"> -->
		     			<!-- 일반  -->
		     			<div class="t1">일반</div>
	     				<div class="list">
     						<input type="radio" id ="a0" class="rsv_type ticket custom" name="type1" value="0" data-no="0" checked>	
     						<label for="a0">0</label>
     						<input type="radio" id ="a1" class="rsv_type ticket custom" name="type1" value="1" data-no="0">
     						<label for="a1">1</label>
     						<input type="radio" id ="a2" class="rsv_type ticket custom" name="type1" value="2" data-no="0">	
     						<label for="a2">2</label>
	     					<input type="radio" id ="a3" class="rsv_type ticket custom" name="type1" value="3" data-no="0">	
	     					<label for="a3">3</label>
	     					<input type="radio" id ="a4" class="rsv_type ticket custom" name="type1" value="4" data-no="0">	
	     					<label for="a4">4</label>
	     					<!-- <input type="radio" id ="a5" class="rsv_type ticket custom" name="type1" value="5" data-no="0">	
	     					<label for="a5">5</label> -->
	     			 	</div>
	     			 	<!-- 청소년 -->
	     			 	<div class="t1">청소년</div>
	     				<div class="list">
	     					<input type="radio" id ="b0" class="rsv_type ticket custom" name="type2" value="0" data-no="1" checked>	
     						<label for="b0">0</label>
     						<input type="radio" id ="b1" class="rsv_type ticket custom" name="type2" value="1" data-no="1">
     						<label for="b1">1</label>
     						<input type="radio" id ="b2" class="rsv_type ticket custom" name="type2" value="2" data-no="1">	
     						<label for="b2">2</label>
	     					<input type="radio" id ="b3" class="rsv_type ticket custom" name="type2" value="3" data-no="1">	
	     					<label for="b3">3</label>
	     					<input type="radio" id ="b4" class="rsv_type ticket custom" name="type2" value="4" data-no="1">	
	     					<label for="b4">4</label>
	     					<!-- <input type="radio" id ="b5" class="rsv_type ticket custom" name="type2" value="5" data-no="1">	
	     					<label for="b5">5</label> -->
	     			 	</div>
	     			 	<!-- 우대 -->
	     			 	<div class="t1">우대</div>
	     				<div class="list">
	     					<input type="radio" id ="c0" class="rsv_type ticket custom" name="type3" value="0" data-no="2" checked>	
     						<label for="c0">0</label>
     						<input type="radio" id ="c1" class="rsv_type ticket custom" name="type3" value="1" data-no="2">
     						<label for="c1">1</label>
     						<input type="radio" id ="c2" class="rsv_type ticket custom" name="type3" value="2" data-no="2">	
     						<label for="c2">2</label>
	     					<input type="radio" id ="c3" class="rsv_type ticket custom" name="type3" value="3" data-no="2">	
	     					<label for="c3">3</label>
	     					<input type="radio" id ="c4" class="rsv_type ticket custom" name="type3" value="4" data-no="2">	
	     					<label for="c4">4</label>
	     					<!-- <input type="radio" id ="c5" class="rsv_type ticket custom" name="type3" value="5" data-no="2">	
	     					<label for="c5">5</label> -->
	     			 	</div>
							<div class="pay_area">  
              	<p class="tit_pay sub_title">결제금액</p>
                <div id="pay_money" class="result">
                <span id="totalamount"></span><span class="won">원 </span> 
                   <!--<p class="red"></p>
                     <input type="text" id="paymoney" name="paymoney" value="0" readonly> 원입니다. -->
                </div>
              </div>
					<!-- </form>  -->
						</div>
					</div>
					
					<div class="box_con rsv_seat">
						<div class="list_head">
			        <h5 class="sub_title line">좌석선택 <span class="btm_txt">좌석을 선택해주세요. </span></h5>
			      </div>
			      <div class="list_body " style="display:flex">
		      		<div class="seat_area">
			      		<%for(char c = 'A'; c <= 'F'; c++){ %>
			      			<span><%=c %></span>
			      			<% } %>
			      			<br>
			      			<% for(int i = 1; i <= 5; i++){ %> 
				      			<span><%=i %></span>
				      			<% for(char c = 'A'; c<= 'F'; c++){ %>
				      				<input id="<%=c%><%=i%>" type="checkbox" name="seat" value="<%=c%><%=i%>"><label for="<%=c%><%=i%>"><%=c%><%=i%></label>
				      			<%} %>
				      				<br>
				      				<%= i == 3 ? "<br/>" : "" %>
			      			<%} %>
				      </div>
				       <div id="chk_seat" class="-active" style="margin-left:20px;"></div>
				    </div>
				   
				    <div class="pay_area">
			      	<button id="payment_btn" type="submit" onclick="requestPay()">결제하기 </button>
			      </div>
					</div>
					
					<!-- <div class="modal_bg"></div>
	        <div id="reserve_modal" class="info_box">
	           <div class="info">
	               선택후
	               <div class="img"></div>
	               <div class="txt_notice ">
	                   <strong><span class="mvNm">&nbsp;</span></strong>
	                   <p> 선택하신 좌석은 <span class="chk_seat"></span> 입니다.</p>
	               </div>
	           </div>
	           <div class="next">
	           		 <button onclick="modalDel()" id="btnDel">취소</button>
	               <button id="payment_btn"  onclick="requestPay()">결제하</button>
	           </div>
	       </div> -->
			       
		    </div>
		</div>

<script>
	const ticket = document.getElementsByClassName("ticket");
	const result = document.getElementById('result');
	const paymoney = document.getElementById('paymoney');
	const payBtn = document.getElementById('payment_btn');
	const totalamount = document.getElementById('totalamount');
	const chk_seat = document.getElementById('chk_seat');
	
	payBtn.disabled = true; //결제 버튼 비활성화 
	$("input[name='seat']").prop("disabled", true); //좌석 비활성화 
	
	$('.list .ticket').on("change",function(){
		$("input[name='seat']").prop("checked", false); //선택 좌석 초기화

		$("input:disabled[name='seat']").prop("disabled",false); //좌석 활성화 
		payBtn.disabled = true; //결제 버튼 비활성화 
		
		var totalmoney = 0;
		var chkLen = $(".ticket").length;
		typeA = Number($("input[name='type1']:checked").val());
		typeB = Number($("input[name='type2']:checked").val());
		typeC = Number($("input[name='type3']:checked").val());
		totalCount = (typeA + typeB + typeC);
		
		maxCount = 4;
		Amoney = (typeA * 14000);
		Bmoney = (typeB * 11000);
		Cmoney = (typeC * 5000);		
		totalmoney = (Amoney + Bmoney + Cmoney);
		totalamount.innerText= totalmoney ;
		//paymoney.value = totalmoney;
		
		for(i=1; i<chkLen; i++){
			if($("input[name='type"+i+"']:checked").val() != undefined){
				

				if(totalCount > maxCount){
					$('#totalamount').addClass('red').text('선택 가능한 인원은 최대 4명 입니다.');
					$('.won').addClass('-active');
					$("input[name='type1']")[0].checked = true;
					$("input[name='type2']")[0].checked = true;
					$("input[name='type3']")[0].checked = true;
					$("input[name='seat']").prop("disabled", true);
				}else{
					$("input:disabled[name='seat']").prop("disabled",false); 
					$('.won').removeClass('-active');
					$('#totalamount').removeClass('red').text(totalmoney);
					totalamount.innerText = totalmoney;
				}
				
				// 좌석  
				$("input[name='seat']").on("click",function(){
					// console.log("선택 좌석 : " + chkSeat());
					let stcount = $("input:checked[name='seat']").length;
					if (stcount > totalCount){
						$(this).prop("checked",false); // evt.target
						alert(totalCount + '개 까지만 선택할 수 있습니다.')
					}else if(stcount == totalCount){
						payBtn.disabled = false; //결제 버튼 활성화 
						$('#chk_seat').removeClass('-active').text("선택하신 좌석은 " + chkSeat() + " 입니다.");
					}else if(stcount != totalCount){
						payBtn.disabled = true; //결제 버튼 비활성화
						$('#chk_seat').addClass('-active');
					}
				})
				

				
			}
		}
	})
	// 선택 좌석
	function chkSeat(){
			var chk_seat = [];
		$("input:checked[name='seat']").each(function(){
			var chk = $(this).val();
			chk_seat.push(chk);
		});
		return chk_seat;
	}
	
	
	// 주문번호 만들기
	function createMerchantNum(){
		const date = new Date();
		const year = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, "0");
		const day = String(date.getDate()).padStart(2, "0");
		
		let MerchantNum = year + month + day;
		for(let i=0;i<10;i++) {
			MerchantNum += Math.floor(Math.random() * 4);	
		}
		return MerchantNum;
	}
	//포트원 결제 (현재 값들은 임의로 넣어둔상태임.)
		var IMP = window.IMP; 
	  IMP.init("imp56805834"); 
    function requestPay() {
       IMP.request_pay({
	       pg: "html5_inicis.INIpayTest", // KG이니시스PG
	       pay_method: "card",
	       merchant_uid: createMerchantNum(),   // 주문번호
	       name: "시네그린",        
	       amount: totalamount.innerText,   // 
	       buyer_email: '${loginUser.email}',
	       buyer_name: '${loginUser.name}'
       }, function(rsp) { 
    	   console.log("실제 총 금액 : " + totalamount.innerText);
    	   console.log("결제 고유 번호 : " + rsp.imp_uid);
    	   console.log("결제 고유 번호 : " + rsp.merchant_uid);
    	   console.log("선택 좌석 : " + chkSeat());
    	   $.ajax({
						type: 'POST',
            url: '/payment/validation/' + rsp.imp_uid,
            dataType:"json",
            contentType:'application/json'
         }).done(function(data) {
		       		var pay = {
	         	    "payId": rsp.imp_uid,     // 결제 고유번호
	              "amount": rsp.paid_amount, 
	              "ticketNo" : rsp.merchant_uid
	            } 
		           if(rsp.paid_amount === data.response.amount){
		            	alert("결제를 완료하였습니다. 결제 완료페이지로 이동합니다.");
		            	$.ajax({
		              	type: 'POST',
		                //dataType:"json",
		                url: '/payment/complete',
		                contentType: "application/json",
		                data: JSON.stringify(pay),
		             	  success: function (rsp) {
		               		console.log("결제정보 저장 완료1");
		               		console.log(rsp);
		              		location.href = "/payment/complete";
		              	},
		           	 		error:function(request, status, error){
		            	 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		           			}
			           }).done(function(res) {
			           	console.log(" 완료2");
			            console.log(res);
			           });
		           } else {
		               alert("결제를 실패하였습니다." + rsp.error_msg);
		               
		           }
		       });
       });
   }
       /* 	if (rsp.success) {
	       		$.ajax({
	          type: 'POST',
	          url: '/payment/validation/' + rsp.imp_uid,
	          contentType: 'application/json',
	     			data: {
	              "imp_uid": rsp.imp_uid,
	              "merchant_uid": rsp.merchant_uid,
	              "paid_amount": rsp.paid_amount
	            }
              //data: JSON.stringify(data)
           	}).done(function(data) {
            	// 결제검증
             
             	alert("결제를 완료하였습니다. 결제 완료페이지로 이동합니다.");
              console.log(data.imp_uid.substring(4));
               location.replace('/payment/complete?imp_uid='+ data.imp_uid + '&paid_amount='+ data.paid_amount);
               //'/payment/complete/'+ rsp.imp_uid 적용 
               
             	// clg
               console.log("Payment success");
               console.log("Payment ID : " + rsp.imp_uid);
               console.log("Order ID : " + rsp.merchant_uid);
               console.log("Payment Amount : " + rsp.paid_amount);
          	 })
        	}else{
           	alert("결제 실패했습니다." + alert(rsp.error_msg));
           } 
       })
    }*/
    
    
 
	
 </script>

<%@ include file="../layout/footer.jsp" %>
