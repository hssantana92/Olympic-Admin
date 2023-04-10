<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modules.aspx.cs" Inherits="Sports_Management_System.Modules" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1">
    <div style="height:60px; background:#353535; color:white">
        <h1 style="text-align:center">Sports Management System</h1>
    </div>
    <div>
      <div class="row" runat="server">
        <div class="justify-content-center" style="background-color:#f0f0f0">
            <ul class="nav justify-content-center">
              <li class="nav-item">
                <a class="nav-link" href="Games.aspx">Games</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Competitors</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Events</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Reports</a>
              </li>
            </ul>
        </div>
      </div>
    </div>
        </form>
</body>
</html>
