<%@page import="com.farm.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<% 
    UserDto sessUser = (UserDto) session.getAttribute("sessUser"); 
    if (sessUser == null) {
        response.sendRedirect("/farm/user/login.do");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>market/cart.html</title>
    <link rel="stylesheet" href="/farm/css/market/cart.css">
    <script>

    function deleteSelected() {
    	

        // 선택된 체크박스들 가져오기
        var checkboxes = document.querySelectorAll('input[name="prodid"]:checked');
        var ids = [];
        checkboxes.forEach(function(checkbox) {
            ids.push(checkbox.value);
        });


        if (ids.length > 0) {
            // IDs를 쿼리 문자열로 변환
            var query = ids.join(', ');

            // 삭제 요청을 서버로 전송
            console.log("ids" + ids);
            window.location.href = '/farm/market/cartdelete.do?ids=' + ids;

        } else {
            alert('삭제할 항목을 선택하세요.');
        }
    }



    function toggleCheckboxes(source) {
        var checkboxes = document.querySelectorAll('input[name="prodid"]');
        checkboxes.forEach(function(checkbox) {
            checkbox.checked = source.checked;
        });
    }



</script>


 
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
        

            const btnOrder = document.getElementById('btnOrder');
            
            btnOrder.onclick = function(){
            
            	
            	const checkboxes = document.querySelectorAll('input[name=cartNo]:checked');
                const values = Array.from(checkboxes).map(checkbox => encodeURIComponent(checkbox.value));
                console.log(values);
                
                if (values.length === 0) {
                    alert('주문할 항목을 선택하세요.');
                    return;
                }
                
                // 쿼리 문자열을 생성
                const queryString = values.map(value => `cart=\${value}`).join('&');
                console.log(queryString);
                
                
                // GET 요청을 보내기 위한 URL 생성
                const url = `/farm/market/order.do?\${queryString};
                console.log(url);
            	
                //        	        	
            	fetch(url)
            		.then(resp => resp.json())
            		.then(data => {
            			console.log(data);
            			
            		})
            		.catch(err => {
            			console.log(err);
            		});
                
            	window.location.href = url;
            }
            
            
        const deleteselect = document.getElementsByClassName('deleteselect')[0];
        
        deleteselect.addEventListener('click', function(e){
        	
        	alert('');
        	fetch('/farm/market/cartdelete.do?cartno='+no)
				.then(resp => resp.json())
				.then(data => {
					console.log(data);
					
					if(data.result > 0){
						// 동적 삭제 처리
						article.remove();
						
					}else{
						alert('장바구니 삭제 실패');
					}
					
				})
				.catch(err => {
					console.log(err);
				});
        });
        
        
    };
    </script>
</head>
<body>
    <div id = "wrapper">
   	<%@ include file="/WEB-INF/_header.jsp" %>
    <div class="subtopbg1">
        <img src="../img/sub_top_bg.jpg" alt="subtopbg1">
        <div class="subtoptit1"><img src="../img/sub_top_tit2.png" alt="subtoptit1"></div>
    </div>
   
    <main>
        <div class="hello">
            <article>
                <nav>
                    <img src="../img/sub_nav_tit_cate2_tit1.png" class="navtit1" alt="">
                    <div class="smallhello">                
                        <div class="smallhello2">
                            <div><img src="/img/sub_page_nav_ico.gif" alt=""></div> 
                          HOME > 장보기 >&nbsp;<span class="highlight">장보기</span>
                       </div>
                    </div>
                </nav>
                <p>장바구니 전체(10)</p>
<!-- 연화
                <table class="cart">
                    <tr class="carthead">
                        <th>
                            <input type="checkbox" id="selectAll" onclick="toggleCheckboxes(this)">
                        </th>
                        <th><p class="image">이미지</p></th>
                        <th><p class="kind">종류</p></th>
                        <th><p class="Productname">상품명</p></th>
                        <th><p class="quantity">수량</p></th>
                        <th><p class="discount">할인</p></th>
                        <th><p class="point">포인트</p></th>
                        <th><p class="price">가격</p></th>
                        <th><p class="subtotal">소계</p></th>
                    </tr>
                    <tr class="cartbody1">
                        <p>장바구니에 상품이 없습니다</p>
                    </tr>
                    <c:forEach var="cart" items="${carts}">
                     <tr class="cartbody2">
                         <td><input type="checkbox" id="select1" name="cartNo" value="${cart.cartNo}"></td>
                         <td><img src="../img/market_item1.jpg" class="image1" alt="apple"></td>
                         <td><p class="kind1">${cart.category}</p></td>
                         <td><p class="Productname1">${cart.proname}</p></td>
                         <td><p class="quantity1">${cart.quantity}</p></td>
                         <td><p class="discount1">${cart.discount}</p></td>
                         <td><p class="point1">${cart.point}</p></td>
                         <td><p class="price1">${cart.price}</p></td>                         
                         <td><p class="subtotal1_1">3,600원</p></td>
                     </tr>
                    </c:forEach>
                </table>

                <div class="button">
                    <button class="deleteselect"><p>선택삭제</p></button>
                </div>
-->
              <form action="/farm/market/cart.do" method="post" enctype="multipart/form-data">
    <table>
        <tbody>
            <tr>
                <th><input type="checkbox" id="select-all" onclick="toggleCheckboxes(this)"></th>
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
                <tr class="cartproduct">
                    <td><input type="checkbox" name="prodid" value="${cart.prodId}"></td>
                    <td><img src="/farm/upload/${cart.pro_img_list}" alt="${cart.proname}"></td>
                    <td>${cart.category}</td>
                    <td>${cart.proname}</td>
                    <td>${cart.quantity}</td>
                    <td>${cart.discount}</td>     
                    <td>${cart.point}</td>     
                    <td>${cart.price}원</td>
                    <td>${cart.price}원</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</form>
                   
                   
               <div class="button">
                        <a href="#" onclick="deleteSelected()" class="deleteselect"><p>선택삭제</p></a>
                    </div>

-----------5

                    </div>

256



257

-----------
                <div class="boarder">
                    <div class="table">
                        <p class="allcount">전체합계</p>
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
                            <p class="bddcprice1_2">5,000원</p>
                        </div>
                        <div class="bddelfee">
                            <p class="bddelfee1_1">배송비</p>
                            <p class="bddelfee1_2">5,000원</p>
                        </div>
                        <div class="bdpoint">
                            <p class="bdpoint1_1">포인트</p>
                            <p class="bdpoint1_2">4,000원</p>
                        </div>
                        <div class="bdallcount">
                            <p class="bdallcount1_1">전체주문금액</p>
                            <p class="bdallcount1_2">23,000</p>
                        </div>
                    </div>
                    <div class="button2">
                        <button class="btnorder" id="btnOrder"><p>주문하기</p></button>
                    </div>
                </div>
               
            </div>
            <aside>
                <div id="asidesize">
                    <div class="asidegate1"><img src="../img/sub_aside_cate2_tit.png" alt=""></div>
                    <div class="asidebgline"><img src="../img/sub_aside_bg_line.png" alt=""></div>
                <ul class="asidelnb">
                    <li>
                        <li class="lnb1"><a href="#"><img id="lnb1" src="../img/sub_cate2_lnb1_ov.png" alt="cate_lnb1"></a></li>
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
  