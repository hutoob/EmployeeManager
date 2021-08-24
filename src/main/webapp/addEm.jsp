<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加员工信息</title>
    <link rel="stylesheet" href="resource/layui/css/layui.css">
    <script src="js/jquery-1.11.0.js"></script>
    <script src="resource/layui/layui.js"></script>
    <style>
        .contain{
            width: 420px;
            height: 320px;
            min-height: 320px;
            max-height: 320px;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            margin: auto;
            padding: 20px;
            z-index: 130;
            border-radius: 8px;
            font-size: 16px;
            background-color:#fff;
            box-shadow: 0 3px 18px;
        }
        #addBtn{
            margin-left: 180px;
        }
    </style>
</head>
<body>
    <div class="contain">
        <form class="layui-form">
            <div class="layui-form-item">
                    <label class="layui-form-label">编号：</label>
                <div class="layui-input-inline">
                    <input type="text" required lay-verify="required" class="layui-input" id="id" name="id" placeholder="请输入编号"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名：</label>
                <div class="layui-input-inline">
                    <input type="text" required lay-verify="required" class="layui-input" id='name' name="name" placeholder="请输入姓名"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-block">
                    <input type="radio" value="男" name="sex" id="sex" title="男" checked/>
                    <input type="radio" value="女" name="sex" title="女"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">部门：</label>
                <div class="layui-input-inline">
                    <select  name="department" lay-verify="required" lay-filter="department" id="department">
                        <option value="" selected></option>
                        <option value="财务部门">财务部门</option>
                        <option value="销售部门">销售部门</option>
                        <option value="技术部门">技术部门</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">级别：</label>
                <div class="layui-input-inline">
                    <select name="level" lay-verify="required" lay-filter="level" id="level">
                        <option value="" selected></option>
                        <option value="经理">经理</option>
                        <option value="技术人员">技术人员</option>
                        <option value="销售人员">销售人员</option>
                        <option value="销售经理">销售经理</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input id="addBtn" type="button" class="submit layui-btn layui-btn-md" value="添加"/>
                </div>
            </div>
        </form>
    </div>
<script>
    layui.use(['form','layer'],function () {
        var form=layui.form
        ,layer=layui.layer;
    });
    $(function () {
        $('#addBtn').click(function () {
            addEm();
        });
    });
    function verify(){
        var id=$("#id").val();
        alert(id);
        var name=$("#name").val();
        var selId = document.getElementById("department");
        var seleIndex =selId.selectedIndex;
        var department=selId.options[seleIndex].value;
        selId = document.getElementById("level");
        seleIndex =selId.selectedIndex;
        var level=selId.options[seleIndex].value;
        if ($.trim(id) == '' || $.trim(id).length<=0){
            layer.alert("编号不能为空");
            return false;
        }
        if ($.trim(name) == '' || $.trim(name).length<=0){
            layer.alert("姓名不能为空");
            return false;
        }
        if ($.trim(department) == '' || $.trim(department).length<=0){
            layer.alert("部门不能为空");
            return false;
        }
        if ($.trim(level) == '' || $.trim(level).length<=0){
            layer.alert("级别不能为空");
            return false;
        }
        return true;
    }
    function addEm() {
        if(verify()){
            var id=$("#id").val();
            var name=$("#name").val();
            var selId = document.getElementById("department");
            var seleIndex =selId.selectedIndex;
            var department=selId.options[seleIndex].value;
            selId = document.getElementById("level");
            seleIndex =selId.selectedIndex;
            var level=selId.options[seleIndex].value;
            var sex=$("input[name='sex']:checked").val();
            $.post('Servlet?method=addEm',{"id":id,"name":name,"sex":sex,"department":department,"level":level},function (data) {
                alert(data);
            })
        }
    }
</script>
</body>
</html>
