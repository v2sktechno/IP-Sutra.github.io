<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="IP_Sutra.header" %>

<%--<nav class="navbar navbar-expand-lg bg-white fixed-top">
    <a class="nav-link">
        <img src="assests/images/InoberryLogo_Small.png" style="width: 200px; height: 50px" />
    </a>

    <button class="navbar-toggler" type="button" data-toggle="collapse"
        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse " id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto navbar-right-top">
            <li class="nav-item dropdown nav-user">
                <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    <asp:Label ID="lblUserName" runat="server"></asp:Label>
                    <i class="fa fa-user"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                    <div class="nav-user-info">

                        <a class="dropdown-item" href="/LoginForm.aspx"><i class="fas fa-power-off mr-2"></i>Logout</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</nav>

<div class="nav-left-sidebar sidebar-dark">
    <div class="menu-list">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="d-xl-none d-lg-none" href="#"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav flex-column mynav">

                   
                    <li class="nav-item">
                        <a class="nav-link" href="/dashboard.aspx"><i class="fas fa-fw fa-chart-pie"></i>Dashboard</a>
                
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2"
                            aria-controls="submenu-2"><i class="fa fa-fw fa-rocket"></i>Master</a>
                        <div id="submenu-2" class="collapse submenu" style="">
                            <ul class="nav flex-column">


                                <li class="nav-item">
                                    <a class="nav-link" href="/AccessRight.aspx">Access Right</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/DeadLineMaster.aspx">DeadLine</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/Department.aspx">Department</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/Designation.aspx">Designation</a>
                                </li>


                                <li class="nav-item">
                                    <a class="nav-link" href="/DocumentManager.aspx">Document Manager</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/EntityMaster.aspx">Entity</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/ModuleMaster.aspx">Module</a>
                                </li>


                                <li class="nav-item">
                                    <a class="nav-link" href="/StatusMaster.aspx">Status</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/User.aspx">User</a>
                                </li>


                            </ul>
                        </div>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3"
                            aria-controls="submenu-3"><i class="fab fa-fw fa-wpforms"></i>IDF</a>
                        <div id="submenu-3" class="collapse submenu" style="">
                            <ul class="nav flex-column">

                                <li class="nav-item">
                                    <a class="nav-link" href="/Patent.aspx">Patent</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/Copyright.aspx">Copyright</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/Design.aspx">Design</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/Trademark.aspx">Trademark</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/IDF_Search.aspx">IDF Search</a>
                                </li>

                            </ul>
                        </div>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4"
                            aria-controls="submenu-4"><i class="fab fa-fw fa-wpforms"></i>IP Records</a>
                        <div id="submenu-4" class="collapse submenu" style="">
                            <ul class="nav flex-column">

                             
                                <li class="nav-item">
                                    <a class="nav-link" href="/FileEntry_Search.aspx">IP Search</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Invention_Details.aspx"><i class="fab fa-fw fa-wpforms"></i>Invention Details</a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="TTRecord.aspx"><i class="fab fa-fw fa-wpforms"></i>T.T. Record </a>

                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Tech_Transfer.aspx"><i class="fab fa-fw fa-wpforms"></i>Case Management </a>

                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="AgreementManagement.aspx"><i class="fab fa-fw fa-wpforms"></i>Agreement Management </a>

                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="/loginForm.aspx"><i class="fa fa-fw fa-rocket"></i>Logout</a>
                    </li>
                </ul>
            </div>            
        </nav>        
    </div>
   <div class="notification-list copyright">
        
        &copy; 2023 Inoberry. All rights reserved.
    </div>
    
