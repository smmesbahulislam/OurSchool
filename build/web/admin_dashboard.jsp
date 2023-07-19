<%-- 
    Document   : admin_dashboard
    Created on : May 8, 2023, 12:17:09 AM
    Author     : shahmdmesbahulislam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Course,entities.Teacher,entities.User" %>
<%@page import="helper.ConnectionProvider,helper.Enrollment" %>
<%@page import="dao.courseDao,dao.teacherDao,dao.teachesDao" %>
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link href="css/adminDashboard.css" rel="stylesheet" type="text/css"/>
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
                        <li><a class="nav-link active" aria-current="page" href="admin_dashboard.jsp"><i class="fa-solid fa-house"></i> Dashboard</a></li>
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

        <!--management-->
        <div class="container mb-5">
            <h2>Management System</h2>
        </div>
        <!-- <button class="btn btn-primary rounded-circle btn-lg m-3 p-5">Large Button</button>
        <button class="btn btn-primary rounded-circle btn-sm">Small Button</button> -->
        <div class="container" style="display: grid;
             grid-gap: 20px;
             grid-template-columns: repeat(auto-fill,minmax(350px,1fr));">
            <!--<button class="btn btn-outline-danger rounded-circle btn-lg m-3 p-5">Enrollment management</button>-->
            <button class="btn btn-outline-info rounded-circle btn-lg m-3 p-5" data-bs-toggle="modal" data-bs-target="#courseManagementModal">Course management</button>
            <!--<button class="btn btn-outline-warning rounded-circle btn-lg m-3 p-5">Student management</button>-->
            <button class="btn btn-outline-success rounded-circle btn-lg m-3 p-5" data-bs-toggle="modal" data-bs-target="#instructorManagementModal">Instructor management</button>

        </div>
        <!--End of management sys-->
        <!--divider-->
        <div class="container mb-5">
            <hr style="height: 10px;
                border: none;
                background: linear-gradient(to right, red, orange, yellow, green, blue, indigo, violet);">

        </div>
        <!--end of divider-->


        <div class="container d-flex justify-content-start mb-4">
            <h1>Dashboard overview</h1>
        </div>
        <div class="container mb-5" style="display: grid;grid-gap: 20px;grid-template-columns: repeat(auto-fill,minmax(350px,1fr));">

            <div class="card text-white bg-secondary mb-3" style="width: 18rem;">
                <!--<img src="..." class="card-img-top" alt="...">-->
                <div class="card-body">
                    <h5 class="card-title">Courses</h5>
                    <p class="card-text">Click the button below to see the available courses list.</p>
                    <a href="#" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#courseListModal">Course List</a>
                </div>
            </div>
            <div class="card text-white bg-secondary mb-3" style="width: 18rem;">
                <!--<img src="..." class="card-img-top" alt="...">-->
                <div class="card-body">
                    <h5 class="card-title">Teachers</h5>
                    <p class="card-text">Click the button below to see the available teachers list.</p>
                    <a href="#" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#teacherListModal">Teacher List</a>
                </div>
            </div>
            <div class="card text-white bg-secondary mb-3" style="width: 18rem;">
                <!--<img src="..." class="card-img-top" alt="...">-->
                <div class="card-body">
                    <h5 class="card-title">Enrolled Courses and Teachers</h5>
                    <p class="card-text">Click the button below to see the enrolled courses and teachers list.</p>
                    <a href="#" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#enrolledCoursesAndTeachersModal">Enrollment</a>
                </div>
            </div>
        </div>

        <!--start of course management modal-->
        <div class="modal fade" id="courseManagementModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Course</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addCourseForm" action="addCourseServlet" method="POST">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Course Title</label>
                                <input required name="course_title" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Course Title(i.e:Web Technology)">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Course Code</label>
                                <input required name="course_code" type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter Course Code Here(i.e:CSE350)">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Course Credit</label>
                                <input required name="course_credit" type="number" class="form-control" id="exampleInputPassword1" placeholder="Enter Course Credit Number">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Course Type</label>
                                <select required name="course_type" class="form-control">
                                    <option value="">---Select Course Type---</option>
                                    <option value="Theory">Theory</option>
                                    <option value="Lab">Lab</option>
                                </select>           
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Course Description</label>
                                <textarea rows="5" class="form-control" name="course_description" placeholder="Enter Course Description Here(If Any)"></textarea>
                            </div>
                            <div class="mb-3 text-center">
                                <button type="submit" class="btn btn-primary " >Save</button>
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
        <!--End of course management modal-->


        <!--start of course list modal-->
        <div class="modal fade" id="courseListModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Available Course Lists</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Course Title</th>
                                    <th scope="col">Course Code</th>
                                    <th scope="col">Course Credit</th>
                                    <th scope="col">Course Type</th>
                                    <th scope="col">Course Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    courseDao dao = new courseDao(ConnectionProvider.getConnection());
                                    ArrayList<Course>list1 = dao.getAllCourses();
                                    for(Course cc:list1){
                                %>
                                <tr>
                                    <td><%=cc.getCourseTitle()%></td>
                                    <td><%=cc.getCourseCode()%></td>
                                    <td><%=cc.getCourseCredit()%></td>
                                    <td><%=cc.getCourseType()%></td>
                                    <td><%=cc.getCourseDescription()%></td>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    </div>
                </div>
            </div>
        </div>
        <!--End of course list modal-->

        <!--start of teacher list modal-->
        <div class="modal fade" id="teacherListModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Available Teachers List</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Gender</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    teacherDao dao1 = new teacherDao(ConnectionProvider.getConnection());
                                    ArrayList<Teacher>list2 = dao1.getAllTeachers();
                                    for(Teacher cc:list2){
                                %>
                                <tr>
                                    <td><%=cc.gettName()%></td>
                                    <td><%=cc.gettEmail()%></td>
                                    <td><%=cc.gettGender()%></td>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    </div>
                </div>
            </div>
        </div>
        <!--End of teacher list modal-->

        <!--start of instructor management modal-->
        <div class="modal fade" id="instructorManagementModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Enroll Course To Teacher</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="enrollCourseForm" action="enrollCourseServlet" method="POST">
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Instructor Name</label>
                                <select required name="tId" class="form-control">
                                    <option value="">---Select Teacher---</option>
                                    <%
                                        for(Teacher t:list2){
                                    %>
                                    <option value="<%= t.gettId()%>"><%= t.gettName() %></option>
                                    <%
                                    }
                                    %>
                                </select>           
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Course Details</label>
                                <select required name="cId" class="form-control">
                                    <option value="">---Select Course---</option>
                                    <%
                                        for(Course c:list1){
                                    %>
                                    <option value="<%= c.getcId()%>"><%= c.getCourseTitle() %><p> (<%=c.getCourseType()%> : <%=c.getCourseCode() %>)</p></option>
                                    <%
                                    }
                                    %>
                                </select>           
                            </div>
                            <div class="mb-3 text-center">
                                <button type="submit" class="btn btn-primary " >Enroll</button>
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
        <!--End of instructor management modal-->

        <!--start of enrolled courses and teachers modal-->
        <div class="modal fade" id="enrolledCoursesAndTeachersModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Enrolled Courses and Teachers</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Teacher Name</th>
                                    <th scope="col">Course Title</th>
                                    <th scope="col">Course Code</th>
                                    <th scope="col">Course Credit</th>
                                    <th scope="col">Course Type</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    teachesDao dao3 = new teachesDao(ConnectionProvider.getConnection());
                                    ArrayList<Enrollment>list3 = dao3.getInformationAboutEnrolledCourses();
                                    for(Enrollment cc:list3){
                                %>
                                <tr>
                                    <td><%=cc.getTeacherName()%></td>
                                    <td><%=cc.getCourseTitle()%></td>
                                    <td><%=cc.getCourseCode()%></td>
                                    <td><%=cc.getCourseCredit()%></td>
                                    <td><%=cc.getCourseType()%></td>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    </div>
                </div>
            </div>
        </div>
        <!--end of enrolled courses and teachers modal-->

        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- start of add course js-->
        <script>
            $(document).ready(function (){
                console.log("loaded.");
                $("#addCourseForm").on('submit',function(event){
                    event.preventDefault();
                    $("#courseManagementModal").modal('hide');
                    console.log("You have clicked the save button");
                    let form = new FormData(this);
//                    $("#courseManagementModal").hide();
                    $.ajax({
                        url:"addCourseServlet",
                        type:"POST",
                        data:form,
                        success:function(data,textStatus,jqXHR){
                            console.log(data);
                            $('#addCourseForm input').val('');
                            $('#addCourseForm textarea').val('');
                            $('#addCourseForm select').val('');
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
        <!--end of add course js-->

        <!--start of enroll course and teacher js-->
        <script>
            $(document).ready(function(){
                $("#enrollCourseForm").on('submit',function(event){
                    event.preventDefault();
                    $("#instructorManagementModal").modal('hide');
                    let form = new FormData(this);
                    
                    $.ajax({
                        url:"enrollCourseServlet",
                        type:"POST",
                        data:form,
                        success:function(data,textStatus,jqXHR){
                            console.log(data);
                            $("#enrollCourseForm select").val("");
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
        <!--end of enroll course and teacher js-->
    </body>
</html>


