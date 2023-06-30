﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard_OLD.aspx.cs" Inherits="IP_Sutra.Dashboard_OLD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dashboard</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css" />
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- JQVMap -->
    <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css" />
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css" />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css" />
    <!-- summernote -->
    <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css" />


</head>
<body class="hold-transition sidebar-mini layout-fixed">

    <form id="form1" runat="server">
        <div>

            <div class="wrapper">

                <!-- Preloader -->
                <div class="preloader flex-column justify-content-center align-items-center">
                    <%-- <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">--%>
                </div>

                <!-- Navbar -->
                <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                    <!-- Left navbar links -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                        </li>
                        <%--<li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>--%>
                    </ul>

                    <!-- Right navbar links -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Navbar Search -->
                        <li class="nav-item">
                            <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                                <i class="fas fa-search"></i>
                            </a>
                            <div class="navbar-search-block">
                                <form class="form-inline">
                                    <div class="input-group input-group-sm">
                                        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                                        <div class="input-group-append">
                                            <button class="btn btn-navbar" type="submit">
                                                <i class="fas fa-search"></i>
                                            </button>
                                            <%--<button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>--%>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Messages Dropdown Menu -->
                        <li class="nav-item">
                            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                                <i class="fas fa-expand-arrows-alt"></i>
                            </a>
                        </li>
                        <%-- <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>--%>
                    </ul>
                </nav>
                <!-- /.navbar -->

                <!-- Main Sidebar Container -->
                <aside class="main-sidebar sidebar-dark-primary elevation-4">
                    <!-- Brand Logo -->
                    <span class="brand-text font-weight-light">
                        <a href="Dashboard_OLD.aspx" class="brand-link">
                            <%--<img src="dist/img/.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">--%>
                            <img src="assests/images/IPS.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8" />
                            <span class="brand-text font-weight-light">IP SUTRA</span>
                        </a>
                    </span>


                    <!-- SidebarSearch Form -->
                    <div class="form-inline">
                        <div class="input-group" data-widget="sidebar-search">
                            <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search" />
                            <div class="input-group-append">
                                <button class="btn btn-sidebar">
                                    <i class="fas fa-search fa-fw"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                            <li class="nav-item menu-open">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-tachometer-alt"></i>
                                    <p>
                                        Menu
               
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="Dashboard_OLD.aspx" class="nav-link active">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Dashboard</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Trademark.aspx" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Master</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="AccessRight.aspx" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>IP Pages</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Copyright.aspx" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Document Management</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="DeadLineMaster.aspx" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>User Management</p>
                                        </a>
                                    </li>



                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->

                    <!-- /.sidebar -->
                </aside>



                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <div class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <h1 class="m-0">Dashboard</h1>
                                </div>
                                <!-- /.col -->
                                <div class="col-sm-6">
                                    <ol class="breadcrumb float-sm-right">
                                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                                        <li class="breadcrumb-item active">Dashboard 1 </li>
                                    </ol>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
                    </div>
                    <!-- /.content-header -->

                    <!-- Main content -->
                    <section class="content">
                        <div class="container-fluid">
                            <!-- Small boxes (Stat box) -->
                            <div class="row">
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box bg-info">
                                        <div class="inner">
                                            <h3>150</h3>

                                            <p>Copyright No.of Files</p>
                                        </div>
                                        <div class="icon">
                                            <%--<i class="ion ion-md-today"></i> --%>
                                        </div>
                                        <a href="#" class="small-box-footer"></a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box bg-success">
                                        <div class="inner">
                                            <%-- <h3>53<sup style="font-size: 20px">%</sup></h3>--%>
                                            <h3>53</h3>
                                            <p>Trademark No.of Files</p>
                                        </div>
                                        <div class="icon">
                                            <i class="ion ion-md-paper"></i>

                                            <%--  <i class="ion ion-stats-bars"></i>--%>
                                        </div>
                                        <a href="#" class="small-box-footer"></a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box bg-warning">
                                        <div class="inner">
                                            <h3>44</h3>

                                            <p>Patent No.of Files</p>
                                        </div>
                                        <div class="icon">
                                            <%--<i class="ion ion-person-add"></i>--%>
                                        </div>
                                        <a href="#" class="small-box-footer"></a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box bg-danger">
                                        <div class="inner">
                                            <h3>65</h3>

                                            <p>Industrial Design</p>
                                        </div>
                                        <div class="icon">
                                            <%-- <i class="ion ion-pie-graph"></i>--%>
                                        </div>
                                        <a href="#" class="small-box-footer"></a>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box bg-secondary">
                                        <div class="inner">
                                            <h3>40</h3>

                                            <p>Total Agreement</p>
                                        </div>
                                        <div class="icon">
                                            <%--  <i class="ion ion-pie-graph"></i>--%>
                                        </div>
                                        <a href="#" class="small-box-footer"></a>
                                    </div>
                                </div>


                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box bg-warning">
                                        <div class="inner">
                                            <h3>5</h3>

                                            <p>Agreement Renewal Due</p>
                                        </div>
                                        <div class="icon">
                                            <%--  <i class="ion ion-pie-graph"></i>--%>
                                        </div>
                                        <a href="#" class="small-box-footer"></a>
                                    </div>
                                </div>


                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box bg-success">
                                        <div class="inner">
                                            <h3>2</h3>

                                            <p>Deadline</p>
                                        </div>
                                        <div class="icon">
                                            <%--  <i class="ion ion-pie-graph"></i>--%>
                                        </div>
                                        <a href="Deadline.aspx" class="small-box-footer"></a>
                                    </div>
                                </div>


                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box bg-primary">
                                        <div class="inner">
                                            <h3>20</h3>

                                            <p>Technology Recorded</p>
                                        </div>
                                        <div class="icon">
                                            <%--  <i class="ion ion-pie-graph"></i>--%>
                                        </div>
                                        <a href="#" class="small-box-footer"></a>
                                    </div>
                                </div>
                            </div>
                            <div class="row">


                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box bg-danger">
                                        <div class="inner">
                                            <h3>30</h3>

                                            <p>Technology Transfer</p>
                                        </div>
                                        <div class="icon">
                                            <%--  <i class="ion ion-pie-graph"></i>--%>
                                        </div>
                                        <a href="#" class="small-box-footer"></a>
                                    </div>
                                </div>



                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box bg-info">
                                        <div class="inner">
                                            <h3>9</h3>

                                            <p>Upcoming Followups</p>
                                        </div>
                                        <div class="icon">
                                            <%--  <i class="ion ion-pie-graph"></i>--%>
                                        </div>
                                        <a href="#" class="small-box-footer"></a>
                                    </div>
                                </div>




                            </div>
                            <!-- ./col -->
                        </div>
                        <!-- /.row -->
                        <!-- Main row -->
                        <div class="row">
                            <!-- Left col -->
                            <!-- /.Left col -->
                            <!-- right col (We are only adding the ID to make the widgets sortable)-->
                            <section class="col-lg-5 connectedSortable">

                                <!-- Map card -->
                                <!-- /.card -->

                                <!-- solid sales graph -->
                                <!-- /.card -->

                                <!-- Calendar -->
                                <%-- <div class="card bg-gradient-success">--%>
                                <!-- /.card-header -->
                                <div class="card-body pt-0">
                                    <!--The calendar -->
                                    <div id="calendar" style="width: 100%"></div>
                                </div>
                                <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </section>
                    <!-- right col -->
                </div>
                <!-- /.row (main row) -->
            </div>
        <!-- /.container-fluid -->
        </section>
   
      
      
      
     




            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <footer class="main-footer">
            <strong>Copyright © www.v2sk.in.</strong>
            All rights reserved.
   
            <div class="float-right d-none d-sm-inline-block">
                <b>Version</b> 3.1.0
   
            </div>
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <script src="plugins/jquery/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
            $.widget.bridge('uibutton', $.ui.button)
        </script>
        <!-- Bootstrap 4 -->
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- ChartJS -->
        <script src="plugins/chart.js/Chart.min.js"></script>
        <!-- Sparkline -->
        <script src="plugins/sparklines/sparkline.js"></script>
        <!-- JQVMap -->
        <script src="plugins/jqvmap/jquery.vmap.min.js"></script>
        <script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="plugins/jquery-knob/jquery.knob.min.js"></script>
        <!-- daterangepicker -->
        <script src="plugins/moment/moment.min.js"></script>
        <script src="plugins/daterangepicker/daterangepicker.js"></script>
        <!-- Tempusdominus Bootstrap 4 -->
        <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
        <!-- Summernote -->
        <script src="plugins/summernote/summernote-bs4.min.js"></script>
        <!-- overlayScrollbars -->
        <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="dist/js/pages/dashboard.js"></script>

        </div>
    </form>
</body>
</html>
