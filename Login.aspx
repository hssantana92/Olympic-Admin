<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sports_Management_System.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <title>Sports Management System Login</title>
</head>
<body>
    <div style="height:60px; background:#353535; color:white">
        <h1 style="text-align:center">Sports Management System</h1>
    </div>
    <div class="container">
      <div class="row">
        <div class="col">
        </div>
        <div class="col-6">
            <form id="SystemLogin" runat="server">
                <div class="form-group">
                    <asp:Label ID="userEmailLbl" class="form-check-label" runat="server" Text="Email Address:"></asp:Label>
                    <asp:TextBox ID="userEmail" class="form-control"  placeholder="Email address" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="validateUserEmailFld" style="color:red; font-style:italic" runat="server" ControlToValidate="userEmail" Display="Static" ErrorMessage="Invalid Email"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="userPasswordLbl" class="form-check-label" runat="server" Text="Password:"></asp:Label>
                    <asp:TextBox ID="userPassword" class="form-control" placeholder="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="validateUserPasswordFld" style="color:red; font-style:italic" runat="server" ControlToValidate="userPassword" Display="Static" ErrorMessage="Invalid Password"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Button ID="LoginBtn" class="btn btn-primary" runat="server" Text="Login" onClick="LoginBtn_Click"/>
                </div>
            </form>
        </div>
        <div class="col">
        </div>
      </div>
    </div>
</body>
</html>
