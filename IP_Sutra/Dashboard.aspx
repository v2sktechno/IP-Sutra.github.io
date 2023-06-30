<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="IP_Sutra.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<meta http-equiv="refresh" content="30" />--%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    
    <script>       
        $window.setInterval(function () {
            var dt = new Date();
            currentHours = dt.getHours();
            currentHours = ("0" + currentHours).slice(-2);
            currentMinuts = dt.getMinutes();
            currentMinuts = ("0" + currentMinuts).slice(-2);
            currentSeconds = dt.getSeconds();
            currentSeconds = ("0" + currentSeconds).slice(-2);
            //var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
            var time = currentHours + ":" + currentMinuts + ":" + currentSeconds;
            document.getElementById("time").innerHTML = dt.toLocaleDateString() + " , " + time;
        }, 1000);
        function fetchData(v) {

            PageMethods.fetchPopuData(v, onSuccess, onFailure);

            function onSuccess(val) {
                debugger;
                //alert(val);
                $("#divDetails").html(val);

                $('#myModal').modal('show');
            }

            function onFailure(val) {
                alert(val);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>





    <div class="dashboard-wrapper" style="margin-top: -28px;">
        <div class="dashboard-ecommerce">
            <div class="container-fluid dashboard-content">



<div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
            </ol>
          </div>



                <div class="ecommerce-widget">






                    <div class="row">






   <div class="col-xl-3 col-md-6 mb-4">
  <div class="bg">
    <div class="card card1 card-body">
      <h3 class="card-title">Copyright</h3>
      <div class="metric">
        <div class="dropdown no-arrow">
          <a class="dropdown-toggle btn-sm" role="button" id="copyrightDropdownMenuLink"
            onclick="toggleCopyrightDropdown()" aria-haspopup="true" aria-expanded="false"
            style="position: absolute; top: -42px; left: 150px; padding-right: 25px;">
            <i class="fas fa-ellipsis-v"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" id="copyrightDropdownContent"
            style="position: absolute; top: -149px; left: 69px;">
            <a class="dropdown-item" onclick="updateCopyrightCountLabel('Current Month')">Current Month</a>
            <a class="dropdown-item" onclick="updateCopyrightCountLabel('Previous Month')">Previous Month</a>
            <a class="dropdown-item" onclick="updateCopyrightCountLabel('Total Count')">Total Count</a>
          </div>
        </div>
      </div>
      <div class="metric">
        <span id="copyrightCountLabel">Current Month:</span>
        <h1 class="mb-1 text-primary" id="prevCopyright" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="currCopyright" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="totalCopyright" runat="server" onclick="fetchCopyrightData(2)"></h1>
      </div>
    </div>
  </div>
</div>

<script>
    // Add necessary JavaScript for the "Copyright" component here
    var copyrightDropdownContent = document.getElementById("copyrightDropdownContent");
    var prevCopyright = document.getElementById('<%= prevCopyright.ClientID %>');
    var currCopyright = document.getElementById('<%= currCopyright.ClientID %>');
  var totalCopyright = document.getElementById('<%= totalCopyright.ClientID %>');

    function toggleCopyrightDropdown() {
        copyrightDropdownContent.classList.toggle("show");
    }

    function updateCopyrightCountLabel(selectedOption) {
        var copyrightCountLabel = document.getElementById("copyrightCountLabel");
        copyrightCountLabel.textContent = selectedOption + ":";

        // Hide all count elements
        prevCopyright.style.display = "none";
        currCopyright.style.display = "none";
        totalCopyright.style.display = "none";

        // Show the selected count element
        if (selectedOption === "Previous Month") {
            prevCopyright.style.display = "block";
        } else if (selectedOption === "Current Month") {
            currCopyright.style.display = "block";
        } else if (selectedOption === "Total Count") {
            totalCopyright.style.display = "block";
        }

        // Hide the dropdown after selecting an option
        copyrightDropdownContent.classList.remove("show");
    }

    // Hide the count elements initially except for the current month
    window.addEventListener("DOMContentLoaded", function () {
        prevCopyright.style.display = "none";
        totalCopyright.style.display = "none";
    });
</script>



             <div class="col-xl-3 col-md-6 mb-4">
  <div class="bg">
    <div class="card card1 card-body">
      <h3 class="card-title">Design</h3>
      <div class="metric">
        <div class="dropdown no-arrow">
          <a class="dropdown-toggle btn-sm"  role="button" id="dropdownMenuLink3" onclick="toggleDropdown3()"
            aria-haspopup="true" aria-expanded="false" style="position: absolute; top: -42px; left: 150px; padding-right: 25px;">
            <i class="fas fa-ellipsis-v"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" id="dropdownContent3"
            style="position: absolute; top: -149px; left: 69px;">
            <a class="dropdown-item" onclick="updateCountLabel3('Current Month')">Current Month</a>
            <a class="dropdown-item" onclick="updateCountLabel3('Previous Month')">Previous Month</a>
            <a class="dropdown-item" onclick="updateCountLabel3('Total Count')">Total Count</a>
          </div>
        </div>
      </div>
      <div class="metric">
        <span id="countLabel3">Current Month:</span>
        <h1 class="mb-1 text-primary" id="prevDesign" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="currDesign" runat="server"  onclick=""></h1>
        <h1 class="mb-1 text-primary" id="totalDesign" runat="server" onclick="fetchData(2)"></h1>
      </div>
    </div>
  </div>
</div>


              <script>
                  // Add necessary JavaScript for Component 3 here
                  var dropdownContent3 = document.getElementById("dropdownContent3");
                  var prevDesign = document.getElementById('<% = prevDesign.ClientID %>');
                  var currDesign = document.getElementById('<% = currDesign.ClientID %>');
  var totalDesign = document.getElementById('<% = totalDesign.ClientID %>');

                  function toggleDropdown3() {
                      dropdownContent3.classList.toggle("show");
                  }

                  function updateCountLabel3(selectedOption) {
                      var countLabel3 = document.getElementById("countLabel3");
                      countLabel3.textContent = selectedOption + ":";

                      // Hide all count elements
                      prevDesign.style.display = "none";
                      currDesign.style.display = "none";
                      totalDesign.style.display = "none";

                      // Show the selected count element
                      if (selectedOption === "Previous Month") {
                          prevDesign.style.display = "block";
                      } else if (selectedOption === "Current Month") {
                          currDesign.style.display = "block";
                      } else if (selectedOption === "Total Count") {
                          totalDesign.style.display = "block";
                      }

                      // Hide the dropdown after selecting an option
                      dropdownContent3.classList.remove("show");
                  }

                  // Hide the count elements initially except for the current month
                  window.addEventListener("DOMContentLoaded", function () {
                      prevDesign.style.display = "none";
                      totalDesign.style.display = "none";
                  });
              </script>

                 <div class="col-xl-3 col-md-6 mb-4">
  <div class="bg">
    <div class="card card1 card-body">
      <h3 class="card-title">Patent</h3>
      <div class="metric">
        <div class="dropdown no-arrow">
          <a class="dropdown-toggle btn-sm" role="button" id="patentDropdownMenuLink" onclick="togglePatentDropdown()"
            aria-haspopup="true" aria-expanded="false" style="position: absolute; top: -42px; left: 150px; padding-right: 25px;">
            <i class="fas fa-ellipsis-v"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" id="patentDropdownContent"
            style="position: absolute; top: -149px; left: 69px;">
            <a class="dropdown-item" onclick="updatePatentCountLabel('Current Month')">Current Month</a>
            <a class="dropdown-item" onclick="updatePatentCountLabel('Previous Month')">Previous Month</a>
            <a class="dropdown-item" onclick="updatePatentCountLabel('Total Count')">Total Count</a>
          </div>
        </div>
      </div>
      <div class="metric">
        <span id="patentCountLabel">Current Month:</span>
        <h1 class="mb-1 text-primary" id="prevPatent" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="currPatent" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="totalPatent" runat="server" onclick="fetchPatentData(2)"></h1>
      </div>
    </div>
  </div>
</div>

<script>
    // Add necessary JavaScript for the "Patent" component here
    var patentDropdownContent = document.getElementById("patentDropdownContent");
    var prevPatent = document.getElementById('<%= prevPatent.ClientID %>');
    var currPatent = document.getElementById('<%= currPatent.ClientID %>');
  var totalPatent = document.getElementById('<%= totalPatent.ClientID %>');

    function togglePatentDropdown() {
        patentDropdownContent.classList.toggle("show");
    }

    function updatePatentCountLabel(selectedOption) {
        var patentCountLabel = document.getElementById("patentCountLabel");
        patentCountLabel.textContent = selectedOption + ":";

        // Hide all count elements
        prevPatent.style.display = "none";
        currPatent.style.display = "none";
        totalPatent.style.display = "none";

        // Show the selected count element
        if (selectedOption === "Previous Month") {
            prevPatent.style.display = "block";
        } else if (selectedOption === "Current Month") {
            currPatent.style.display = "block";
        } else if (selectedOption === "Total Count") {
            totalPatent.style.display = "block";
        }

        // Hide the dropdown after selecting an option
        patentDropdownContent.classList.remove("show");
    }

    // Hide the count elements initially except for the current month
    window.addEventListener("DOMContentLoaded", function () {
        prevPatent.style.display = "none";
        totalPatent.style.display = "none";
    });
</script>


                       <div class="col-xl-3 col-md-6 mb-4">
  <div class="bg">
    <div class="card card1 card-body">
      <h3 class="card-title">Trademark</h3>
      <div class="metric">
        <div class="dropdown no-arrow">
          <a class="dropdown-toggle btn-sm" role="button" id="trademarkDropdownMenuLink" onclick="toggleTrademarkDropdown()"
            aria-haspopup="true" aria-expanded="false" style="position: absolute; top: -42px; left: 150px; padding-right: 25px;">
            <i class="fas fa-ellipsis-v"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" id="trademarkDropdownContent"
            style="position: absolute; top: -149px; left: 69px;">
            <a class="dropdown-item" onclick="updateTrademarkCountLabel('Current Month')">Current Month</a>
            <a class="dropdown-item" onclick="updateTrademarkCountLabel('Previous Month')">Previous Month</a>
            <a class="dropdown-item" onclick="updateTrademarkCountLabel('Total Count')">Total Count</a>
          </div>
        </div>
      </div>
      <div class="metric">
        <span id="trademarkCountLabel">Current Month:</span>
        <h1 class="mb-1 text-primary" id="prevTrademark" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="currTrademark" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="totalTrademark" runat="server" onclick="fetchTrademarkData(5)"></h1>
      </div>
    </div>
  </div>
</div>

<script>
    // Add necessary JavaScript for the "Trademark" component here
    var trademarkDropdownContent = document.getElementById("trademarkDropdownContent");
    var prevTrademark = document.getElementById('<%= prevTrademark.ClientID %>');
    var currTrademark = document.getElementById('<%= currTrademark.ClientID %>');
  var totalTrademark = document.getElementById('<%= totalTrademark.ClientID %>');

    function toggleTrademarkDropdown() {
        trademarkDropdownContent.classList.toggle("show");
    }

    function updateTrademarkCountLabel(selectedOption) {
        var trademarkCountLabel = document.getElementById("trademarkCountLabel");
        trademarkCountLabel.textContent = selectedOption + ":";

        // Hide all count elements
        prevTrademark.style.display = "none";
        currTrademark.style.display = "none";
        totalTrademark.style.display = "none";

        // Show the selected count element
        if (selectedOption === "Previous Month") {
            prevTrademark.style.display = "block";
        } else if (selectedOption === "Current Month") {
            currTrademark.style.display = "block";
        } else if (selectedOption === "Total Count") {
            totalTrademark.style.display = "block";
        }

        // Hide the dropdown after selecting an option
        trademarkDropdownContent.classList.remove("show");
    }

    // Hide the count elements initially except for the current month
    window.addEventListener("DOMContentLoaded", function () {
        prevTrademark.style.display = "none";
        totalTrademark.style.display = "none";
    });
</script>


                    </div>

                    <div class="row">

<div class="col-xl-3 col-md-6 mb-4">
  <div class="bg">
    <div class="card card1 card-body">
      <h3 class="card-title">Deadline</h3>
      <div class="metric">
        <div class="dropdown no-arrow">
          <a class="dropdown-toggle btn-sm" role="button" id="deadlineDropdownMenuLink" onclick="toggleDeadlineDropdown()"
            aria-haspopup="true" aria-expanded="false" style="position: absolute; top: -42px; left: 150px; padding-right: 25px;">
            <i class="fas fa-ellipsis-v"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" id="deadlineDropdownContent"
            style="position: absolute; top: -149px; left: 69px;">
            <a class="dropdown-item" onclick="updateDeadlineCountLabel('Current Month')">Current Month</a>
            <a class="dropdown-item" onclick="updateDeadlineCountLabel('Previous Month')">Previous Month</a>
            <a class="dropdown-item" onclick="updateDeadlineCountLabel('Total Count')">Total Count</a>
          </div>
        </div>
      </div>
      <div class="metric">
        <span id="deadlineCountLabel">Current Month:</span>
        <h1 class="mb-1 text-primary" id="prevDeadline" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="currDeadline" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="totalDeadline" runat="server" onclick="fetchDeadlineData(2)"></h1>
      </div>
    </div>
  </div>
</div>

<script>
    // Add necessary JavaScript for the "Deadline" component here
    var deadlineDropdownContent = document.getElementById("deadlineDropdownContent");
    var prevDeadline = document.getElementById('<%= prevDeadline.ClientID %>');
    var currDeadline = document.getElementById('<%= currDeadline.ClientID %>');
  var totalDeadline = document.getElementById('<%= totalDeadline.ClientID %>');

    function toggleDeadlineDropdown() {
        deadlineDropdownContent.classList.toggle("show");
    }

    function updateDeadlineCountLabel(selectedOption) {
        var deadlineCountLabel = document.getElementById("deadlineCountLabel");
        deadlineCountLabel.textContent = selectedOption + ":";

        // Hide all count elements
        prevDeadline.style.display = "none";
        currDeadline.style.display = "none";
        totalDeadline.style.display = "none";

        // Show the selected count element
        if (selectedOption === "Previous Month") {
            prevDeadline.style.display = "block";
        } else if (selectedOption === "Current Month") {
            currDeadline.style.display = "block";
        } else if (selectedOption === "Total Count") {
            totalDeadline.style.display = "block";
        }

        // Hide the dropdown after selecting an option
        deadlineDropdownContent.classList.remove("show");
    }

    // Hide the count elements initially except for the current month
    window.addEventListener("DOMContentLoaded", function () {
        prevDeadline.style.display = "none";
        totalDeadline.style.display = "none";
    });
</script>


                        






                 <div class="col-xl-3 col-md-6 mb-4">
  <div class="bg">
    <div class="card card1 card-body">
      <h3 class="card-title">Status</h3>
      <div class="metric">
        <div class="dropdown no-arrow">
          <a class="dropdown-toggle btn-sm" role="button" id="statusDropdownMenuLink" onclick="toggleStatusDropdown()"
            aria-haspopup="true" aria-expanded="false" style="position: absolute; top: -42px; left: 150px; padding-right: 25px;">
            <i class="fas fa-ellipsis-v"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" id="statusDropdownContent"
            style="position: absolute; top: -149px; left: 69px;">
            <a class="dropdown-item" onclick="updateStatusCountLabel('Current Month')">Current Month</a>
            <a class="dropdown-item" onclick="updateStatusCountLabel('Previous Month')">Previous Month</a>
            <a class="dropdown-item" onclick="updateStatusCountLabel('Total Count')">Total Count</a>
          </div>
        </div>
      </div>
      <div class="metric">
        <span id="statusCountLabel">Current Month:</span>
        <h1 class="mb-1 text-primary" id="prevStatus" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="currStatus" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="totalStatus" runat="server" onclick="fetchStatusData(1)"></h1>
      </div>
    </div>
  </div>
</div>

<script>
  
    var statusDropdownContent = document.getElementById("statusDropdownContent");
    var prevStatus = document.getElementById('<%= prevStatus.ClientID %>');
    var currStatus = document.getElementById('<%= currStatus.ClientID %>');
  var totalStatus = document.getElementById('<%= totalStatus.ClientID %>');

    function toggleStatusDropdown() {
        statusDropdownContent.classList.toggle("show");
    }

    function updateStatusCountLabel(selectedOption) {
        var statusCountLabel = document.getElementById("statusCountLabel");
        statusCountLabel.textContent = selectedOption + ":";

    
        prevStatus.style.display = "none";
        currStatus.style.display = "none";
        totalStatus.style.display = "none";

 
        if (selectedOption === "Previous Month") {
            prevStatus.style.display = "block";
        } else if (selectedOption === "Current Month") {
            currStatus.style.display = "block";
        } else if (selectedOption === "Total Count") {
            totalStatus.style.display = "block";
        }


        statusDropdownContent.classList.remove("show");
    }


    window.addEventListener("DOMContentLoaded", function () {
        prevStatus.style.display = "none";
        totalStatus.style.display = "none";
    });
</script>





                       


<div class="col-xl-3 col-md-6 mb-4">
  <div class="bg">
    <div class="card card1 card-body">
      <h3 class="card-title">Files</h3>
      <div class="metric">
        <div class="dropdown no-arrow">
          <a class="dropdown-toggle btn-sm" role="button" id="filesDropdownMenuLink" onclick="toggleFilesDropdown()"
            aria-haspopup="true" aria-expanded="false" style="position: absolute; top: -42px; left: 150px; padding-right: 25px;">
            <i class="fas fa-ellipsis-v"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" id="filesDropdownContent"
            style="position: absolute; top: -149px; left: 69px;">
            <a class="dropdown-item" onclick="updateFilesCountLabel('Current Month')">Current Month</a>
            <a class="dropdown-item" onclick="updateFilesCountLabel('Previous Month')">Previous Month</a>
            <a class="dropdown-item" onclick="updateFilesCountLabel('Total Count')">Total Count</a>
          </div>
        </div>
      </div>
      <div class="metric">
        <span id="filesCountLabel">Current Month:</span>
        <h1 class="mb-1 text-primary" id="prevFiles" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="currFiles" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="totalFiles" runat="server" onclick="fetchFilesData(2)"></h1>
      </div>
    </div>
  </div>
</div>

<script>
    // Add necessary JavaScript for the "Files" component here
    var filesDropdownContent = document.getElementById("filesDropdownContent");
    var prevFiles = document.getElementById('<%= prevFiles.ClientID %>');
    var currFiles = document.getElementById('<%= currFiles.ClientID %>');
  var totalFiles = document.getElementById('<%= totalFiles.ClientID %>');

    function toggleFilesDropdown() {
        filesDropdownContent.classList.toggle("show");
    }

    function updateFilesCountLabel(selectedOption) {
        var filesCountLabel = document.getElementById("filesCountLabel");
        filesCountLabel.textContent = selectedOption + ":";

        // Hide all count elements
        prevFiles.style.display = "none";
        currFiles.style.display = "none";
        totalFiles.style.display = "none";

        // Show the selected count element
        if (selectedOption === "Previous Month") {
            prevFiles.style.display = "block";
        } else if (selectedOption === "Current Month") {
            currFiles.style.display = "block";
        } else if (selectedOption === "Total Count") {
            totalFiles.style.display = "block";
        }

        // Hide the dropdown after selecting an option
        filesDropdownContent.classList.remove("show");
    }

    // Hide the count elements initially except for the current month
    window.addEventListener("DOMContentLoaded", function () {
        prevFiles.style.display = "none";
        totalFiles.style.display = "none";
    });
</script>








<div class="col-xl-3 col-md-6 mb-4">
  <div class="bg">
    <div class="card card1 card-body">
      <h3 class="card-title">Invention</h3>
      <div class="metric">
        <div class="dropdown no-arrow">
          <a class="dropdown-toggle btn-sm" role="button" id="inventionDropdownMenuLink" onclick="toggleInventionDropdown()"
            aria-haspopup="true" aria-expanded="false" style="position: absolute; top: -42px; left: 150px; padding-right: 25px;">
            <i class="fas fa-ellipsis-v"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" id="inventionDropdownContent"
            style="position: absolute; top: -149px; left: 69px;">
            <a class="dropdown-item" onclick="updateInventionCountLabel('Current Month')">Current Month</a>
            <a class="dropdown-item" onclick="updateInventionCountLabel('Previous Month')">Previous Month</a>
            <a class="dropdown-item" onclick="updateInventionCountLabel('Total Count')">Total Count</a>
          </div>
        </div>
      </div>
      <div class="metric">
        <span id="inventionCountLabel">Current Month:</span>
        <h1 class="mb-1 text-primary" id="prevInvention" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="currInvention" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="totalInvention" runat="server" onclick="fetchInventionData(2)"></h1>
      </div>
    </div>
  </div>
</div>

<script>
    // Add necessary JavaScript for the "Invention" component here
    var inventionDropdownContent = document.getElementById("inventionDropdownContent");
    var prevInvention = document.getElementById('<%= prevInvention.ClientID %>');
    var currInvention = document.getElementById('<%= currInvention.ClientID %>');
  var totalInvention = document.getElementById('<%= totalInvention.ClientID %>');

    function toggleInventionDropdown() {
        inventionDropdownContent.classList.toggle("show");
    }

    function updateInventionCountLabel(selectedOption) {
        var inventionCountLabel = document.getElementById("inventionCountLabel");
        inventionCountLabel.textContent = selectedOption + ":";

        // Hide all count elements
        prevInvention.style.display = "none";
        currInvention.style.display = "none";
        totalInvention.style.display = "none";

        // Show the selected count element
        if (selectedOption === "Previous Month") {
            prevInvention.style.display = "block";
        } else if (selectedOption === "Current Month") {
            currInvention.style.display = "block";
        } else if (selectedOption === "Total Count") {
            totalInvention.style.display = "block";
        }

        // Hide the dropdown after selecting an option
        inventionDropdownContent.classList.remove("show");
    }

    // Hide the count elements initially except for the current month
    window.addEventListener("DOMContentLoaded", function () {
        prevInvention.style.display = "none";
        totalInvention.style.display = "none";
    });
</script>

                    </div>





                    <div class="row">







                <div class="col-xl-3 col-md-6 mb-4">
  <div class="bg">
    <div class="card card1 card-body">
      <h3 class="card-title">TTRecord</h3>
      <div class="metric">
        <div class="dropdown no-arrow">
          <a class="dropdown-toggle btn-sm" role="button" id="ttRecordDropdownMenuLink" onclick="toggleTTRecordDropdown()"
            aria-haspopup="true" aria-expanded="false" style="position: absolute; top: -42px; left: 150px; padding-right: 25px;">
            <i class="fas fa-ellipsis-v"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" id="ttRecordDropdownContent"
            style="position: absolute; top: -149px; left: 69px;">
            <a class="dropdown-item" onclick="updateTTRecordCountLabel('Current Month')">Current Month</a>
            <a class="dropdown-item" onclick="updateTTRecordCountLabel('Previous Month')">Previous Month</a>
            <a class="dropdown-item" onclick="updateTTRecordCountLabel('Total Count')">Total Count</a>
          </div>
        </div>
      </div>
      <div class="metric">
        <span id="ttRecordCountLabel">Current Month:</span>
        <h1 class="mb-1 text-primary" id="prevTTRecord" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="currTTRecord" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="totalTTRecord" runat="server" onclick="fetchTTRecordData(2)"></h1>
      </div>
    </div>
  </div>
</div>

<script>
    // Add necessary JavaScript for the "TTRecord" component here
    var ttRecordDropdownContent = document.getElementById("ttRecordDropdownContent");
    var prevTTRecord = document.getElementById('<%= prevTTRecord.ClientID %>');
    var currTTRecord = document.getElementById('<%= currTTRecord.ClientID %>');
  var totalTTRecord = document.getElementById('<%= totalTTRecord.ClientID %>');

    function toggleTTRecordDropdown() {
        ttRecordDropdownContent.classList.toggle("show");
    }

    function updateTTRecordCountLabel(selectedOption) {
        var ttRecordCountLabel = document.getElementById("ttRecordCountLabel");
        ttRecordCountLabel.textContent = selectedOption + ":";

        // Hide all count elements
        prevTTRecord.style.display = "none";
        currTTRecord.style.display = "none";
        totalTTRecord.style.display = "none";

        // Show the selected count element
        if (selectedOption === "Previous Month") {
            prevTTRecord.style.display = "block";
        } else if (selectedOption === "Current Month") {
            currTTRecord.style.display = "block";
        } else if (selectedOption === "Total Count") {
            totalTTRecord.style.display = "block";
        }

        // Hide the dropdown after selecting an option
        ttRecordDropdownContent.classList.remove("show");
    }

    // Hide the count elements initially except for the current month
    window.addEventListener("DOMContentLoaded", function () {
        prevTTRecord.style.display = "none";
        totalTTRecord.style.display = "none";
    });
</script>






<div class="col-xl-3 col-md-6 mb-4">
  <div class="bg">
    <div class="card card1 card-body">
      <h3 class="card-title">Agreement</h3>
      <div class="metric">
        <div class="dropdown no-arrow">
          <a class="dropdown-toggle btn-sm" role="button" id="agreementDropdownMenuLink" onclick="toggleAgreementDropdown()"
            aria-haspopup="true" aria-expanded="false" style="position: absolute; top: -42px; left: 150px; padding-right: 25px;">
            <i class="fas fa-ellipsis-v"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" id="agreementDropdownContent"
            style="position: absolute; top: -149px; left: 69px;">
            <a class="dropdown-item" onclick="updateAgreementCountLabel('Current Month')">Current Month</a>
            <a class="dropdown-item" onclick="updateAgreementCountLabel('Previous Month')">Previous Month</a>
            <a class="dropdown-item" onclick="updateAgreementCountLabel('Total Count')">Total Count</a>
          </div>
        </div>
      </div>
      <div class="metric">
        <span id="agreementCountLabel">Current Month:</span>
        <h1 class="mb-1 text-primary" id="prevAgreement" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="currAgreement" runat="server" onclick=""></h1>
        <h1 class="mb-1 text-primary" id="totalAgreement" runat="server" onclick="fetchAgreementData(2)"></h1>
      </div>
    </div>
  </div>
</div>

<script>
    // Add necessary JavaScript for the "Agreement" component here
    var agreementDropdownContent = document.getElementById("agreementDropdownContent");
    var prevAgreement = document.getElementById('<%= prevAgreement.ClientID %>');
    var currAgreement = document.getElementById('<%= currAgreement.ClientID %>');
  var totalAgreement = document.getElementById('<%= totalAgreement.ClientID %>');

    function toggleAgreementDropdown() {
        agreementDropdownContent.classList.toggle("show");
    }

    function updateAgreementCountLabel(selectedOption) {
        var agreementCountLabel = document.getElementById("agreementCountLabel");
        agreementCountLabel.textContent = selectedOption + ":";

        // Hide all count elements
        prevAgreement.style.display = "none";
        currAgreement.style.display = "none";
        totalAgreement.style.display = "none";

        // Show the selected count element
        if (selectedOption === "Previous Month") {
            prevAgreement.style.display = "block";
        } else if (selectedOption === "Current Month") {
            currAgreement.style.display = "block";
        } else if (selectedOption === "Total Count") {
            totalAgreement.style.display = "block";
        }

        // Hide the dropdown after selecting an option
        agreementDropdownContent.classList.remove("show");
    }

    // Hide the count elements initially except for the current month
    window.addEventListener("DOMContentLoaded", function () {
        prevAgreement.style.display = "none";
        totalAgreement.style.display = "none";
    });
</script>





                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div id="container1"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div id="container2" aria-disabled="True" aria-required="True"></div>
                        </div>
                    </div>
                    <%--</div>--%>
                </div>
            </div>
        </div>
  




    
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">View Data</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div id="divDetails" style="overflow-x: scroll;"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>






            </div>
        </div>







      <div class="col-xl-12 col-lg-7 mb-4">
  <div class="card">
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
      <h6 class="m-0 font-weight-bold text-primary">Deadline Details</h6>
      <a class="m-0 float-right btn btn-danger btn-sm" href="#">View More <i class="fas fa-chevron-right"></i></a>
    </div>
    <div class="table-responsive">
      <table class="table align-items-center table-flush">
        <thead class="thead-light">
          <tr>
            <th>Serial No.</th>
            <th>Reference No.</th>
            <th>Department</th>
            <th>Status</th>
            <th>Due Date</th>
            <th>Description</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td><a href="#">IDF001</a></td>
            <td>IDF</td>
            <td><span class="badge badge-success">Completed</span></td>
            <td>07-06-2023</td>




            <td><span data-before-text="1" data-before-type="green dot">Folow up</span></td>



            <td><a href="#" class="btn btn-sm btn-danger">Delete</a></td>
          </tr>
          <tr>
            <td>2</td>
            <td><a href="#">CD001</a></td>
            <td>Case Diary</td>
            <td><span class="badge badge-warning">Hold</span></td>    

            <td>24-07-2023</td>
            <td>          <span data-before-text="1" data-before-type="orange dot">Renewal due</span></td>
            <td><a href="#" class="btn btn-sm btn-secondary">Hide</a></td>
          </tr>
          <tr>
            <td>3</td>
            <td><a href="#">TT001</a></td>
            <td>TT</td>
            <td><span class="badge badge-danger">Pending</span></td>
            <td>12-05-2023</td>
            <td><span data-before-text="1" data-before-type="red dot">Reply awaited</span></td>
            <td><a href="#" class="btn btn-sm btn-danger">Delete</a></td>
          </tr>
          <tr>
            <td>4</td>
            <td><a href="#">CD002</a></td>
            <td>Case diary</td>
            <td><span class="badge badge-info">Processing</span></td>
            <td>30-07-2023</td>
            <td><span data-before-text="1" data-before-type="orange dot">Renewal due</span></td>
            <td><a href="#" class="btn btn-sm btn-secondary">Hide</a></td>
          </tr>
          <tr>
            <td>5</td>
            <td><a href="#">IDF002</a></td>
            <td>IDF</td>
            <td><span class="badge badge-success">Completed</span></td>
            <td>10-09-2023</td>
            <td><span data-before-text="1" data-before-type="red dot">Reply awaited</span></td>
            <td><a href="#" class="btn btn-sm btn-danger">Delete</a></td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="card-footer"></div>
  </div>
</div>




              </div>








    <style>
        [data-after-text],
[data-before-text] {
	--badge-offset-x: calc(0px - var(--badge-size) / 3);
	--badge-offset-y: calc(0px - var(--badge-size) / 3);
	--badge-size: 1.5rem;
	--circle-size: 2rem;
	--dot-offset: 0.5rem;
	--dot-size: 0.5rem;
		
	--b: initial;
	--bgc: hsl(195, 100%, 30%);
	--bdrs: 0;
	--c: hsl(195, 100%, 99%);
	--d: inline-flex;
	--fz: 0.625rem;
	--fw: 700;
	--h: auto;
	--l: initial;
	--m: 0.4rem;
	--p: 0;
	--pos: static;
	--r: initial;
	--t: initial;
	--tt: uppercase;
	--w: initial;
	
	position: relative;
}

[data-after-text]:not([data-after-text=""])::after {
	content: attr(data-after-text);
}
[data-before-text]:not([data-before-text=""])::before {
	content: attr(data-before-text);
}

[data-after-text]:not([data-after-text=""])::after,
[data-before-text]:not([data-before-text=""])::before {
	align-items: center;
	background: var(--bgc);
	border-radius: var(--bdrs);
	bottom: var(--b);
	box-shadow: var(--bxsh);
	box-sizing: border-box;
	color: var(--c);
	display: var(--d);
	font-size: var(--fz);
	font-weight: var(--fw);
	height: var(--h);
	justify-content: center;
	left: var(--l);
	padding: var(--p);
	position: var(--pos);
	right: var(--r);
	text-decoration: none;
	text-transform: var(--tt);
	top: var(--t);
	width: var(--w);
}

/* MODIFIERS */
[data-after-type*="badge"]::after,
[data-before-type*="badge"]::before {
	--bdrs: var(--badge-size);
	--bxsh: 0 0 0 2px rgba(255, 255, 255, 0.5);
	--h: var(--badge-size);
	--p: 0;
	--pos: absolute;
	--w: var(--badge-size);
}
[data-after-type*="circle"],
[data-before-type*="circle"]{
	align-items: center;
	display: flex;
}
[data-after-type*="circle"]::after,
[data-before-type*="circle"]::before {
	--bdrs: 50%;
	--fw: 400;
	--h: var(--circle-size);
	// --pos: relative;
	// --t: -0.75em;
	--tt: initial;
	--w: var(--circle-size);
}
[data-after-type*="circle"]::after,
[data-after-type*="pill"]::after {
	margin-inline-start: 1ch;
}
[data-before-type*="circle"]::before,
[data-before-type*="dot"]::before,
[data-before-type*="pill"]::before {
	margin-inline-end: 1ch;
}
[data-after-type*="dot"]::after,
[data-before-type*="dot"]::before {
	--bdrs: 50%;
	--d: inline-block;
	--fz: 50%;
	--h: var(--dot-size);
	--p: 0;
	--pos: relative;
	--t: -1px;
	--w: var(--dot-size);
}
[data-after-type*="dot"]::after,
[data-before-type*="dot"]::before {
	content: "" !important;
}
[data-after-type*="pill"]::after,
[data-before-type*="pil"]::before {
	--bdrs: 1rem;
	--p: 0.25rem 0.75rem;
	--pos: relative;
	--t: -1px;
}

/* COLORS */
[data-after-type*="blue"]::after,
[data-before-type*="blue"]::before {
	--bgc: #007acc;
}
[data-after-type*="darkgray"]::after,
[data-before-type*="darkgray"]::before {
	--bgc: #706e6b;
	--c: #fff;
}
[data-after-type*="green"]::after,
[data-before-type*="green"]::before {
	--bgc: #04844b;
}
[data-after-type*="lightgray"]::after,
[data-before-type*="lightgray"]::before {
	--bgc: #ecebea;
	--c: #080707;
}
[data-after-type*="orange"]::after,
[data-before-type*="orange"]::before {
	--bgc: #ffb75d;
	--c: #080707;
}

[data-after-type*="red"]::after,
[data-before-type*="red"]::before {
	--bgc: #c23934;
}

/* POSITION */
[data-after-type*="top"]::after,
[data-before-type*="top"]::before {
	--b: auto;
	--pos: absolute;
	--t: var(--dot-offset);
}
[data-after-type*="right"]::after,
[data-before-type*="right"]::before {
	--l: auto;
	--pos: absolute;
	--r: var(--dot-offset);
}
[data-after-type*="bottom"]::after,
[data-before-type*="bottom"]::before {
	--b: var(--dot-offset);
	--pos: absolute;
	--t: auto;
}
[data-after-type*="left"]::after,
[data-before-type*="left"]::before {
	--pos: absolute;
	--r: auto;
	--l: var(--dot-offset);
}
[data-after-type*="badge"][data-after-type*="top"]::after,
[data-before-type*="badge"][data-before-type*="top"]::before {
	--m: 0;
	--t: var(--badge-offset-y);
}
[data-after-type*="badge"][data-after-type*="right"]::after,
[data-before-type*="badge"][data-before-type*="right"]::before {
	--m: 0;
	--r: var(--badge-offset-x);
}
[data-after-type*="badge"][data-after-type*="bottom"]::after,
[data-before-type*="badge"][data-before-type*="bottom"]::before {
	--b: var(--badge-offset-y);
	--m: 0;
}
[data-after-type*="badge"][data-after-type*="left"]::after,
[data-before-type*="badge"][data-before-type*="left"]::before {
	--l: var(--badge-offset-x);
	--m: 0;
}


/* For this demo only */
/*body { font-family: system-ui, sans-serif; font-size: 1rem; padding: 0rem; }
button {
	background-image: linear-gradient(34deg, hsl(195, 25%, 80%), hsl(195, 25%, 90%));
	border: 0;
	border-radius: .25rem;
	font-size: 1rem;
	margin: 0.5rem 0.5rem 0.5rem 0;
	padding: 0.75rem 1.5rem;
}*/
    </style>
</asp:Content>
