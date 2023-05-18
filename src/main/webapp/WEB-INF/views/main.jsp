<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/mainpage.css">
    <title>Hide on 404</title>
</head>

<body>
<div id="container">
<%--    <button onclick="handleOnclick(this)">1</button>--%>
<%--    <button>2</button>--%>
<%--    <button>3</button>--%>
<%--    <button>4</button>--%>
<%--    <a class="aaaaa">delete button</a>--%>
<%--    <script>--%>
<%--        function handleOnclick(e){--%>
<%--            console.log(e);--%>
<%--            console.log(1234)--%>


<%--            console.log(document.querySelector(".aaaaa").href="http://localhost:8282/users/delete/2")--%>

<%--        }--%>
<%--    </script>--%>

<%--    <c:forEach var="vDto" items="${name}" varStatus="i">
    ${name.get(3).content}
        ${vDto.'content'}
    </c:forEach>--%>

    <%@ include file="header.jsp" %>
    <div id="slideShow">
        <div id="slides">
            <img src="/resources/images/photo-1.jpg" alt style="display: block;">
            <img src="/resources/images/photo-2.jpg" alt style="display: none;">
            <img src="/resources/images/photo-3.jpg" alt style="display: none;">
            <button id="prev">&lang;</button>
            <button id="next">&rang;</button>
        </div>
    </div>

    <script src="/resources/js/main1.js"></script>

    <div class="board_wrap">

        <div class="board_title">
            <strong>404 커뮤니티</strong>
        </div>

        <div class="button1">
            <button style="font-size: 20px;">+</button>
        </div>

        <div class="board_write_wrap hide">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <a href="main" class="on">등록</a>
            </div>
        </div>
        ${name.get(0).content}
        <div class="board_list_wrap">
            <div class="board_list">
               <%-- <script>
                    var a = [{"title": "주말에 학원 몇시까지 문열어?", "content": "안녕하세요 여러분", "name": "바보건우", "date": "2023.4.21"},
                        {"title": "qkqh", "content": "안녕하세요 여러분2", "name": "익명", "date": "2023.4.24"},
                        {"title": "안녕하세요33", "content": "안녕하세요 여러분3333", "name": "익명", "date": "2023.4.21"},
                        {"title": "안녕하세요3444444", "content": "안녕하세요 444444444", "name": "문상진", "date": "2023.4.18"},
                        {"title": "안녕하세요3444444", "content": "안녕하세요 1231413412321", "name": "문상진", "date": "2023.4.18"}
                    ]


                    for (var i = 0; i < a.length; i++) {


                        document.write("<div>");
                        document.write(i + 1);
                        document.write("<div class='title'>");
                        document.write("<button style='border: none; background-color:transparent ' onclick={hide2()}>");
                        document.write(a[i].title);
                        document.write("</a></div>");
                        document.write("</button>");
                        document.write("<div class='writer'>");
                        document.write(a[i].name);
                        document.write("</a></div>");
                        document.write("<div class='date'>");
                        document.write(a[i].date);
                        document.write("</a></div>");
                        document.write("<div class='count'>");
                        document.write(i + 100);
                        document.write("</a></div>");

                        document.write("<div class='contenthide hide myDiv' style='display: none' >");
                        document.write(a[i].content);
                        document.write(`</a><div class='bt_wrap'> <a href='main' class='on'>등록</a>
                                           <a href='main' class='on'>수정</a>
                                           <a href='main' class='on'>삭제</a>
                                      </div></div>`);

                            document.write("</div>");
                        }--%>



<%--                        &lt;%&ndash;                        {&lt;%&ndash;%>--%>
<%--                    &lt;%&ndash;           List<PostsServiceDTO> posts = msservice.getAllPost();&ndash;%&gt;--%>
<%--                    &lt;%&ndash;           for (int i = 0; i < posts.size(); i++) {&ndash;%&gt;--%>
<%--                    &lt;%&ndash;               PostsServiceDTO post = posts.get(i);&ndash;%&gt;--%>
<%--                    &lt;%&ndash;       %>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <%= i + 1 %>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div class="title">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <button class="tjfaud">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    <%= post.getTitle() %>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                </button>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div class="writer">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <%= post.getUser_id() %>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div class="date">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <%= post.getCreated_at() %>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div class="count">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <%= post.getView_count() %>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        &lt;%&ndash;%>--%>
<%--                    &lt;%&ndash;                            }&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        %>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    </script>{&ndash;%&gt;--%>
             <%--   </script>--%>

                 <c:forEach var="board" items="${list}">
                     <p>${board.num} - ${board.user_id} - ${board.title}

                 </c:forEach>

<%--                &lt;%&ndash;                <div class="button">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    <button style="font-size: 20px;">+</button>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                </div>&ndash;%&gt;--%>

<%--                &lt;%&ndash;                <div class="board_write_wrap hide">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    <div class="title01">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        sdsd&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    </div>&ndash;%&gt;--%>

<%--                &lt;%&ndash;                    <div class="bt_wrap">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        <a href="main" class="on">등록</a>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        <a href="main" class="on">수정</a>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        <a href="main" class="on">삭제</a>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                </div>&ndash;%&gt;--%>

             </div>
         </div>
    </div>

    <%@ include file="footer.jsp" %>
</div>
</body>

</html>