<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hide on 404</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/mainpage.css">
    <link rel="stylesheet" href="css/share.css">
</head>

<body>
    <script src="js/share.js"></script>
    <div id="container">


<%@ include file = "header.jsp" %>

        <div id="tabMenu">
            <input type="radio" id="tab1" name="tabs" checked="">
            <label for="tab1">취업정보</label>
            <input type="radio" id="tab2" name="tabs">
            <label for="tab2">자격증</label>
            <div id="notice" class="tabContent">
                <div class="board_wrap">

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

                    <div class="board_list_wrap">
                        <div class="board_list">
                            <script>
                                var a = [{ "title": "네카라쿠배당토 ㄱㄱ", "content": "안녕하세요 여러분", "name": "익명", "date": "2023.4.21" },
                                { "title": "qkqh", "content": "안녕하세요 여러분2", "name": "익명", "date": "2023.4.24" },
                                { "title": "안녕하세요33", "content": "안녕하세요 여러분3333", "name": "익명", "date": "2023.4.21" },
                                { "title": "안녕하세요3444444", "content": "안녕하세요 444444444", "name": "문상진", "date": "2023.4.18" },
                                { "title": "안녕하세요3444444", "content": "안녕하세요 1231413412321", "name": "문상진", "date": "2023.4.18" }
                                ]

                                for (var i = 0; i < a.length; i++) {
                                    document.write("<div>");
                                    document.write(i + 1);
                                    document.write("<div class='title'>");
                                    document.write("<button style='border: none; background-color:transparent ' onclick={hide3()}>");
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
                                }
                            </script>
                        </div>
                    </div>
                </div>

            </div>
            <div id="gallery" class="tabContent">
                <div class="board_wrap">

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

                    <div class="board_list_wrap">
                        <div class="board_list">
                            <script>
                                var a = [{ "title": "주말에 학원 몇시까지 문열어?", "content": "안녕하세요 여러분", "name": "익명", "date": "2023.4.21" },
                                { "title": "qkqh", "content": "안녕하세요 여러분2", "name": "익명", "date": "2023.4.24" },
                                { "title": "안녕하세요33", "content": "안녕하세요 여러분3333", "name": "익명", "date": "2023.4.21" },
                                { "title": "안녕하세요3444444", "content": "안녕하세요 444444444", "name": "문상진", "date": "2023.4.18" },
                                { "title": "안녕하세요3444444", "content": "안녕하세요 1231413412321", "name": "문상진", "date": "2023.4.18" }
                                ]

                                for (var i = 0; i < a.length; i++) {
                                    document.write("<div>");
                                    document.write(i + 1);
                                    document.write("<div class='title'>");
                                    document.write("<button style='border: none; background-color:transparent ' onclick={hide3()}>");
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
                                }
                            </script>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%@ include file = "footer.jsp" %>
    </div>
</body>

</html>