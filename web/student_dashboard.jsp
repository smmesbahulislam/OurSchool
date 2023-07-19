<%-- 
    Document   : student_dashboard
    Created on : May 8, 2023, 12:15:38 AM
    Author     : shahmdmesbahulislam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.User" %>
<%@page import="dao.teacherDao,dao.teachesDao,dao.studentDao,dao.takesDao" %>
<%@page import="helper.ConnectionProvider,helper.Enrollment,helper.RegisteredCourse" %>
<%@page import="java.util.ArrayList" %>

<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", 0);
User user = (User) session.getAttribute("current_user");
if(user == null){
        response.sendRedirect("login.jsp");
    }
%>

<%
          String studentName = null;
          String studentEmail = null;
                
          if(user != null){
                    studentName = user.getName();
                    studentEmail = user.getEmail();
          }
          studentDao dao1 = new studentDao(ConnectionProvider.getConnection());
          int sId = dao1.getsId(studentName,studentEmail);
          
          
          teachesDao dao = new teachesDao(ConnectionProvider.getConnection());
          ArrayList<Enrollment>list3 = dao.getInformationAboutEnrolledCourses();
          
//          get all registered courses for student
         takesDao dao2 = new takesDao(ConnectionProvider.getConnection());
         ArrayList<RegisteredCourse>list4 = dao2.getInformationAboutRegisteredCourses(sId);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link href="css/studentDashboard.css" rel="stylesheet" type="text/css"/>
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
                <a class="navbar-brand" href="#"><i class="fa-solid fa-school"></i> OurSchool</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <ul class="navbar-nav">
                        <li><a class="nav-link active" aria-current="page" href="student_dashboard.jsp"><i class="fa-solid fa-house fa-fade"></i> Dashboard</a></li>
                        <li><a class="nav-link active" aria-current="page" href="#" data-bs-toggle="modal" data-bs-target="#courseRegistrationModal"><i class="fa-regular fa-id-card fa-fade"></i> Course Registration</a></li>

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
            <h1>Registered Courses</h1>
        </div>
        <div class="container mb-5" style="display: grid;
             grid-gap: 20px;
             grid-template-columns: repeat(auto-fill,minmax(350px,1fr));">

            <%
                for(RegisteredCourse rc:list4){
            %>
            <div class="card text-white bg-secondary mb-3" style="width: 22rem;">
                <!--<img src="..." class="card-img-top" alt="...">-->
                <div class="card-body">
                    <h5 class="card-title"><%= rc.getCourseTitle() %> (<%= rc.getCourseCode()%>)</h5>
                    <p class="card-text">Course Credit: <%= rc.getCourseCredit() %></p>
                    <p class="card-text">Course Type: <%= rc.getCourseType() %></p>
                    <p class="card-text">Course Instructor: <%= rc.getTeacherName() %></p>
                    <p class="card-text">Course Instructor Email: <%= rc.getTeacherEmail() %></p>
                </div>
                <div class="card-footer">
                    <a href="#" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#courseDetailsModal">Course Details</a>

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
        <!--            <div class="container mb-5">
                      <h2>Management System</h2>
                    </div>
                    <button class="btn btn-primary rounded-circle btn-lg m-3 p-5">Large Button</button>
                    <button class="btn btn-primary rounded-circle btn-sm">Small Button</button> 
                     <div class="container" style="display: grid;
                        grid-gap: 20px;
                        grid-template-columns: repeat(auto-fill,minmax(350px,1fr));">
                        <button class="btn btn-outline-danger rounded-circle btn-lg m-3 p-5">Enrollment management</button>
                        <button class="btn btn-outline-info rounded-circle btn-lg m-3 p-5">Access Control</button>
                        <button class="btn btn-outline-warning rounded-circle btn-lg m-3 p-5">Student management</button>
                        <button class="btn btn-outline-success rounded-circle btn-lg m-3 p-5">Instructor management</button>
                    
                    </div>  -->

        <!--start of course registration modal-->
        <div class="modal fade" id="courseRegistrationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Register Course</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="registerCourseForm" action="courseRegistrationServlet" method="POST">
                            <select required name="course_id" class="form-select" aria-label="Default select example">
                                <option selected value="">---Select Course---</option>
                                <%
                                    for(Enrollment cc:list3){
                                %>
                                <option value="<%=cc.getcId()%>"><%= cc.getCourseTitle()%>(<%=cc.getCourseCode()%>) taken by <%=cc.getTeacherName() %></option>
                                <%
                                }
                                %>
                            </select><br>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Register</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    </div>
                </div>
            </div>
        </div>
        <!--end of course registration modal-->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

        <!--course registration js-->
        <script>
            $(document).ready(function(){
                console.log("loaded.");
                $("#registerCourseForm").on('submit',function(event){
                    event.preventDefault();
                    $("#courseRegistrationModal").modal('hide');
                    console.log("you have clicked the button");
                    let form = new FormData(this);
                    
                    $.ajax({
                        url:"courseRegistrationServlet",
                        type:"POST",
                        data:form,
                        success:function(data,textStatus,jqXHR){
                            console.log(data);
                            $('#registerCourseForm select').val("");
                        },
                        error:function(jqXHR,textStatus,errorThrown){
//                            error
                        },
                        processData:false,
                        contentType:false
                    });
                });
            });
        </script>
        <!--end of course registration js-->
    </body>
</html>