</div>--%>





 <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top" > 
          <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
            <i class="fa fa-bars" style="            color: black;        "></i>
          </button>
          <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                aria-labelledby="searchDropdown">
                <form class="navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-1 small"
                      placeholder="What do you want to look for?" aria-label="Search" aria-describedby="basic-addon2"
                      style="border-color: #3f51b5;">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 12, 2019</div>
                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                    $290.29 has been deposited into your account!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                    Spending Alert: We've noticed unusually high spending for your account.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <span class="badge badge-warning badge-counter">2</span>
              </a>
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="img/man.png" style="max-width: 60px" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been
                      having.</div>
                    <div class="small text-gray-500">Udin Cilok · 58m</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="img/girl.png" style="max-width: 60px" alt="">
                    <div class="status-indicator bg-default"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people
                      say this to all dogs, even if they aren't good...</div>
                    <div class="small text-gray-500">Jaenab · 2w</div>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-tasks fa-fw"></i>
                <span class="badge badge-success badge-counter">3</span>
              </a>
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Task
                </h6>
                <a class="dropdown-item align-items-center" href="#">
                  <div class="mb-3">
                    <div class="small text-gray-500">Design Button
                      <div class="small float-right"><b>50%</b></div>
                    </div>
                    <div class="progress" style="height: 12px;">
                      <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="50"
                        aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                  </div>
                </a>
                <a class="dropdown-item align-items-center" href="#">
                  <div class="mb-3">
                    <div class="small text-gray-500">Make Beautiful Transitions
                      <div class="small float-right"><b>30%</b></div>
                    </div>
                    <div class="progress" style="height: 12px;">
                      <div class="progress-bar bg-warning" role="progressbar" style="width: 30%" aria-valuenow="30"
                        aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                  </div>
                </a>
                <a class="dropdown-item align-items-center" href="#">
                  <div class="mb-3">
                    <div class="small text-gray-500">Create Pie Chart
                      <div class="small float-right"><b>75%</b></div>
                    </div>
                    <div class="progress" style="height: 12px;">
                      <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75"
                        aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">View All Taks</a>
              </div>
            </li>
            <div class="topbar-divider d-none d-sm-block"></div>
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <img class="img-profile rounded-circle" src="img/boy.png" style="max-width: 60px">
          
              </a>
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="javascript:void(0);" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>
          </ul>
        </nav>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $("#sidebarToggle, #sidebarToggleTop").on("click", function (e) {
            $("body").toggleClass("sidebar-toggled");
            $(".sidebar").toggleClass("toggled");
            if ($(".sidebar").hasClass("toggled")) {
                $(".sidebar .collapse").collapse("hide");
            }
        });

        $(window).resize(function () {
            if ($(window).width() < 768) {
                $(".sidebar .collapse").collapse("hide");
            }
        });

        $("body.fixed-nav .sidebar").on("mousewheel DOMMouseScroll wheel", function (e) {
            if ($(window).width() > 768) {
                var e0 = e.originalEvent;
                var delta = e0.wheelDelta || -e0.detail;
                this.scrollTop += 30 * (delta < 0 ? 1 : -1);
                e.preventDefault();
            }
        });

        $(document).on("scroll", function () {
            var scrollDistance;
            if ($(this).scrollTop() > 100) {
                $(".scroll-to-top").fadeIn();
            } else {
                $(".scroll-to-top").fadeOut();
            }
        });

        $(document).on("click", "a.scroll-to-top", function (e) {
            var $anchor = $(this);
            $("html, body").stop().animate({
                scrollTop: $($anchor.attr("href")).offset().top
            }, 1000, "easeInOutExpo");
            e.preventDefault();
        });

        $("#myBtn").click(function () {
            $(".modal").modal("show");
        });

        $("#modalLong").click(function () {
            $(".modal").modal("show");
        });

        $("#modalScroll").click(function () {
            $(".modal").modal("show");
        });

        $("#modalCenter").click(function () {
            $(".modal").modal("show");
        });

        $('[data-toggle="popover"]').popover();
        $(".popover-dismiss").popover({ trigger: "focus" });

        var version = document.getElementById("version-ruangadmin");
        version.innerHTML = "Version 1.1";
    });
</script>


    

    

    

    




