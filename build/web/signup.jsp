<%-- 
    Document   : signup
    Created on : May 6, 2023, 11:20:09 PM
    Author     : shahmdmesbahulislam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign up page</title>
        <!--<link rel="stylesheet" href="style.css">-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
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
            <!--start of navbar-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
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
            <!--end of navbar-->
        </header>
        <br><br>
        <div class="container d-flex justify-content-center align-items-center min-vh-100">
            <div class="row border rounded-5 p-3 bg-white shadow box-area">
                <div class="col-md-6 rounded-4 justify-content-center align-items-center flex-column left-box" style="background: #103cbe ;">
                    <div class="featured-image mb-3 mt-5">
                        <img src="img/signup.avif" class="img-fluid" style="width: 100%; height: 100%">
                        <!-- <p class="text-white fs-2" style="font-family: 'Courier New', Courier, monospace; font-weight: 600;">Blah Blah</p> -->
                        <!-- <small class="text-white text-wrap text-center" style="width: 17rem;font-family: 'Courier New', Courier, monospace;">Join experienced Designers on this platform.</small> -->

                    </div>

                </div>
                <div class="col-md-6">
                    <div class="row align-items-center">
                        <div class="header-text mb-4">
                            <h5 class='text-center'>Hello, There!</h5>
                            <h5 class="text-center">Please sign up here.</h5>
                        </div> 
                        <form id="regForm" action="signup" method="POST">
                            <div class="input-group mb-3">
                                <input required name="first_name" type="text" class="form-control form-control-lg bg-light fs-6" id="Fname" placeholder="First Name">
                            </div>
                            <div class="input-group mb-3">
                                <input required name="last_name" type="text" class="form-control form-control-lg bg-light fs-6" id="Lname" placeholder="Last Name">
                            </div>
                            <div class="input-group mb-3">
                                <input required name="user_email" type="email" class="form-control form-control-lg bg-light fs-6" id="email" placeholder="Email address">
                            </div>
                            <div class="input-group mb-5">
                                <input required name="user_password" type="password" class="form-control form-control-lg bg-light fs-6" id="psw" placeholder="Password">
                            </div>
                            <p class="gender"><b>Gender: </b></p>
                            <div class="input-group mb-3 d-flex flex-column">	
                                <div class="form-check">
                                    <input required name="user_gender" class="form-check-input" type="radio" name="flexRadioDefault" id="male" value="Male">
                                    <label class="form-check-label" for="male">
                                        male
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input required name="user_gender"  class="form-check-input" type="radio" name="flexRadioDefault" id="female" value="Female" checked>
                                    <label class="form-check-label" for="female">
                                        female
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input required name="user_gender" value="Other" class="form-check-input" type="radio" name="flexRadioDefault" id="other">
                                    <label class="form-check-label" for="other">
                                        other
                                    </label>
                                </div>
                            </div>
                            <label for="who"><strong>Who are you?</strong></label>
                            <select required name="user_role" id="who" style="border:none; padding: 10px 20px; border-radius:5px; width: 220px; margin-bottom: 5px;">
                                <option value="">---Select Category---</option>
                                <option value="Student">Student</option>
                                <option value="Teacher">Teacher</option>
                                <option value="Admin">Admin</option>
                            </select>
                            <div class="input-group mb-3">
                                <button type="submit" class="btn btn-lg btn-primary w-100 fs-6"><i class="fa-solid fa-user-plus fa-fade"></i> Sign up</button>
                            </div>
                        </form>
                        <!--                        <div class="input-group mb-3">
                                                    <button class="btn btn-lg btn-light w-100 fs-6"><img src="img/google.png" style="width:20px" class="me-2"><small>Sign In with Google</small></button>
                                                </div>-->

                        <div class="row">
                            <small>Already have an account? <a href="login.jsp"><i class="fa-solid fa-right-to-bracket fa-fade"></i> Log in</a></small>
                        </div>
                    </div>

                </div>


            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
 $(document).ready(function() {
     console.log("loaded...");
     $("#regForm").on('submit', function(event) {
         event.preventDefault();
         let form = new FormData(this);
         $.ajax({
             url: "signup",
             type: "POST",
             data: form,
             success: function(data, textStatus, jqXHR) {
                 console.log(data);
                 if (data.trim() === 'done') {
                     console.log(data);
                     swal("Register successfully done. We are redirecting you to login page.")
                     .then((value) => {
                         window.location = "login.jsp";
                     });
                 } else {
                     swal(data);
                 }
             },
             error: function(jqXHR, textStatus, errorThrown) {
                 swal("Something went wrong. Please try again.");
             },
             processData: false,
             contentType: false
         });
     });
 });
        </script>

    </body>
</html>
