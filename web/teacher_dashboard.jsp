<%-- 
    Document   : teacher_dashboard
    Created on : May 8, 2023, 12:16:30 AM
    Author     : shahmdmesbahulislam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.User" %>
<%@page import="dao.teacherDao,dao.teachesDao, dao.courseDao" %>
<%@page import="helper.ConnectionProvider,helper.Enrollment, helper.RegisteredStudent" %>
<%@page import="java.util.ArrayList" %>
<%--<%@page  %>--%>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", 0);
User user = (User) session.getAttribute("current_user");
if(user == null){
        response.sendRedirect("login.jsp");
    }


String teacherName = null;
String teacherEmail = null;
if(user != null){
    teacherName = user.getName();
    teacherEmail = user.getEmail();
}
teacherDao dao = new teacherDao(ConnectionProvider.getConnection());
int tId = dao.gettId(teacherName,teacherEmail);
                
teachesDao dao1 = new teachesDao(ConnectionProvider.getConnection());
ArrayList<Enrollment>en1 = dao1.getInformationAboutEnrolledCoursesByTeacherId(tId);
       

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link href="css/teacherDashboard.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body::before {
                content: "";
                background-image: url("img/school_back.jpg");
                background-size: cover;
                background-position: center center;
                background-repeat: no-repeat;
                background-attachment: fixed;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                z-index: -1;
                opacity: 0.05; /* Change the opacity value here */
            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-5">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <i class="fa-solid fa-school"></i> OurSchool</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <ul class="navbar-nav">
                        <li><a class="nav-link active" aria-current="page" href="teacher_dashboard.jsp"><i class="fa-solid fa-house"></i> Dashboard</a></li>
                        <!--<li><a class="nav-link" href="#">blah</a></li>-->
                        <!--                        <li><a class="nav-link" href="#">My profile</a></li>
                                                <li><a class="nav-link" href="#">Log out</a></li>-->
                        <!-- <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
                    </ul>
                    <ul class="navbar-nav" style="margin-left: auto">
                        <!--                        <li><a class="nav-link active" aria-current="page" href="#">Home</a></li>
                                                <li><a class="nav-link" href="#">blah</a></li>-->
                        <li><a class="nav-link" href="#"><i class="fa fa-user-circle fa-beat"></i> <%if(user != null){%><%=user.getName() %> <%} %></a></li>
                        <li><a class="nav-link" href="logoutServlet"><i class="fa-solid fa-right-from-bracket fa-beat"></i> Log out</a></li>
                        <!-- <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
                    </ul>
                </div>
            </div>
        </nav>
        <!--End of navbar-->
        <div class="container d-flex justify-content-start mb-4">
            <h1>Enrolled Courses</h1>
        </div>
        <div class="container mb-5" style="display: grid;
             grid-gap: 20px;
             grid-template-columns: repeat(auto-fill,minmax(350px,1fr));">
            <%
                for(Enrollment c:en1){
            %>
            <div class="card text-white bg-secondary mb-3" style="width: 18rem;">
                <!--<img src="..." class="card-img-top" alt="...">-->
                <!--<div class="card-header"><h5><%= c.getCourseTitle() %></h5></div>-->
                <div class="card-body">
                    <h5 class="card-title"><%= c.getCourseTitle() %> (<%= c.getCourseCode()%>)</h5>
                    <p class="card-text">Course Credit: <%= c.getCourseCredit() %></p>
                    <p class="card-text">Course Type: <%= c.getCourseType() %></p>
                    <!--<a href="#" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#registeredStudentListModal">Registered Students List</a>-->
                    <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#registeredStudentListModal<%= c.getCourseCode().replace(" ", "") %>">Registered Students List</button>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="registeredStudentListModal<%= c.getCourseCode().replace(" ", "") %>" tabindex="-1" aria-labelledby="registeredStudentListModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="registeredStudentListModalLabel"><%= c.getCourseTitle() %> (<%= c.getCourseCode() %>) - Registered Students List</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Add your registered students list here -->
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Student Name</th>
                                        <th scope="col">Student Email</th>
                                        <th scope="col">Student Gender</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        courseDao dao2 = new courseDao(ConnectionProvider.getConnection());
                                        ArrayList<RegisteredStudent>rs = dao2.getAllRegisteredStudentsUsingcId(c.getcId());
                                        for(RegisteredStudent r:rs){
                                    %>
                                    <tr>
                                        <td><%=r.getStudentName()%></td>
                                        <td><%=r.getStudentEmail()%></td>
                                        <td><%=r.getStudentGender()%></td>
                                    </tr>
                                    <%
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
        <div class="container mb-5">
            <hr style="height: 10px;
                border: none;
                background: linear-gradient(to right, red, orange, yellow, green, blue, indigo, violet);">

        </div>
        <div class="container mb-5">
            <h2>Management System</h2>
        </div>
        <!-- <button class="btn btn-primary rounded-circle btn-lg m-3 p-5">Large Button</button>
        <button class="btn btn-primary rounded-circle btn-sm">Small Button</button> -->
        <div class="container" style="display: grid;
             grid-gap: 20px;
             grid-template-columns: repeat(auto-fill,minmax(350px,1fr));">
            <button class="btn btn-outline-danger rounded-circle btn-lg m-3 p-5">Grade book</button>
            <button class="btn btn-outline-info rounded-circle btn-lg m-3 p-5">assignments</button>
            <button class="btn btn-outline-warning rounded-circle btn-lg m-3 p-5">Attendance</button>
            <button class="btn btn-outline-success rounded-circle btn-lg m-3 p-5">Discussion</button>
            <button class="btn btn-outline-success rounded-circle btn-lg m-3 p-5">Reports</button>

        </div>

        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>



<!--<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>
<body>
        
</body>
</html>-->