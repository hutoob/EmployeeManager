<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工信息管理系统登录页面</title>
    <link rel="stylesheet" href="resource/layui/css/layui.css"/>
    <link rel="stylesheet" href="css/login.css"/>
    <script src="js/jquery-1.11.0.js"></script>
    <script src="resource/layui/layui.js"></script>
</head>
<body>
<div class="wrap">
    <img src="image/beijing.jpg" class="imgStyle">
    <div class="loginForm">
        <form class="layui-form">
            <div class="logoHead">
                <h2 style="margin-top: 15px">公司员工信息管理系统</h2>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>用&nbsp户&nbsp名:</label>
                </div>
                <div class="usernameDiv">
                    <i class="layui-icon layui-icon-username adminIcon"></i>
                    <input id="loginUsername" class="layui-input adminInput"  type="text" name="username" placeholder="输入用户名" >
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>密&nbsp&nbsp&nbsp&nbsp&nbsp码:</label>
                </div>
                <div class="passwordDiv">
                    <i class="layui-icon layui-icon-password adminIcon"></i>
                    <input id="loginPassword" class="layui-input adminInput" type="password" name="password" placeholder="输入密码">
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>身&nbsp&nbsp&nbsp&nbsp&nbsp份:</label>
                </div>
                <div class="cardDiv">
                    <select name="status" lay-verify="required" lay-filter="status" id="status">
                        <option value="" selected></option>
                        <option value="员工">员工</option>
                        <option value="管理员">管理员</option>
                    </select>
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="submitDiv">
                    <input id="loginBtn" type="button" class="submit layui-btn layui-btn-primary" value="登录"></input>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['layer','form'],function () {
        var layer = layui.layer,
        form=layui.form;
    })
    $(function () {
        $('#loginBtn').click(function () {
            login();
        });
    });
    function verify() {
        var loginUsername = $('#loginUsername').val();
        var loginPassword = $('#loginPassword').val();
        var selId = document.getElementById("status");
        var seleIndex =selId.selectedIndex;
        var status=selId.options[seleIndex].value;
        if ($.trim(loginUsername) == '' || $.trim(loginUsername).length<=0){
            layer.alert("用户名不能为空");
            return false;
        }
        if ($.trim(loginPassword) == '' || $.trim(loginPassword).length<=0){
            layer.alert("密码不能为空");
            return false;
        }
        if($.trim(status) == '' || $.trim(status).length<=0){
            layer.alert("身份不能为空");
            return false;
        }
        return true;
    }
    function login() {
        if(verify()){
            var account=$('#loginUsername').val();
            var password=$('#loginPassword').val();
            var selId = document.getElementById("status");
            var seleIndex =selId.selectedIndex;
            var status=selId.options[seleIndex].value;
            $.post("Servlet?method=login",{"account":account,"password":password,"status":status},function (data) {
                if(data=="员工"){
                    location.href="employee.jsp?emid="+account;
                }
                else if(data=="管理员"){
                    location.href="administrator.jsp";
                }
                else {
                    layer.alert(data);
                }
            });
        }
    }
</script>
</body>
</html>
