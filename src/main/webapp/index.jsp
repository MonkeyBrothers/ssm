<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page  isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <script src="/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/css/bootstrap.min.css" >


    <title>学习增删改查</title>
</head>
<body>
<div class="container">


    <%--添加模态框修改员工信息--%>
    <!-- Modal -->
    <div class="modal fade" id="updateUserModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="updateUser">修改用户</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="update_user_form">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="static_username"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password_update_input" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" name="password" class="form-control" id="password_update_input" placeholder="Password">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="update_email_input" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="update_email_input" placeholder="2507511047@qq.com">
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="update_gender_m" value="m"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="update_gender_w" value="w"> 女
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email_input" class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-3">
                                <select class="form-control" name="deptId" id="update_user_select">
                                </select>
                            </div>
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="update_user_btn">修改</button>
                </div>
            </div>
        </div>
    </div>


    <%--添加模态框--%>
        <!-- Modal -->
        <div class="modal fade" id="userAndModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">用户添加</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="save_form">
                            <div class="form-group">
                                <label for="user_input" class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-10">
                                    <input type="text"  name="username" class="form-control" id="user_input" placeholder="用户名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password_input" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" name="password" class="form-control" id="password_input" placeholder="Password">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email_input" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-10">
                                    <input type="text" name="email" class="form-control" id="email_input" placeholder="2507511047@qq.com">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="inlineRadio1" value="m"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="inlineRadio2" value="w"> 女
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email_input" class="col-sm-2 control-label">部门</label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="deptId" id="add_select">
                                    </select>
                                </div>
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="save_btn">保存</button>
                    </div>
                </div>
            </div>
        </div>

    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 col-md-offset-9">
            <button class="btn btn-success" id="add_user_model_btn">增加</button>
            <button class="btn btn-danger" id="delete_selectUser_btn">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="user_table">
               <thead>
                   <tr>
                       <th><input type="checkbox" id="checked-input"></th>
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
    var totalRecord,currentPage;
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
            var checkBoxTd = $("<td><input type='checkbox' class='checked-items'> </td>")
            var userId = $("<td></td>").append(item.uId);
            var userName = $("<td></td>").append(item.username);
            var email = $("<td></td>").append(item.email);
            var gender = $("<td></td>").append(item.gender=='m'?"男":"女");
            var deptId = $("<td></td>").append(item.department.deptname);
            var editBtn = $("<button></button>")
                            .addClass("btn btn-success btn-primary btn-sm edit-btn")
                            .append("<span></span>")
                            .addClass("glyphicon glyphicon-pencil").append("编辑");
            // 添加自定义属性表示当前员工ID
            editBtn.attr("edit-id", item.uId);
            var delBtn = $("<button></button>")
                // 添加样式
                .addClass("btn btn-danger btn-primary btn-sm delete-btn")
                .append("<span></span>")
                .addClass("glyphicon glyphicon-trash").append("删除");
            delBtn.attr("delete-btn", item.uId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(userId)
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
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
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
    // 点击添加按钮
    $("#add_user_model_btn").click(function () {
        // alert("test");
        // 查询所有部门
        getDepts("#add_select");
        // 添加模态框
        $('#userAndModel').modal({
            backdrop:'static'
        });
    });
    // 查出所有部门并在下拉列表中显示
    function getDepts(elem) {
        $(elem).empty();
        $.ajax({
            url:"/depts",
            type:"GET",
            success:function (result) {
               $.each(result.extend.depts, function () {
                   var optionEle = $("<option></option>").attr("value", this.deptId).append(this.deptname);
                   optionEle.appendTo(elem);
               });
            }
        });
    }
    // 点击提交按钮进行提交表单
    $("#save_btn").click(function () {
        $.ajax({
           url:"/user",
            type:"POST",
            data:$("#save_form").serialize(),
            success:function (result) {
                $('#userAndModel').modal('hide');
                to_page(totalRecord);
                alert(result.message);

        }
        });
    });

    $(document).on("click", ".edit-btn", function () {
        // alert("test");

        // 查处部门信息，显示部门列表
        getDepts("#updateUserModel select");
        // 查出员工信息，显示员工信息
        getUser($(this).attr("edit-id"));
        // 把员工ID传递给模态框的更新按钮
        $("#update_user_btn").attr("edit-id", $(this).attr("edit-id"))
        $('#updateUserModel').modal({
            backdrop:'static'
        });
    });
    function getUser(id) {
        $.ajax({
            url:"/user/"+id,
            type:"GET",
            success:function (result) {
                var userData = result.extend.user;
                $("#static_username").text(userData.username);
                $("#password_update_input").val(userData.password);
                $("#update_email_input").val(userData.email);
                // 更新性别
                $("#updateUserModel input[name=gender]").val([userData.gender]);
                $("#updateUserModel select").val([userData.deptId]);

            }
        });
    }
    // 更新按钮功能
    $("#update_user_btn").click(function () {
       $.ajax({
           url:"/user/"+$(this).attr("edit-id"),
           type:"POST",
           data:$("#updateUserModel form").serialize()+"&_method=PUT",
           success:function (result) {
               $("#updateUserModel").modal("hide");
               to_page(currentPage);
           }
       });
    });
    // 删除功能
    $(document).on("click", ".delete-btn", function () {
        //
        var usernameId = $(this).attr("delete-btn");
        var userName = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确认删除【"+ userName +"】吗？")) {
            // 确认删除发送ajax
            $.ajax({
                url:"/user/"+ usernameId,
                type:"DELETE",
                success:function (result) {
                    alert(result.message);
                    to_page(currentPage);
                }
            });
        }
    });
    // 完成全选全不选
    $("#checked-input").click(function () {
        $(".checked-items").prop("checked", $(this).prop("checked"));
    });
    $(document).on("click", ".checked-items",function () {
        var flag = $(".checked-items:checked").length==$(".checked-items").length;
        $("#checked-input").prop("checked", flag);
    })
    // 点击全部删除就完成批量删除
    $("#delete_selectUser_btn").click(function () {
        var userNames = "";
        var del_idstr = "";
        $.each($(".checked-items:checked"), function () {
            userNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        userNames = userNames.substring(0, userNames.length-1);
        del_idstr = del_idstr.substring(0, del_idstr.length-1);
        if(confirm("确认删除【"+ userNames+"】吗？")){
            // 发送Ajax请求
            $.ajax({
               url:"/user/"+del_idstr,
               type:"DELETE",
               success:function (result) {
                   alert(result.message);
                   to_page(currentPage);
               }
            });
        }
    });
    
</script>
</body>
</html>
