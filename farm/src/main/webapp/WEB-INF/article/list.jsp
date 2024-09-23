<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri ="jakarta.tags.core"%>
    
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
        main > aside{
            position: absolute;
            width: 176px;
            height: 650px;
            left: 0px;
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
        #listcontainer{
            width : 100%;
            height: 500px;
            position : absolute;
            top : 80px;
        }
        .list table {
            width: 95%;
            border-top: 2px solid #111;
            border-collapse: collapse;
            border-spacing: 0;
            margin-top:10px;
            margin-left : 40px 
        }

        .list table th {
            padding: 12px;
            border-top: 1px solid #d1dee2;
            border-bottom: 1px solid #d1dee2;
            background: #dae9ad;
            color: #383838;
        }
        .list table td {    
            padding: 12px 6px;
            border-top: 1px solid #e9e9e9;
            border-bottom: 1px solid #e9e9e9;    
        }
        .list table tr > td:nth-child(1) {width:  50px; text-align: center; background: #fff;}
        .list table tr > td:nth-child(2) {width:  auto; text-align: left;}
        .list table tr > td:nth-child(3) {width: 100px; text-align: center;}
        .list table tr > td:nth-child(4) {width: 100px; text-align: center;}
        .list table tr > td:nth-child(5) {width:  50px; text-align: center;}
        button {
        justify-content: center;
        border: 1px solid #BEBEBE;
        background-color: white;
        cursor: pointer;
    }
    
		.list > .paging {
		    padding: 20px;
		    text-align: center;            
		}
		.list > .paging > a {
		    padding: 8px;
		    background: #f2f2f2;
		    border: 1px solid #d7d7d7;            
		}
		
		.list > .paging > .current {
		    border: 1px solid #6d6d6d;
		    background: #888;
		    color: #fff;
		}
	.btnWrite{
        width : 54px; 
        height: 35px; 
        background-color: #f3fbda; 
        border : 1px solid 91BA15;
        margin-top : 10px;
	    position: absolute;
	    bottom: -20px;
	    right: 0;
	    border: 1px solid #d7d7d7;
	    text-align: center; 
	    display: flex;
	    justify-content: center;
	    align-items: center;
        color : black;
    }

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
			
                <div id="listcontainer">
                        <section class="list">
                            <article>
                                <table border= "0">
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>글쓴이</th>
                                        <th>날짜</th>
                                        <th>조회</th>
                                    </tr>
				    				<c:forEach var="article" items="${articles}">
				                        <tr>
				                        	<!-- 여기 순서번호 수정 해야함 -->
				                            <td>${pageStartNum}</td>
				                            <td><a href="/farm/article/view.do?cate=${article.cate}&type=${article.type}&no=${article.no}">${article.title}</a></td>
				                            <td>${article.nick}</td>
				                            <td>${article.rdate}</td>
				                            <td>${article.hit}</td>

				                        </tr>
				                         <c:set var="pageStartNum" value="${pageStartNum-1}"/>
				                    </c:forEach>
                                </table>
                            </article>
                            <div class="paging">
							    <c:if test="${pageGroup.start > 1}">
							        <a href="/farm/article/list.do?pg=${pageGroup.start-1}" class="prev">이전</a>
							    </c:if>
							    <c:set var="endPage" value="${pageGroup.end > lastPageNum ? lastPageNum : pageGroup.end}" />
							    <c:forEach var="i" begin="${pageGroup.start}" end="${endPage}">
							        <a href="/farm/article/list.do?pg=${i}" class="num ${currentPage == i ? 'current':'off'}">${i}</a>
							    </c:forEach>
							    <c:if test="${endPage < lastPageNum}">
							        <a href="/farm/article/list.do?pg=${endPage+1}" class="next">다음</a>
							    </c:if>
							</div>
                            <!-- 글쓰기 버튼 -->
 							 <a href="/farm/article/write.do?cate=${cate}&type=${type}" class="btnWrite">글쓰기</a>
 							
                        </section>
                   
                </div> <!-- listcontainer -->
            </div> <!-- hello -->
            
            
            </article>
        </div>
    </main>
     <%@ include file="/WEB-INF/_footer.jsp" %>
  </div>
  </body>
  </html>