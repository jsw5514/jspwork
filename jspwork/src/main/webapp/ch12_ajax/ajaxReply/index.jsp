<%--
  Created by IntelliJ IDEA.
  User: jsw5514
  Date: 25. 10. 20.
  Time: 오후 6:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판 댓글 달기</title>
    <style>
        body{ text-align: center;}
        img {width: 800px;}
        table {border:2px solid; width : 800px; border-collapse:collapse; margin: 0 auto;}
        th, td { border: 1px solid;}
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <img src="<%=request.getContextPath()%>/image/board.png">
    <table id="replies">
        <thead>
            <tr>
                <th>댓글 작성</th>
                <th>
                    <textarea rows="3" cols="50" id="replyContent"></textarea>
                </th>
                <th>
                    <input type="button" id="replyBtn" value="댓글등록">
                </th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
    <script>
        $(()=>{
            replyList();
            setInterval(replyList,1000);
        })
        
        function replyList(){
            $.ajax({
                url: "rlist.bo",
                data: {bno: "1"},
                success: function(list){
                    console.log(list);
                    let result = ""
                    for(let i=0;i<list.length;i++){
                        result += "<tr>"
                            + "<td>" + list[i].no + "</td>"
                            + "<td>" + list[i].content + "</td>"
                            + "<td>" + list[i].name + "</td>"
                            + "<td>" + list[i].redate + "</td>"
                            + "</tr>";
                    }
                    $('#replies tbody').html(result);
                },
                error: function() {
                    console.log('ajax 통신 실패')
                }
            })
        }
        
        $.ajax({
            url: "rlist.bo",
            data: {
                content: $('#replyContent').val,
                bno: "1"
            },
            type: 'POST',
            success: function(result){
                console.log(result);
                if(result>0){
                    $('#replyContent').val = ""
                }
            },
            error: function() {
                console.log('error')
            }
        })
    </script>

</body>
</html>
