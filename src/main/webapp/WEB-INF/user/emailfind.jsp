<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="emainFind" name="title"/>
</jsp:include>
<style>
  .dead-btn{cursor: default; pointer-events: none;}
  .sections.section_emailfind .width_con .title_con h4{ position: relative; transform: translateX(100%); transition: inherit;}
  .sections.section_emailfind .width_con .emailfind form{ position: relative; transform: translateX(42%); transition: inherit;}

</style>

<div class="wrap">
  <div class="sections section_emailfind">
    <div class="width_con">
      <div class="title_con white emailfind">
        <h4 class="title">이메일 찾기</h4><br>
        <form id="emailfind-form">
          <input type="hidden" name="url" value="${url}">
          <div>
            <input type="text" name="mobile" id="mobile" placeholder="휴대전화">
            <h6></h6>
            <div id=""></div>
          </div>
          <div>
            <button type="button" id="submit" >이메일 찾기</button>
            <button type="button" onclick="signinGo()">로그인 하러가기</button>
          </div>
          <div id="email-div"></div>
        </form>
      </div>
    </div>
  </div>
 
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

<script>
  

  const fnEmailfind = () => {
    $.ajax({
      type: 'post',
      url: '${contextPath}/user/emailfind.do',
      data: $('#emailfind-form').serialize(),
      dataType: 'json'
    }).done(resData => {
      if (resData.email != null) {
        const emailDiv = document.getElementById('email-div');
        
        emailDiv.innerHTML = '<h5><b> 회원님의 이메일은 : <br>' + resData.email + '입니다 </h5>';
        
      } else {
        alert('휴대전화번호를 확인해 주세요.');
      }
    }).fail(jqXHR => {
      alert('휴대전화번호를 확인해 주세요.');
    });
  }
  
  $('#submit').on('click', evt=>{
    fnEmailfind();
  })
  
  const signinGo = () => {
    
    location.href = "${contextPath}/user/signin.page";
    
  };
  
  $(document).on("keypress", "#emailfind-form", evt=>{
    if (evt.which === 13) { // 13은 엔터 키 코드
        evt.preventDefault(); // 기본 동작 방지
    }
  });


</script>

<%@ include file="../layout/footer.jsp" %>