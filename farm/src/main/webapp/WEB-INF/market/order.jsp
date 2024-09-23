<%@page import="com.farm.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>market/order.html</title>
	<link rel="stylesheet" href="/farm/css/market/order.css">
   
<script>


function updateTotalQuantity() {
    const quantities = document.querySelectorAll('.quantity1');
    let totalQuantity = 0;

    quantities.forEach(function(quantity) {
        totalQuantity += parseInt(quantity.textContent, 10);
    });

    document.querySelector('.bdquantity1_2').textContent = totalQuantity;
}

function TotalPrice() {
	const quantities = document.querySelectorAll('.quantity1'); // 모든 수량 요소 가져오기
    const prices = document.querySelectorAll('.price1'); // 모든 가격 요소 가져오기
    let totalPrice = 0;

    
    quantities.forEach(function(quantity, index) {
        const price = prices[index].textContent.replace(/,/g, ''); // 해당하는 가격 요소 가져오기
        const quantityValue = parseInt(quantity.textContent, 10);
        const priceValue = parseInt(price, 10);

        totalPrice += priceValue * quantityValue; // 모든 항목의 소계를 더함
    });
    
    document.querySelector('.bdprice1_2').innerText =  totalPrice;
    
    const finalPrice = totalPrice + 3000;
    document.querySelector('.bdallcount1_2').innerText = finalPrice.toLocaleString();
}




	window.onload = function() {
	    updateTotalQuantity();
	    TotalPrice();
    
	    const btnorder = document.querySelectorAll('.btnorder');
	    
	    btnorder.onclick = (e){
	    	e.preventDefault();
	    	alert('sdfa');
	    	
	    	const form = document.querySelectorAll('.table2');
	    	
	    	const recipient = form.recipient
	    	console.log("recipient "+recipient);
	    	
	    	/*
	    	const formData = new FormData();
	      	formData.append("",)
	
	        fetch('/farm/market/order.do', {
	            method: 'post',
	            body: formData
	        })
	        .then(resp => resp.json())
	        .then(data => {
	            console.log(data);
	            
	        })
	        .catch(err => {
	            console.log(err);
	        });
	      	*/
		   
		}
	
	}		


</script>
  
