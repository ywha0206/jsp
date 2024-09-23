<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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

            background: url(.png);}
            
        	#articlenav{
            box-sizing: border-box;
            position: absolute;
            width: 762px;
            height: 72px;
            left: 40px;
            right: 0px;
            top: 0px;

            border-bottom: 1px solid #C2C2C2;

        }

        .navtit1{
            position: absolute;
            width: auto;
            height: 24px;
            left: 0px;
            bottom: 5px;

            background: url(.png);

        }

        .smallhello{
            position: absolute;
            height: 17px;
            left: 75.21%;
            right: 0%;
            bottom: 5px;
            white-space: nowrap;
       
        }
       
        .smallhello .smallhello2{
            position: absolute;
            height: 14px;
            height: 14px;
            left: 45px;
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

      .smallhello .smallhello2 > div{
            position: relative;
            right: 3px;
            bottom: 2px;

        }

        #highlight{
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

            

        
</style>
<nav id="articlenav">
    <!-- 기본 이미지는 type에 따라 변경될 예정 -->
    <img id="navtit" src="../img/sub_nav_tit_cate4_tit1.png" class="navtit1" alt="농작물이야기 이미지">
    <div class="smallhello">                
        <div class="smallhello2">
            <div><img src="/img/sub_page_nav_ico.gif" alt=""></div> 
            HOME > 이벤트 >&nbsp;<span id="highlight">이벤트</span>
        </div>
    </div>
</nav>

<aside>
    <div id="asidesize">
        <div class="asidegate1"><img src="../img/sub_aside_cate4_tit.png" alt=""></div>
        <div class="asidebgline"><img src="../img/sub_aside_bg_line.png" alt=""></div>
        <ul class="asidelnb">
            <li class="lnb1">
                <a href="list.do?cate=event&type=4">
                    <img id="lnb1" src="../img/sub_cate4_lnb1_ov.png" alt="cate_lnb1">
                </a>
  
        </ul>
    </div>
</aside>

