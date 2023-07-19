<%-- 
    Document   : index
    Created on : May 6, 2023, 11:11:07 PM
    Author     : shahmdmesbahulislam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course Management System</title>
        <!--        <link rel="stylesheet" href="style.css">-->
        <link href="./css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            body {
                background-image: url("img/school_back.jpg");
                background-size: cover;
                background-position: center center;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a href="index.jsp" class="navbar-brand mb-0 h1" style="padding-left: 10px;"><i class="fa-solid fa-school fa-beat-fade fa-xl"></i> 
                    OurSchool
                </a>
                <button class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#Nav"
                        aria-controls="Nav"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >
                    <span class="navbar-toggler-icon"></span>	
                </button>
                <div class="collapse navbar-collapse" id="Nav">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a href="index.jsp" class="nav-link active"><i class="fa-solid fa-house "></i> Home</a>
                        </li>
                        <!--                        <li class="nav-item dropdown">
                                                    <a href="#" class="nav-link dropdown-toggle" role="button"
                                                       id="Dropdown" data-bs-toggle="dropdown" aria-expanded="false">Features</a>
                                                    <ul class="dropdown-menu"
                                                        aria-labelledby="Dropdown">
                                                        <li><a href="#" class="dropdown-item">
                                                                Feature 1
                                                            </a>
                                                        </li>
                                                        <li><a href="#" class="dropdown-item">
                                                                Feature 2
                                                            </a>
                                                        </li>
                                                        <li><a href="#" class="dropdown-item">
                                                                Feature 3
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </li>-->
                        <!--                        <li class="nav-item active">
                                                    <a href="#" class="nav-link">About us</a>
                                                </li>-->
                    </ul>
                </div>
                <!--                <form class="d-flex">
                                    <input type="text" class="form-control me-2">
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </form>-->
            </nav>
        </header>
        <br><br>
        <div id="frontPageSection" class="container-fluid px-0">
        <section class="frontpage">
            <p class="welcome">Welcome to Our School</p>
            <div class="button mx-2">
                <a href="login.jsp"><button class="mx-2"> <span><i class="fa-solid fa-right-to-bracket fa-fade"></i> Log in</span></button></a>
                <a href="signup.jsp"><button class="mx-2"><span><i class="fa-solid fa-user-plus fa-fade"></i> Sign up</span></button></a>
            </div>
        </section>
        </div>
        <!--        <footer>
                    <p>Go to hell.</p>
                </footer>-->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
