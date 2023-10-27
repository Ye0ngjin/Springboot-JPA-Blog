<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../layout/header.jsp"%>
<!-- 투표방 Main form -->
		<div class="board_wrap">
			<div class="board_title">
				<strong>404 투표방</strong>
			</div>
			<div class="button">
				<button style="font-size: 20px;">+</button>
			</div>

			<!-- 투표글 작성창 -->
			<div class="addChoice hide">
				<div class="align">
					<form action="newVote" method="post">
						<%-- <input type="hidden" name="user_id" value='${vDto.user_id }'> --%>
						<p>골라줘 :</p>
						<input style="width: 400px;" type="text" name="choiceSub"
							id="choiceSub" maxlength="25" autofocus tabindex="1"
							placeholder=" 25자까지만 쓰세요옹" required> <input type="submit"
							id="startChoice" value="Choice Strat!" tabindex="4"><br>
						<p>청코너 :</p>
						<input type="text" name="choice_1" id="choice_1" class="ch1_value"
							maxlength="12" tabindex="2" required>
						<p>홍코너 :</p>
						<input type="text" name="choice_2" id="choice_2" class="ch2_value"
							maxlength="12" tabindex="3" required>
					</form>
				</div>
			</div>
			<!-- 게시된 투표글 목록 -->
			<div class="board_vote">
				<c:forEach var="vDto" items="${list }" varStatus="i">
					<div class="choiceList" style="white-space:nowrap;">
						<!-- 투표 제목 -->
						<span class="chSub">
							<%-- Q${vDto.num}. --%> &nbsp;${vDto.choiceSub }
						</span>
<c:if test="${vDto.user.id == principal.user.id}">
							<a href="deleteVote?num=${vDto.num }"><img id="icon_del" src="images/delete.png"></a>
							<!-- 삭제 버튼 -->
</c:if>
						<div class="imgtoggle">
							<span> <img id="icon_upd"
<c:if test="${vDto.user.id == principal.user.id}"> src="images/update_open.png" </c:if>
<c:if test="${vDto.user.id != principal.user.id}"> hidden </c:if>
								class="editBtn">
								<!-- 편집 버튼 -->
							</span>
						</div>
						<div class="choice_realtime">
							<div class="chBox1">
								<!-- 왼쪽 항목 -->
								<p class="ch1">${vDto.choice_1 }</p>
								<!-- 1번 선택지 -->
								<p class="count1 ${i.index}">${vDto.choice1_count }
									<!-- 1번 선택지 count -->
									<label for="leftCk ${i.index }"> <input type="checkbox"
										id="leftCk ${i.index }" class="leftCheck"
										onchange="CheckboxClick(${vDto.num}, 'leftGood')"> <!-- 1번 선택지 선택버튼 -->
										<img class="icon_boom1" src="images/boomUp1.png">
									</label>
								</p>
								
								<c:set var="choice1Count" value="${vDto.choice1_count}" />
								<c:set var="choice2Count" value="${vDto.choice2_count}" />
								<c:set var="totalVotes" value="${choice1Count + choice2Count}" />
								
								<p class="result1">
								<c:choose>
									<c:when test="${totalVotes >= 1}">
									<i><fmt:formatNumber value="${(choice1Count / totalVotes)}" pattern="(##.##%)" /></i>
									<!-- 1번 선택지 비율 -->
									</c:when>
									<c:otherwise>
									<i></i>
									</c:otherwise>
								</c:choose>
								</p>
							</div>
							<!-- 투표비율 표시바 -->
							<div class="prcnt ${i.index}"
								style="background: linear-gradient(to right, rgb(117, 211, 255) ${vDto.choice1_count/(vDto.choice1_count+vDto.choice2_count)*100}%, 
                    		rgb(255, 133, 117) ${vDto.choice1_count/(vDto.choice1_count+vDto.choice2_count)*100}%)"></div>
							<div class="chBox2">
								<p class="ch2">${vDto.choice_2 }</p>
								<!-- 2번 선택지 -->
								<p class="count2 ${i.index }">
									<label for="rightCk ${i.index }"> <input
										type="checkbox" id="rightCk ${i.index }" class="rightCheck"
										onchange="CheckboxClick(${vDto.num}, 'rightGood')"> <!-- 2번 선택지 선택버튼 -->
										<img class="icon_boom2" src="images/boomUp2.png">
									</label>${vDto.choice2_count }
									<!-- 2번 선택지 count -->
								</p>
								<p class="result2">
								<c:choose>
									<c:when test="${totalVotes >= 1}">
									<i><fmt:formatNumber value="${(choice2Count / totalVotes)}" pattern="(##.##%)" /></i>
									<!-- 2번 선택지 비율 -->
									</c:when>
									<c:otherwise>
									<i></i>
									</c:otherwise>
								</c:choose>
								</p>
							</div>
						</div>
						<!-- 투표글 수정창 -->
						<div class="editChoice hide">
							<c:if test="${vDto.user.id == principal.user.id}">
								<div class="align">
									<h3>
										<%-- Q${vDto.num }. --%>
										투표글 수정
									</h3>
									<!-- 수정창 제목 -->
									<form class="updVoteform" action="updateVote" method="post">
										<input type="hidden" name="num" value=${vDto.num }>
										<p>골라줘 :</p>
										<input style="width: 400px;" type="text" name="choiceSub"
											id="choiceSub" maxlength="25" autofocus tabindex="1"
											placeholder=" 25자까지만 쓰세요옹" required> <input
											type="submit" id="startChoice" value="Edit Choice"
											tabindex="4"><br>
										<p>청코너 :</p>
										<input type="text" name="choice_1" id="choice_1"
											class="ch1_value" maxlength="12" tabindex="2" required>
										<p>홍코너 :</p>
										<input type="text" name="choice_2" id="choice_2"
											class="ch2_value" maxlength="12" tabindex="3" required>
									</form>
								</div>
							</c:if>
						</div>
						<fmt:formatDate value="${vDto.created_at}"
							pattern="yyyy년 M월 d일 a h시 m분" var="formattedDate" />
						<p class="cDate">${formattedDate}</p>
						<!-- 생성일자 -->
					</div>
				</c:forEach>
			</div>
		</div>
