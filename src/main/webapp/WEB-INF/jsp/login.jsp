<%--
  Created by IntelliJ IDEA.
  User: ^_^
  Date: 2018/5/7
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/bootstrap.min.css" >
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 col-md-offset-12">
            <button class="btn btn-success">增加</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>


    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th> 
                </tr>


                <tr>
                    <th>1</th>
                    <th>侯瑞阳</th>
                    <th>男</th>
                    <th>2507511047@qq.com</th>
                    <th>开发部</th>
                    <th>
                        <button class="btn btn-success btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        编辑</button>
                        <button class="btn btn-danger btn-primary btn-sm">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除</button>
                    </th>
                </tr>
            </table>
        </div>
    </div>


    <div class="row">
        <%--存放小的分页--%>
        <div></div>
        <%--存放大的分页--%>
        <div>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

</div>
</body>
</html>
