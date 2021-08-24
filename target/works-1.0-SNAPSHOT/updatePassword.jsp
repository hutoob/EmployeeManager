<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="resource/layui/css/layui.css">
    <script src="js/jquery-1.11.0.js"></script>
    <script src="resource/layui/layui.js"></script>
</head>
<body>
<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">新&nbsp&nbsp密&nbsp&nbsp码:</label>
        <div class="layui-input-inline">
            <input type="password" class="layui-input" placeholder="请输入新密码" lay-verify="required" id="password" name="password"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认新密码:</label>
        <div class="layui-input-inline">
            <input type="password" class="layui-input" placeholder="请再次确认新密码" lay-verify="required" id="repassword"/>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <input type="button" class="layui-input layui-btn" value="确认" id="sure"/>
        </div>
    </div>
</form>
<script>
    layui.use(['layer','form'],function () {
        var layer=layui.layer
            ,form=layui.form;
    });
    $(function () {
        $('#sure').click(function () {
            up();
        });
    });
    function verify() {
        var password=$('#password').val();
        var repassword=$('#repassword').val();
        if ($.trim(password) == '' || $.trim(password).length<=0){
            layer.alert("新密码不能为空");
            return false;
        }
        if ($.trim(repassword) == '' || $.trim(repassword).length<=0){
            layer.alert("确认密码不能为空");
            return false;
        }
        if($.trim(password) !=$.trim(repassword)){
            layer.alert("两次密码不一致");
            return false;
        }
        return true;
    }
    function up() {
        if(verify()){
            var password=$('#password').val();
            $.post("Servlet?method=updatePassword",{"password":password},function (data){
                layer.alert(data);
            });
        }
    }
</script>
</body>
</html>
