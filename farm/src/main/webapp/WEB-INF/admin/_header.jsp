<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/farm/css/admin/_header.css">

<script type="text/javascript">
	window.onload = function() {
		
		const logout = document.getElementsByClassName('logout')[0];
		
		logout.addEventListener('click', function() {
			
			console.log('click!');
			
			const result = confirm('정말 로그아웃 하시겠습니까?');
	
	        if(result){
	            alert('로그아웃 처리되었습니다.');
	            return true;
	        }else{
	            alert('로그아웃이 실패했습니다.');
	            return false;
	        }
			
		})
	}
</script>

<header>
	<a href="/farm/admin/index.do" class="logo"></a>
	<div>
	    <a href="/farm/" class="top"><span>HOME |</span></a>
	    <a href="/farm/index.do" class="top logout"><span>로그아웃 | </span></a>
	    <a href="#" class="top"><span>고객센터</span></a>
	</div>
</header>