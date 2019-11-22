<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<div>
    <div><span>Me: ${user.uid}</span>
        <button class="btn btn-warning" onclick="doClose();">退出聊天</button>
    </div>
    <p class="test"></p>
    <div id="chat-box">
        系统提示：开始聊天<br/>
        <p class="left">left left left</p>
        <p class="right">right right rigth</p>
        <p class="left">left left left</p>
        <p class="right">right right rigth</p>
    </div>
    <div><textarea class="form-control" style="width: 500px; margin: 0 auto;" rows="2" id="contentInp" placeholder="请输入消息...(按回车键发送)"></textarea></div><hr/>
    <div><button class="btn btn-danger" onclick="doClear();">删除我发的消息</button></div>
</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
    var ws = new WebSocket("ws://localhost:8080/chat/${user.uid}"); //controller层url
    $(function(){
        $("#contentInp").keyup(function(evt){
            if(evt.which == 13){ //enter键发送消息
                var message = $("#contentInp").val();
                doSend(message);
                $("textarea").val("");
            }
        });
    })

    ws.onopen = function(){
        preppendHtm("系统提示：连接成功！<br>");
    }

    // 从服务端接收到消息，将消息回显到聊天记录区
    ws.onmessage = function(evt){
        var s = evt.data;
        $(".test").append(evt.data);
        var index = s.indexOf(":");
        var side = s.substring(0, index) == ${user.uid}?"right":"left";
        appendHtm('<p class="' + side + '">' + s.substring(index+1)+ '</p>');
    }

    ws.onerror = function(){
        appendHtm("系统提示：连接失败！");
    }

    ws.onclose = function(){
        appendHtm("系统提示：连接关闭！");
    }

    function preppendHtm(htm){
        $("#chat-box").prepend(htm)
    }
    function appendHtm(htm){
        $("#chat-box").append(htm)
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

    function doClear(){
        $("#chat-box").empty();
    }
</script>
</html>
