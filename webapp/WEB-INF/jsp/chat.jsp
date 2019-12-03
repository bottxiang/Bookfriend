<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
    <div class="chat-container">
        <h2>您(<span style="color: red;">${user.uid}</span>)正在与<span style="color: red;">${toUser}</span>聊天</h2>
        <p class="test"></p>
        <div id="chat-box">
            <%--这里是chat panel--%>
        </div>
        <div>
            <textarea class="form-control" style="width: 500px; margin: 0 auto;" rows="2" id="contentInp" placeholder="请输入消息...(按回车键发送)"></textarea>
        </div>
        <div class="btn-func" style="width: 500px; margin: 0 auto;">
            <button class="btn btn-success send" onclick="sendMessage();">发送</button>
            <button class="btn btn-danger" onclick="doClear();">删除我发的消息</button>
            <button class="btn btn-warning" onclick="doClose();">退出聊天</button>

        </div>
    </div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
    var ws = new WebSocket("ws://localhost:8080/chat/${user.uid}"); //controller层url

    function sendMessage() {
        var message = $("#contentInp").val();
        doSend(message);
        //$(".test").val("hello");
        $("textarea").val("");
        var scrollHeight = $("#chat-box").prop("scrollHeight");
        $('#chat-box').animate({scrollTop: scrollHeight}, 400)
    }

    $(function(){
        $("#contentInp").keyup(function(evt){
            if(evt.which == 13){ //enter键发送消息
                sendMessage();
            }
        });
    });

    ws.onopen = function(){
        preppendHtm("<p class=\"left red\">系统提示：连接成功！</p>");
        loadHistoryMessage();
    }

    // 从服务端接收到消息，将消息回显到聊天记录区
    ws.onmessage = function(evt){
        var s = evt.data;
        var index = s.indexOf(":");
        var side = s.substring(0, index) == ${user.uid}?"right":"left";
        appendHtm('<p class="' + side + '">' + s.substring(index+1)+ '</p>');
    }

    ws.onerror = function(){
        appendHtm("<p class=\"left red\">系统提示：连接失败！</p>");
    }

    ws.onclose = function(){
        appendHtm("<p class=\"left red\">系统提示：连接关闭！</p>");
    }

    function preppendHtm(htm){
        $("#chat-box").prepend(htm)
    }
    function appendHtm(htm){
        $("#chat-box").append(htm)
    }
    function loadHistoryMessage() {
        $.get("/message/history?uid=${user.uid}", function (data, status) {
            var messages = data;
            var i;
            for (i = 0; i < messages.length; i++) {
                var message = messages[i];
                var side = message.from == ${user.uid} ? "right":"left";
                appendHtm('<p class="' + side + '">' + message.content+ '</p>');
            }
        });
    }

    // 注销登录
    function doClose(){
        ws.close();
    }

    // 发送消息
    function doSend(message){
        var jsonMsg = {"sendUser":${user.uid},"toUser":${toUser},"message":message}
        ws.send(JSON.stringify(jsonMsg));
    }
    function say() {

    }
    function doClear(){
        $.ajax({
            url: "/message/delete_m?from=${user.uid}&to=${toUser}",
            async: true,
            success: function(result){

            }
        });

        $("#chat-box").empty();
        preppendHtm("<p class=\"left red\">系统提示：连接成功！</p>");
        loadHistoryMessage();
    }
</script>
</html>
