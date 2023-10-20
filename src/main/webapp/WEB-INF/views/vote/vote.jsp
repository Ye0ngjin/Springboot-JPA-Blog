<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hide on 404 - 투표방</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/vote.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body>
    <div id="container">
        <%@ include file = "../layout/header.jsp" %>

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
        	                <p>골라줘 :</p><input style="width: 400px;" type="text" name="choiceSub" id="choiceSub" maxlength="25"
            	                autofocus tabindex="1" placeholder=" 25자까지만 쓰세요옹" required>
                	        <input type="submit" id="startChoice" value="Choice Strat!" tabindex="4"><br>
                        	<p>청코너 :</p><input type="text" name="choice_1" id="choice_1" class="ch1_value" maxlength="12" tabindex="2" required>
                        	<p>홍코너 :</p><input type="text" name="choice_2" id="choice_2" class="ch2_value" maxlength="12" tabindex="3" required>
              	  		</form>
                    </div>
            </div>
            <!-- 게시된 투표글 목록 -->
            <div class = "board_vote">
            <c:forEach var="vDto" items="${list }" varStatus="i">		
            <div class="choiceList">
                <span class="chSub">Q${vDto.num}. &nbsp;${vDto.choiceSub }</span>		<!-- 투표 제목 -->
                <a href="deleteVote?num=${vDto.num }"><img id="icon_del" src="images/delete.png"></a>		<!-- 삭제 버튼 -->	
                <div class="imgtoggle">
			    	<span>
			    		<img id="icon_upd" class="editBtn" src="images/update_open.png">			<!-- 편집 버튼 -->
			    	</span>
  				</div>
                <div class="choice_realtime">		
                    <div class="chBox1">		<!-- 왼쪽 항목 -->
                    	<p class="ch1">${vDto.choice_1 }</p>		<!-- 1번 선택지 -->
                    	<p class="count1 ${i.index}">${vDto.choice1_count }	<!-- 1번 선택지 count -->
                    		<label for="leftCk ${i.index }">
                    			<input type="checkbox" id="leftCk ${i.index }" class="leftCheck" onchange="CheckboxClick(${vDto.num}, 'leftGood')">		<!-- 1번 선택지 선택버튼 -->
                    			<img class="icon_boom1" src="images/boomUp1.png">
               		     	</label>
           		     	</p>
                   		<p class="result1">
                   			<i><fmt:formatNumber value="${vDto.choice1_count/(vDto.choice1_count+vDto.choice2_count)}" pattern="(##.##%)"/></i>	<!-- 1번 선택지 비율 -->
                 		</p>
                    </div>
                    <!-- 투표비율 표시바 -->
                    <div class="prcnt ${i.index}" 
                    style="background: linear-gradient(to right, rgb(117, 211, 255) ${vDto.choice1_count/(vDto.choice1_count+vDto.choice2_count)*100}%, 
                    		rgb(255, 133, 117) ${vDto.choice1_count/(vDto.choice1_count+vDto.choice2_count)*100}%)"></div>
                    <div class="chBox2">
	                    <p class="ch2">${vDto.choice_2 }</p>		<!-- 2번 선택지 -->
                        <p class="count2 ${i.index }">					
                     	  <label for="rightCk ${i.index }">
                     	  	<input type="checkbox" id="rightCk ${i.index }" class="rightCheck" onchange="CheckboxClick(${vDto.num}, 'rightGood')">		<!-- 2번 선택지 선택버튼 -->
                 		    <img class="icon_boom2" src="images/boomUp2.png">
                		  </label>${vDto.choice2_count }		<!-- 2번 선택지 count -->			
                		</p>
                   		<p class="result2">
                   			<i><fmt:formatNumber value="${vDto.choice2_count/(vDto.choice1_count+vDto.choice2_count)}" pattern="(##.##%)"/></i>	<!-- 2번 선택지 비율 -->
                  		</p>
                    </div>
                </div>
                 <!-- 투표글 수정창 -->
            <div class="editChoice hide"> 
                    <div class="align">
                    <h3>Q${vDto.num }. 투표글 수정</h3>		<!-- 수정창 제목 -->
	                    <form class="updVoteform" action="updateVote" method="post">
	                    	<input type="hidden" name="num" value=${vDto.num }>
        	                <p>골라줘 :</p><input style="width: 400px;" type="text" name="choiceSub" id="choiceSub" maxlength="25"
            	                autofocus tabindex="1" placeholder=" 25자까지만 쓰세요옹" required>
                	        <input type="submit" id="startChoice" value="Edit Choice" tabindex="4"><br>
                        	<p>청코너 :</p><input type="text" name="choice_1" id="choice_1" class="ch1_value" maxlength="12" tabindex="2" required>
                        	<p>홍코너 :</p><input type="text" name="choice_2" id="choice_2" class="ch2_value" maxlength="12" tabindex="3" required>
              	  		</form>
                    </div>
            </div>
                               		<p class="cDate">${vDto.created_at }</p>		<!-- 생성일자 -->
            </div>            
            </c:forEach>
            </div>
        </div>
<%@ include file = "../layout/footer.jsp" %>
    </div>
 <script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<script src="js/vote.js"></script>
</body>

</html>