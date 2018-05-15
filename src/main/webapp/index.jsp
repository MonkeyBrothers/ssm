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
                       <th>ID</th>
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
        <div class="col-md-6" id="page_info_area">

        </div>
        <%--存放大的分页--%>
        <div>
            <nav aria-label="Page navigation" id="page_nva_area">

            </nav>
        </div>
    </div>

</div>
<script type="text/javascript">

    $(function () {
        to_page(1);
    });

    // 抽取出方法，加载即是第一页
    function to_page(pageNumber) {
        $.ajax({
            url:"/user",
            data:"pageNumber=" + pageNumber,
            type:"GET",
            success:function (result) {
                // console.log(result);
                // 解析并显示员工数据
                build_user_table(result);
                // 解析并显示分页数据
                bulid_page_info(result);
                // 显示分页导航
                build_page_nav(result);

            }
        });
    }

    // 解释显示员工信息函数
    function build_user_table(result) {
        // 清空数据
        $("#user_table tbody").empty();
        var users = result.extend.pageInfo.list;
        // 循环遍历
        $.each(users, function (index, item) {
            var userId = $("<td></td>").append(item.uId);
            var userName = $("<td></td>").append(item.username);
            var email = $("<td></td>").append(item.email);
            var gender = $("<td></td>").append(item.gender=='m'?"男":"女");
            var deptId = $("<td></td>").append(item.department.deptname);
            var editBtn = $("<button></button>")
                            .addClass("btn btn-success btn-primary btn-sm")
                            .append("<span></span>")
                            .addClass("glyphicon glyphicon-pencil").append("编辑");

            var delBtn = $("<button></button>")
                // 添加样式
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
    // 解释显示分页信息
    function bulid_page_info(result) {
        // 清空数据
        $("#page_info_area").empty();
        // 通过ID选择器找到对应的区域
        $("#page_info_area")
            // 链式编程追加元素
            .append("当前第" + result.extend.pageInfo.pageNum +"页，共"+
                result.extend.pageInfo.pages + "页，共"+ result.extend.pageInfo.total +"记录数");
    }

    // 显示分页导航栏
    function build_page_nav(result) {
        // 清空数据
        $("#page_nva_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            // 点击首页
            firstPageLi.click(function () {
                to_page(1);
            });
            // 点击上一页箭头
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }


        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            // 点击下一页
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });

            // 点击末页
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }


        // 添加下一页和末页提示信息
        ul.append(nextPageLi)
        .append(lastPageLi);
        // 把ul放入到nav
        var naeEle = $("<nva></nva>").append(ul);
        naeEle.appendTo("#page_nva_area");


    }
    
</script>
</body>
</html>
