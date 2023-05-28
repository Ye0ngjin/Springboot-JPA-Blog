<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hide on 404 - 투표방</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/vote.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body>
    <div id="container">
        <%@ include file = "./layout/header.jsp" %>

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
	                    <form action="./process_new_vote.jsp" method="post">
        	                <p>골라줘 :</p><input style="width: 400px;" type="text" name="choiceSub" id="choiceSub" maxlength="25"
            	                placeholder=" 25자까지만 쓰세요옹">
                	        <input type="submit" id="startChoice" value="Choice Strat!"><br> <!-- 작성정보 전송(tab순서 변경 필요) -->
                        	<p>청코너 :</p><input type="text" name="choice_1" id="choice_1" class="ch1_value" maxlength="20">
                        	<p style="margin-left: 47px;">홍코너 :</p><input type="text" name="choice_2" id="choice_2" class="ch2_value" maxlength="20">
              	  		</form>
                    </div>
            </div>
            <!-- 게시된 투표글 목록 -->
            <div class="choiceList"> 
                <span class="chSub">끼룪꺄륚끠룪꼬룎</span>
                <a href="#"><img id="icon_del" src="/images/delete.png"></a>
                <div class="choice_realtime">
                    <p class="ch1">일이삼사오육칠팔구공일이삼사오육칠팔구공</p>
                    <div class="prcnt"><p class="result"></p></div>
                    <p class="ch2">일이삼사오육칠팔구공일이삼사오육칠팔구공</p>
                    <span class="ch_count"><p class="count1">38<a href="#"><img class="icon_boom1" src="/images/boomUp1.png"></a></p>
                        <p class="count2"><a href="#"><img class="icon_boom2" src="/images/boomUp2.png"></a>62</p></span>
                </div>
            </div>
        </div>
<%@ include file = "./layout/footer.jsp" %>
    </div>
<script src="/js/vote_choice.js"></script>

</body>

</html>