<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
	
		window.onload = function(){
			
			const table = document.getElementsByTagName('table')[0];
			
			//사용자 데이터 요청
			fetch('./proc/getUsers.jsp')
				.then(response => response.json())
				.then(data => {
					console.log(data)
					
					for(const user of data){
						
						console.log(user.uid)
							
						const row =`<tr>
										<td>\${user.uid}</td>
										<td>\${user.name}</td>
										<td>\${user.birth}</td>
										<td>\${user.addr}</td>
										<td>
											<a href='#' class="modify">수정</a>
											<a href='#' class="delete">삭제</a>
										</td>
									</tr>`;
						
						
						table.insertAdjacentHTML('beforeend', row);
					}
				})
				.catch(err => {
					console.log(err);
				});		//사용자 데이터 요청
			
			
			//클릭 이벤트(동적 이벤트 연결)
			document.body.addEventListener('click', function(e){
				
				if(e.target.classList.contains('delete')){
					e.preventDefault();
					//화면에서 동적 삭제
					const tr = e.target.closest('tr');
					
					const uid = tr.children[0].innerText;
					const name = tr.children[1].innerText;


					//삭제 요청
					fetch('./proc/deleteProc.jsp?uid='+uid)
						.then(response => response.json())
						.then((data)=>{
							console.log(data.result);
							if(data.result > 0){
								
								alert(name+'님을 삭제했습니다.');
								tr.remove();
							}
						})
						.catch(err=>{
							console.log(err);
						});
				}
				
				//수정 클릭 이벤트				
				if(e.target.classList.contains('modify')){
					e.preventDefault();
					const tr = e.target.closest('tr');
					const uid = tr.children[0].innerText;
					
					location.href = './modify.jsp?uid='+uid;
				}
				
				
			});
			
			
			
			
		}//onload end	
	
	</script>
</head>
<body>
	
	<h3>ajax user2 목록</h3>
	
	<a href="/ch06/3.AJAXTest.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
	</table>
	
</body>
</html>