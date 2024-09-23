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
        .asidelnb .lnb4{
            position: absolute;
            left: 0px;
            right: 0px;
            top: 131px;
            bottom: 73px;

            background: url(.png);

        }
        .asidelnb .lnb5{
            position: absolute;
            left: 0px;
            right: 0px;
            top: 166px;
            bottom: 38px;

            background: url(.png);

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
            left: 20px;
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
<nav>
    <!-- 기본 이미지는 type에 따라 변경될 예정 -->
    <img id="navtit" src="../img/sub_nav_tit_cate5_tit1.png" class="navtit1" alt="농작물이야기 이미지">
    <div class="smallhello">                
        <div class="smallhello2">
            <div><img src="/img/sub_page_nav_ico.gif" alt=""></div> 
            HOME > 커뮤니티 >&nbsp;<span id="highlight"></span>
        </div>
    </div>
</nav>

<aside>
    <div id="asidesize">
        <div class="asidegate1"><img src="../img/sub_aside_cate5_tit.png" alt=""></div>
        <div class="asidebgline"><img src="../img/sub_aside_bg_line.png" alt=""></div>
        <ul class="asidelnb">
            <li class="lnb1">
                <a href="list.do?cate=community&type=5">
                    <img id="lnb1" src="../img/sub_cate5_lnb1.png" alt="cate_lnb1">
                </a>
            </li>
            <li class="lnb2">
                <a href="list.do?cate=community&type=6">
                    <img id="lnb2" src="../img/sub_cate5_lnb2.png" alt="cate_lnb2">
                </a>
            </li>
            <li class="lnb3">
                <a href="list.do?cate=community&type=7">
                    <img id="lnb3" src="../img/sub_cate5_lnb3.png" alt="cate_lnb3">
                </a>
            </li>
            <li class="lnb4">
                <a href="list.do?cate=community&type=8">
                    <img id="lnb4" src="../img/sub_cate5_lnb4.png" alt="cate_lnb4">
                </a>
            </li>
            <li class="lnb5">
                <a href="list.do?cate=community&type=9">
                    <img id="lnb5" src="../img/sub_cate5_lnb5.png" alt="cate_lnb5">
                </a>
            </li>
        </ul>
    </div>
</aside>

<script>

window.onload = function(){
    // URL에서 type 파라미터를 가져오는 함수
    function getParameterByName(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    // type 파라미터 값을 가져옵니다.
    const type = getParameterByName('type');

    // HTML 요소 선택
    const pageTitle = document.getElementById('highlight');
    const navtit = document.getElementById('navtit');

    // type에 따라 텍스트와 이미지 변경
    if (type) {
        if (type === '5') {
            pageTitle.textContent = '공지사항'; // 텍스트 변경
            navtit.src = '../img/sub_nav_tit_cate5_tit1.png'; // 이미지 변경
            document.getElementById('lnb1').src = '../img/sub_cate5_lnb1_ov.png'; // aside 메뉴 이미지 변경
        } else if (type === '6') {
            pageTitle.textContent = '오늘의식단'; // 기본 텍스트
            navtit.src = '../img/sub_nav_tit_cate5_tit2.png'; // 기본 이미지
            document.getElementById('lnb2').src = '../img/sub_cate5_lnb2_ov.png'; // aside 메뉴 이미지 변경
        } else if (type === '7') {
        	 pageTitle.textContent = '나도요리사'; // 기본 텍스트
             navtit.src = '../img/sub_nav_tit_cate5_tit3.png'; // 기본 이미지
             document.getElementById('lnb3').src = '../img/sub_cate5_lnb3_ov.png'; // aside 메뉴 이미지 변경
        }else if (type === '8') {
	       	 pageTitle.textContent = '고객문의'; // 기본 텍스트
	         navtit.src = '../img/sub_nav_tit_cate5_tit4.png'; // 기본 이미지
	         document.getElementById('lnb4').src = '../img/sub_cate5_lnb4_ov.png'; // aside 메뉴 이미지 변경
	    }else if (type === '9') {
		   	 pageTitle.textContent = '자주묻는질문'; // 기본 텍스트
		     navtit.src = '../img/sub_nav_tit_cate5_tit5.png'; // 기본 이미지
		     document.getElementById('lnb5').src = '../img/sub_cate5_lnb5_ov.png'; // aside 메뉴 이미지 변경
		}
    }
}
</script>