<%@ include file="../layout/footer.jsp"%>

<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<script src="js/vote.js"></script>
<script>
//스크롤 위치 저장 (가로축 및 세로축)
window.addEventListener('scroll', function() {
  localStorage.setItem('scrollPositionX', window.scrollX);
  localStorage.setItem('scrollPositionY', window.scrollY);
});

// 리다이렉트 후 스크롤 위치 복원 (가로축 및 세로축)
window.addEventListener('load', function() {
  var savedScrollPositionX = localStorage.getItem('scrollPositionX');
  var savedScrollPositionY = localStorage.getItem('scrollPositionY');
  if (savedScrollPositionX && savedScrollPositionY) {
    window.scrollTo(savedScrollPositionX, savedScrollPositionY);
    localStorage.removeItem('scrollPositionX'); // 필요한 경우 삭제
    localStorage.removeItem('scrollPositionY'); // 필요한 경우 삭제
  }
});
</script>
<%--
<script>

`-${offset}px`이 부분 계속 안됐는데, 따로 js파일을 만들어서 불러오니까 잘 된다.




document.addEventListener("DOMContentLoaded", function() {
	  const element = document.querySelector('.ch2');
	  const contentSize = element.offsetWidth;
	  const contentWidth = element.scrollWidth;

	  if (contentSize < contentWidth) {
	    const offset = contentWidth - contentSize;
	    element.style.left = `-${offset}px`;
	    console.log(offset);
	  }
	});


window.addEventListener('load', function() {
	  const element = document.querySelector('.ch2');
	  if (element) {
	    const contentSize = element.offsetWidth;
	    const contentWidth = element.scrollWidth;

	    if (contentSize < contentWidth) {
	      const offset = contentWidth - contentSize;
	      console.log(offset);
	      element.style.left = `-${offset}px`;
	    }
	  }
	});

setTimeout(function() {
		  const element = document.querySelector('.ch2');
		  if (element) {
		    const contentSize = element.offsetWidth;
		    const contentWidth = element.scrollWidth;

		    if (contentSize < contentWidth) {
		      const offset = contentWidth - contentSize;
		      element.style.left = `-${offset}px`;
		      console.log(offset);
		    }
		  }
		}, 100); // 100 밀리초 후에 스크립트 실행 


</script>
--%>
</body>
</html>