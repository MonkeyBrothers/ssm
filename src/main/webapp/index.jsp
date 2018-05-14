<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page  isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.min.css" >
    <link rel="stylesheet" href="/fonts/bootstrap.min.css" >
    <script src="/js/jquery-3.3.1.js" >
    </script>
    <title>学习增删改查</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 col-md-offset-9">
            <button class="btn btn-success">增加</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>


    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="user_table">
               <thead>
                   <tr>
                       <th>#</th>
                       <th>empName</th>
                       <th>gender</th>
                       <th>email</th>
                       <th>deptName</th>
                       <th>操作</th>
                   </tr>
               </thead>
                <tbody>

                </tbody>


            </table>
        </div>
    </div>


    <div class="row">
        <%--存放小的分页--%>
        <div class="col-md-6">
            当前第 页,共  页,共 记录数
        </div>
        <%--存放大的分页--%>
        <div>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="/user?pageNumber=1">首页</a></li>


                    <li><a href="/user?pageNumber=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>

</div>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"/user",
            data:"pageNumber=1",
            type:"GET",
            success:function (result) {
                // console.log(result);
                // 解析并显示员工数据
                build_user_table(result);
                // 解析并显示分页数据
            }
        });
    });
    
    function build_user_table(result) {
        var users = result.extend.pageInfo.list;
        $.each(users, function (index, item) {
            var userId = $("<td></td>").append(item.uId);
            var userName = $("<td></td>").append(item.username);
            var email = $("<td></td>").append(item.email);
            var gender = $("<td></td>").append(item.gender=='m'?"男":"女");
            var deptId = $("<td></td>").append(item.department.deptname);
            /**
             *   <button class="btn btn-success btn-primary btn-sm">
             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
             编辑</button>
             * @type {*|jQuery}
             */
            var editBtn = $("<button></button>")
                            .addClass("btn btn-success btn-primary btn-sm")
                            .append("<span></span>")
                            .addClass("glyphicon glyphicon-pencil").append("编辑");

            var delBtn = $("<button></button>")
                .addClass("btn btn-danger btn-primary btn-sm")
                .append("<span></span>")
                .addClass("glyphicon glyphicon-trash").append("删除");

            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

            $("<tr></tr>").append(userId)
                .append(userName)
                .append(gender)
                .append(email)
                .append(deptId)
                .append(btnTd)
                .appendTo("#user_table tbody");
        });
    }
    
</script>
</body>
</html>
