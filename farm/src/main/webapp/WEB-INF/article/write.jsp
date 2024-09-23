<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>croptalk/grow.html</title>

    <style>
    
    * {
            margin: 0;
            padding: 0;
            font: normal 12px '고딕';
        }
        ul, ol {list-style: none;}
        a {text-decoration: none; color: #111;}
        input, textarea {outline: none;}
        
        #wrapper {
       position: relative;
       width: 1920px;
       height: 1106px;
        background: #FFFFFF;
        margin: 0 auto;

        }

        /***********/
        /* header */
        header{
            width: 980px;
            height: 150px;
            margin : 0 auto;
        }

        /*top line*/
        header .htop{
            position: absolute;
            width: 980px;
            height: 14px;
            top: 1px;
            background-repeat: repeat;
            height: 10px;
            background-image: url('../img/head_top_line.png')
        }
        
        /*logospace 는 로고, 사이드로고, 로그인| 담고있음*/
        .logospace {
            width : 980px;
            height : 80px;
            position : relative;
        } 

        .logospace > p{
            position : absolute;
            height: 14px;
            right : 0;
            left: 787.45px;
            top: 15px;
            font-family: 'Inter';
            font-style: normal;
            font-weight: 400;
            font-size: 12px;
            line-height: 15px;
            display: flex;
            align-items: center;
            color: #111111;
        }
        .logospace > p{
            position: absolute;
            width: 237.15px;
        }

        .headlog {
            position : absolute;
            left : 40%;
            top : 15px;
        }
        .headlog2 {
            position : absolute;
            right : 0px;
            top : 45px;
        }

        /**nav**/
        header nav {
            width : 100%;
            height : 50px;
            position :relative;
        }
        .navfont> li a {
            font-size :15px;
            font-weight: bolder;
        }
       header nav > ul {
            width :100%;
            height : 50px;
            display: inline-block;
            justify-content: space-around;
            padding: 10px 0;
        }
        
       header nav > ul > li {
        margin-left : 5px;
        float : left;
        min-width : 190px;
        height: 30px;
        margin-top :5px;
        border-top: 5px solid rgb(145, 142, 142);
        /*안의 글자 a들을 중앙으로 배치하는 방법*/
        position : flex;
        text-align: center;
        }
        /*장보기 뱃지*/
        .badge {
            position : absolute;
            margin-top :-10px;
            margin-left  : 310px;
        }

        .subtopbg1{
            position: absolute;
            width: 980px;
            height: 184px;
            left: 470px;
            right: 470px;
            top: 145px;

            background: url(.jpg);


        }
        .subtopbg1 .subtoptit1{
            position: absolute;
            width: 326px;
            height: 37px;
            left: 10px;
            bottom: 10px;
                    
            background: url(.png);

        }


        main {
            position: absolute;
            height: 650px;
            left: 470px;
            right: 470px;
            top: 326px;
        }
        .write {
		    position: relative;
		    width: 720px;
		    margin: 130px auto;
		}
		
		.write > article > p {
		    position: absolute;
		    right: 0;
		    top: 0;
		}
		
		.write table {
		    width: 100%;
		    border-top: 2px solid #111;
		    border-collapse: collapse;
		    border-spacing: 0;
		    margin-top: 6px;
		}
		
		.write table th {
		    padding: 12px;
		    border-top: 1px solid #d1dee2;
		    border-bottom: 1px solid #d1dee2;
		    background: #e5ecef;
		    color: #383838;
		}
		.write table td {    
		    padding: 12px 6px;
		    border-top: 1px solid #e9e9e9;
		    border-bottom: 1px solid #e9e9e9;    
		}
		.write table td:nth-child(1) {
		    width: 100px;
		    background: #f5f8f9;
		    text-align: center;
		}
		.write table input {
		    width: 100%;
		    height: 24px;
		    border: 0;    
		}
		.write table textarea {
		    width: 100%;
		    height: 280px;
		    resize: none;    
		    border: 0;
		}
		.write form > div {
		    margin-top: 10px;
		    text-align: right;
		}
       aside{
            position: absolute;
            width: 176px;
            height: 650px;
            left: -175px;
            top: 0px;

            background: url(.png);

        }

        main > #asidesize{
            position: absolute;
            width: 176px;
            height: 650px;
            left: 470px;
            top: 340px;

            background: url(.png);
            
        }
        
        .asidegate1{
            position: absolute;
            width: 129px;
            height: 44px;
            left: 16px;
            top: 16px;

            background: url(.png);


        }

        main #asidesize .asidebgline{
            position: relative;
            top: 37px;
            float: right;
            
        }

        .asidelnb{
            position: absolute;
            width: 175px;
            height: 233px;
            left: 0px;
            top: 81px;

            background: url('img/sub_aside_bg_lnb.png');

        }

        .asidelnb .lnb1{
            position: absolute;
            left: 0px;
            right: 0px;
            top: 26px;
            bottom: 178px;

            background: url(.png);


        }
        .asidelnb .lnb2{
            position: absolute;
            left: 0px;
            right: 0px;
            top: 61px;
            bottom: 143px;

            background: url(.png);


        }
        .asidelnb .lnb3{
            position: absolute;
            left: 0px;
            right: 0px;
            top: 96px;
            bottom: 108px;

            background: url(.png);

        }


        .hello{
            position: absolute;
            width: 802px;
            height: 650px;
            left: 176px;
            top: 0px;
        }

        .hello > article > nav{
            box-sizing: border-box;
            position: absolute;
            width: 762px;
            height: 72px;
            left: 40px;
            right: 0px;
            top: 0px;

            border-bottom: 1px solid #C2C2C2;

        }

        .hello > article > nav .navtit1{
            position: absolute;
            width: auto;
            height: 24px;
            left: 0px;
            bottom: 5px;

            background: url(.png);

        }

        .hello > article > nav .smallhello{
            position: absolute;
            height: 17px;
            left: 75.21%;
            right: 0%;
            bottom: 5px;
            white-space: nowrap;
       
        }
       
        .hello > article > nav .smallhello .smallhello2{
            position: absolute;
            height: 14px;
            height: 14px;
            left: -16px;
            top: 1px;

            font-family: Arial, Helvetica, sans-serif; /* 폰트 패밀리 */
            font-style: normal; /* 폰트 스타일 */
            font-weight: 400; /* 폰트 굵기 */
            font-size: 12px;
            line-height: 15px;
            display: flex;
            align-items: center;

            color: #8C8C8C;

        }

        .hello > article > nav .smallhello .smallhello2 > div{
            position: relative;
            right: 3px;
            bottom: 2px;

        }

        .hello > article > nav .smallhello .smallhello2 .highlight{
            position: relative;
            bottom: 1.5px;
            font-weight: bold;
            color: #91BA15;
            
        }

        .hello > article > div .boards{
            position: absolute;
            width: 247.22px;
            height: 14px;
            left: 40px;
            top: 113px;
                    
            font-family: 'Inter';
            font-style: normal;
            font-weight: 400;
            font-size: 12px;
            line-height: 15px;
            display: flex;
            align-items: center;
            white-space: nowrap;
                    
            color: #000000;
                    
        }


        /***********/
        /* footer */
        footer {
            box-sizing: border-box;
            position: absolute;
            margin : 0 auto;
            width : 980px;
            height: 130px;
            top: 1010px;
            left: 470px;
            right: 470px;
            background-color: #F8F9FA; /* 배경색 추가 */
            
            overflow :hidden
        }/* Footer */


        footer > div {
            float :right;
            width :100%;
            height : 120px;
            
        }
    
        /*************************************************************************************************/
        /*************************************************************************************************/
        /********************************************** main  ********************************************/
        /*************************************************************************************************/
        /*************************************************************************************************/
        

    /*footer topline*/
      footer .fline{
        position: relative;
        width: 980px;
        background-repeat: repeat;
        height: 10px;
        background: url('../img/footer_top_line.png');
      }
      /*info3개 들음*/
      #Paragraph {
        float : right;
        margin-top:10px;
        position: relative;
        height: 95px;
        width : 75%;
        overflow : hidden;
       }
        .info1{

        position: absolute;
        left : 0;
        top : 0;
         width: 709.68px;
         height: 54px;
         font-family: 'Inter', sans-serif;
         font-style: normal;
         font-weight: 300;
         font-size: 10.6562px;
         line-height: 18px;
         display: flex;
         align-items: center;
         color: #585858;
        }
    
         footer > div .info2{
            position: absolute;
            left : 0;
            bottom : 25px;
        width: 275.5px;
        height: 14px;
        font-family: 'Inter', sans-serif;
        font-style: normal;
        font-weight: 400;
        font-size: 11.25px;
        line-height: 14px;
        display: flex;
        align-items: center;
        color: #888888;
    }
        footer > div .info3{
            position: absolute;
            right : 5px;
            bottom : 0;
        width: 89.18px;
        height: 14px;
        font-family: 'Inter', sans-serif;
        font-style: normal;
        font-weight: 400;
        font-size: 10.6875px;
        line-height: 13px;
        display: flex;
        align-items: center;
        color: #888888;
    }

    
    	.btnCancel{
        width : 53px; 
        height: 34px; 
        background-color: #f3fbda; 
        margin-top : 10px;
	    position: absolute;
	    bottom: -50px;
	    right: 85px;
	    border: 1px solid #d7d7d7;
	    text-align: center; 
	    display: flex;
	    justify-content: center;
	    align-items: center;
        color : black;
    }
        .btnWrite {
   		 width : 55px; 
        height: 36px; 
        background-color: #f3fbda; 
        margin-top : 10px;
	    position: absolute;
	    bottom: -50px;
	    right: 20px;
	    border: 1px solid #d7d7d7;
	    text-align: center; 
	    display: flex;
	    justify-content: center;
	    align-items: center;
        color : black;
</style>

</head>
<body>
    <div id = "wrapper">
    <%@ include file="/WEB-INF/_header.jsp" %>
    <div class="subtopbg1">
        <img src="../img/sub_top_bg.jpg" alt="subtopbg1">
        <div class="subtoptit1"><img src="../img/sub_top_tit3.png" alt="subtoptit1"></div>
    </div>
   
    <main>
        <div class="hello">
            <article>
                   <c:if test="${cate == 'crop'}">
			    <%@ include file="/WEB-INF/article/crop_aside.jsp" %>
			</c:if>
			
			<c:if test="${cate == 'event'}">
			    <%@ include file="/WEB-INF/article/event_aside.jsp" %>
			</c:if>
			<c:if test="${cate == 'community'}">
			    <%@ include file="/WEB-INF/article/community_aside.jsp" %>
			</c:if>
			
                <section class="write">
                    <article>
                        <form action="/farm/article/write.do?cate=${cate}&type=${type}" method ="post">
                        	<input type ="hidden" name ="writer" value="${sessUser.uid}">
                        	<input type ="hidden" name ="type" value="${type}">
                        	<input type ="hidden" name ="cate" value="${cate}">
                        <table>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea name="content"></textarea>                                
                                </td>
                            </tr>
                        </table>
                        <div>
                            <a href="/farm/article/list.do?type=${type}" class="btnCancel">취소</a>
                            <input type="submit"  class="btnWrite" value="작성완료">
                        </div>
                    </form>
                    </article>
                </section>
               
                
            </div>
            
            </article>
        </div>

    </main>
  
      <footer>
          <div>
              <div class="fline"></div>
              <img src="../img/footer_logo.png" class="logo" alt="farmstoryfootlogo">
              <div id="Paragraph">
                  <p class="info1">
                      (주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-부산진구-123호 / 벤처기업확인 서울지방중소기업청 제 012345678-9-01234호
                      등록번호 팜스토리01234 (2013.04.01) / 발행인 : 홍길동<br>
                      대표 : 김철학 / 이메일 : chhak0503@gmail.com / 전화 : 01) 234-5678 / 부산광역시 부산진구 부전동 123
                  </p>
                  <p class="info2">
                      copyrightⓒ 김철학(개발에반하다.) All rights reserved.
                  </p>
                  <p class="info3">
                      farmstory ver1.0.1
                  </p>
              </div>
          </div>
        
      </footer>
  </div>
  </body>
  </html>
  