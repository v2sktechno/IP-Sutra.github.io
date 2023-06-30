<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="~/sidebar.ascx.cs" Inherits="IP_Sutra.header" %>


   <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">

      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <img src="./img/logo/LOGO.png" style= "height: 70px;">
        <div class="sidebar-brand-icon">

        </div>
        <!-- <div class="sidebar-brand-text mx-3">RuangAdmin</div> -->
      </a>
      <hr class="sidebar-divider my-0">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMaster" aria-expanded="true"
          aria-controls="collapseMaster">
          <i class="fas fa-fw fa-cogs"></i>
          <span>Master</span>
        </a>
        <div id="collapseMaster" class="collapse" aria-labelledby="headingMaster" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Master</h6>
            <a class="collapse-item" href="#">Access Right</a>
            <a class="collapse-item" href="#">DeadLine</a>
            <a class="collapse-item" href="#">Department</a>
            <a class="collapse-item" href="#">Designation</a>
            <a class="collapse-item" href="#">Document Manager</a>
            <a class="collapse-item" href="#">Entity</a>
            <a class="collapse-item" href="#">Module</a>
            <a class="collapse-item" href="#">Status</a>
            <a class="collapse-item" href="#">User</a>
            <a class="collapse-item" href="#">Role</a>
            <a class="collapse-item" href="#">Menu</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseIDF" aria-expanded="true"
          aria-controls="collapseIDF">
          <i class="fab fa-fw fa-wpforms"></i>
          <span>IDF</span>
        </a>
        <div id="collapseIDF" class="collapse" aria-labelledby="headingIDF" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">IDF</h6>
            <a class="collapse-item" href="#">Patent</a>
            <a class="collapse-item" href="#">Copyright</a>
            <a class="collapse-item" href="#">Design</a>
            <a class="collapse-item" href="#">Trademark</a>
            <a class="collapse-item" href="#">IDF Search</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseIPRecords"
          aria-expanded="true" aria-controls="collapseIPRecords">
          <i class="fas fa-fw fa-table"></i>
          <span>IP Records</span>
        </a>
        <div id="collapseIPRecords" class="collapse" aria-labelledby="headingIPRecords" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">IP Records</h6>
            <a class="collapse-item" href="#">IP Search</a>
            <a class="collapse-item" href="#">Invention Details</a>
            <a class="collapse-item" href="#">T.T. Record</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCaseManagement"
          aria-expanded="true" aria-controls="collapseCaseManagement">
          <i class="fas fa-fw fa-folder"></i>
          <span>Case Management</span>
        </a>
        <div id="collapseCaseManagement" class="collapse" aria-labelledby="headingCaseManagement"
          data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Case Management</h6>
            <a class="collapse-item" href="#">Agreement Management</a>
            <a class="collapse-item" href="#">Billing</a>
            <a class="collapse-item" href="#">Billing Master</a>
            <a class="collapse-item" href="#">Billing Details</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout.html">
          <i class="fas fa-fw fa-sign-out-alt"></i>
          <span>Logout</span>
        </a>
      </li>
      <hr class="sidebar-divider">
      <div class="version" id="version-ruangadmin">&copy; 2023 Inoberry. All rights reserved.</div>
    </ul>