</head>
<body>
    <div id = "wrapper">
   	<%@ include file="/WEB-INF/_header.jsp" %>
    <div class="subtopbg1">
        <img src="/farm/img/sub_top_bg.jpg" alt="subtopbg1">
        <div class="subtoptit1"><img src="/farm/img/sub_top_tit2.png" alt="subtoptit1"></div>
    </div>
   
    <main>
        <div class="hello">
            <article>
                <nav>
                    <img src="/farm/img/sub_nav_tit_cate2_tit1.png" class="navtit1" alt="">
                    <div class="smallhello">                
                        <div class="smallhello2">
                            <div><img src="/farm/img/sub_page_nav_ico.gif" alt=""></div> 
                          HOME > 장보기 >&nbsp;<span class="highlight">장보기</span>
                       </div>
                    </div>
                </nav>
                <p>주문상품  전체(10)</p>
                <table>
                     <tbody>
                      <tr>
                        <th>상품번호</th>
                        <th>이미지</th>
                        <th>종류</th>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>할인</th>
                        <th>포인트</th>
                        <th>가격</th>
                        <th>소계</th>
                   	  </tr>
                   	 <c:forEach var="cart" items="${carts}">
                    	  <tr>
                              <td><input type="text" name="prodid" style="border:none" value="${cart.prodId}"></td>
                              <td><data value="">
          						 <c:forEach var="product" items="${products}">
            						  <c:if test="${product.prodid == cart.prodId}">
                 					 <img src="/farm/upload/${product.pro_img_list}" alt="${cart.proname}">
             						 </c:if>
         							 </c:forEach>
                              </td>
								<td>${cart.category}</td>
                        		<td>${cart.proname}</td>
                              <td class="quantity1">${cart.quantity}</td>
                              <td>${cart.discount}</td>
                              <td>${cart.point}</td>
                              <td class="price1">${cart.price}원</td>
                              <c:set var="total" value="${cart.price * cart.quantity}"/>
                              <td><c:out value=" 원"></c:out></td>
                          </tr>
                        </c:forEach>
                        
                        
                       </tbody>
                </table>
                <div class="orderinfo">
                    <p>주문정보 입력</p>
                </div>
                <div class="boarder">
                    <div class="table">
                        <p class="allcount">최종결제정보</p>
                        <div class="bdquantity">
                            <p class="bdquantity1_1">상품수</p>
                            <p class="bdquantity1_2">1</p>
                        </div>
                        <div class="bdprice">
                            <p class="bdprice1_1">상품금액</p>
                            <p class="bdprice1_2">27,000</p>
                        </div>
                        <div class="bddcprice">
                            <p class="bddcprice1_1">할인금액</p>
                            <p class="bddcprice1_2">${cart.discount}원</p>
                        </div>
                        <div class="bdusepoint">
                            <p class="bdusepoint1_1">포인트사용</p>
                            <p class="bdusepoint1_2">${cart.point}P</p>
                        </div>
                        <div class="bddelfee">
                            <p class="bddelfee1_1">배송비</p>
                            <p class="bddelfee1_2">원</p>
                        </div>
                        <div class="bdaddpoint">
                            <p class="bdaddpoint1_1">포인트적립</p>
                            <p class="bdaddpoint1_2">400P</p>
                        </div>
                        <div class="bdallcount">
                            <p class="bdallcount1_1">전체주문금액</p>
                            <p class="bdallcount1_2">얼마</p>
                        </div>
                    </div>
                    <div class="button2">
                        <button class="btnorder"><p>결제하기</p></button>
                    </div>
                </div>
                <div class="boarder2">
                    <form class="table2">
                        <div class="row1">
                            <div class="orderer1"><label for="orderer2">주문자</label></div>
                        <div class="orderer1_2"><input type="text" id="orderer" name="orderer" value="${user.name}" readonly></div>
                        </div>
                        <div class="row2">
                            <div class="phone1"><label for="phone2">휴대폰</label></div>
                            <div class="phone1_2"><input type="text" id="phone" name="phone" value="${user.hp}" readonly></div>
                        </div>
                        <div class="row3">
                            <div class="points1"><label for="points2">포인트사용</label></div>
                            <div class="points1_2">
                                <input type="text" id="points" name="points"  readonly>
                                <p>사용가능 2,000</p>
                                <button type="button"><p>사용하기</p></button>
                            </div>
                        </div>
                        <div class="row4">
                            <div class="recipient1"><label for="recipient2">받는분</label></div>
                            <div class="recipient1_2"><input type="text" id="recipient" name="recipient"></div>
                        </div>
                        <div class="row5">
                            <div class="contact1"><label for="contact2">연락처</label></div>
                            <div class="contact1_2"><input type="text" id="contact" name="contact"></div>
                        </div>
                        <div class="row6">
                            <div class="address1"><label for="address2">배송주소</label></div>
                            <div class="address1_2">
                                <input type="text" id="address1" name="address1" placeholder="">
                                <button type="button" id="btnsearch"></button>
                                <input type="text" id="address2" name="address2" placeholder="기본주소 검색">
                                <input type="text" id="detailed-address" name="detailed-address" placeholder="상세주소 입력">
            
                            </div>
                        </div>
                        <div class="row7">
                            <div class="payment1"><label>결제방법</label></div>
                            <div class="payment-method">
                               <div> <input type="radio" id="account" name="payment" value="1">
                                         <label for="account">계좌이체</label>
                                </div>
                                <div><input type="radio" id="credit-card" name="payment" value="2">
                                     <label for="credit-card">신용카드</label>
                                 </div>
                                 <div> 
                                    <input type="radio" id="check-card" name="payment" value="3">
                                    <label for="check-card">체크카드</label>
                                 </div>
                                 <div> 
                                     <input type="radio" id="mobile" name="payment" value="4">
                                    <label for="mobile">휴대폰</label>
                                  </div>
                            </div>
                        </div>
                        <div class="row8">
                            <div class="etc1"><label for="etc2">기타</label></div>
                            <div class="etc1_2"><textarea id="etc" name="etc"></textarea></div>
                        </div>
                    </form>
                </div>
               
            </div>
            <aside>
                <div id="asidesize">
                    <div class="asidegate1"><img src="/farm/img/sub_aside_cate2_tit.png" alt=""></div>
                    <div class="asidebgline"><img src="/farm/img/sub_aside_bg_line.png" alt=""></div>
                <ul class="asidelnb">
                    <li>
                        <li class="lnb1"><a href="#"><img id="lnb1" src="/farm/img/sub_cate2_lnb1_ov.png" alt="cate_lnb1"></a></li>
                    </li>
                </ul>
                </div>
              </aside>
            </article>
        </div>
    </main>
     <%@ include file="/WEB-INF/_footer.jsp" %>
  </div>
  </body>
  </html>
  