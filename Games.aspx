﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="Sports_Management_System.Games" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <link href="bootstrap.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"/>
    <title>Games Module</title>
</head>
<body>
    <form id="form1" runat="server">
     <div style="height:60px; background:#353535; color:white">
            <h1 style="text-align:center">Sports Management System</h1>
        </div>
        <div runat="server">
          <div class="row" runat="server">
            <div class="justify-content-center" style="background-color:#f0f0f0">
                <ul class="nav justify-content-center">
                  <li class="nav-item">
                    <a class="nav-link" href="Games.aspx">Games</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="Competitor.aspx">Competitors</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="Events.aspx" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Events
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="Events.aspx">Events</a>
                      <a class="dropdown-item" href="Results.aspx">Results</a>
                    </div>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Reports</a>
                  </li>
                </ul>
                </div>
                <%-- SQL Grid View Table --%>
                <asp:GridView id="GamesTable" 
                    DataKeyNames="Game_ID"
                    CSSClass="table table-striped"
                    GridLines="None"
                    autogeneratecolumns="False"
                    autogenerateeditbutton="true"
                    autogeneratedeletebutton="true"
                    emptydatatext="No data available." 
                    onRowEditing="GamesTable_RowEditing"
                    onRowUpdating="GamesTable_RowUpdating"
                    onRowCancelingEdit="GamesTable_RowCancelingEdit"
                    onRowDeleting="GamesTable_RowDeleting"
                    allowpaging="true"
                    runat="server">
                    <Columns>
                        <%--Game Code Text Box--%>
                        <asp:TemplateField HeaderText="Game Code">
                            <ItemTemplate>
                                <%#Eval("Game_Code") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                
                                <asp:HiddenField ID="OldCode" Value='<%#Bind("Game_Code") %>' runat="server" />
                                <asp:TextBox id="Game_Code"
                                    text='<%#Eval("Game_Code")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="GameCodeReqUpValidator"
                                    runat="server"
                                    ControlToValidate="Game_Code"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="A Game Code is required"/>
                                <asp:RegularExpressionValidator ID="GameCodeRegUpValidator" 
                                    runat="server"    
                                    ControlToValidate="Game_Code"
                                    Style="color: red; font-style:italic"
                                    Display="Dynamic"
                                    ErrorMessage="Invalid Game Code - Must be 4 uppercase letters followed by 3 numbers<br />" 
                                    ValidationExpression="[A-Z]{4}[0-9]{3}"/>
                                <asp:CustomValidator ID="GameCodeCustomValidator"
                                    runat="server"
                                    ValidateEmptyText="true"
                                    Display="Dynamic"
                                    ControlToValidate="Game_Code"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="Game Code already exists"
                                    OnServerValidate="GameCodeCustomValidator_ServerValidate" />
                            </EditITemTemplate>
                        </asp:TemplateField>
                        
                        <%--Name Text Box--%>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <%#Eval("Game_Name") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:HiddenField ID="OldName" Value='<%#Bind("Game_Name") %>' runat="server" />
                                <asp:TextBox id="Game_Name"
                                    text='<%#Eval("Game_Name")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="GameNameReqUpdateValidator"
                                    runat="server"
                                    ControlToValidate="Game_Name"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="A game name is required<br />"/>
                                <asp:RegularExpressionValidator ID="GameNameRegValidator" 
                                    runat="server"    
                                    ErrorMessage="Game name must be at least 3 letters<br />"
                                    ControlToValidate="Game_Name"
                                    Style="color: red; font-style:italic"
                                    Display="Dynamic"
                                    ValidationExpression="^[\s\S]{3,}$">
                                </asp:RegularExpressionValidator>
                                <asp:CustomValidator ID="GameNameCustomValidator"
                                    runat="server"
                                    ValidateEmptyText="true"
                                    Display="Dynamic"
                                    ControlToValidate="Game_Name"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="Game already exists"
                                    OnServerValidate="GameNameCustomValidator_ServerValidate" />
                            </EditITemTemplate>
                        </asp:TemplateField>

                        <%--Game Duration Text Box--%>
                        <asp:TemplateField HeaderText="Duration (hrs)" >
                            <ItemTemplate>
                                <%#Eval("Game_DurationInHours") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Game_DurationInHours"
                                    text='<%#Eval("Game_DurationInHours")%>'
                                    runat="server" />
                                </br>
                                <asp:RegularExpressionValidator ID="GameDurationIntCheck" 
                                    runat="server"    
                                    ErrorMessage="Game duration must be a number"
                                    ControlToValidate="Game_DurationInHours"
                                    Style="color: red; font-style:italic"
                                    Display="Dynamic"
                                    ValidationExpression="[0-9]{1}">
                                </asp:RegularExpressionValidator>
                            </EditITemTemplate>
                        </asp:TemplateField>
                        
                        <%--Game Description Text Box--%>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <%#Eval("Game_Description") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Game_Description"
                                    text='<%#Eval("Game_Description")%>'
                                    runat="server" />
                                </br>
                            </EditITemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

              <div style="text-align: -webkit-center;">
                <table runat="server">
                    <tr>
                        <td>
                            Game Code:<br />
                            <asp:TextBox ID="txtGameCode" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            Name:<br />
                            <asp:TextBox ID="txtName" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            Duration:<br />
                            <asp:TextBox ID="intDuration" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            Description:<br />
                            <asp:TextBox ID="txtDescription" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            <asp:Button ID="btnAdd" style="margin-top:23px" ValidationGroup="InsertGroup" class="btn btn-primary btn-sm" runat="server" Text="Add" OnClick="btnAdd_Click" />
                        </td>
                    </tr>
                </table>
                <asp:RegularExpressionValidator 
                    ID="GameCodeValidator" 
                    ControlToValidate="txtGameCode" 
                    runat="server" 
                    Display="Dynamic"
                    ValidationGroup="InsertGroup"
                    Style="color: red; font-style:italic"
                    ErrorMessage="Invalid Game Code - Must be 4 uppercase letters followed by 3 numbers<br />" 
                    ValidationExpression="[A-Z]{4}[0-9]{3}">
                </asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator 
                    ID="GameDurationValidator" 
                    ControlToValidate="intDuration" 
                    runat="server" 
                    Display="Dynamic"
                    ValidationGroup="InsertGroup"
                    Style="color: red; font-style:italic"
                    ErrorMessage="Game duration must be a number" 
                    ValidationExpression="[0-9]{1}">
                </asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator
                    ID="GameCodeReqValidator" 
                    runat="server" 
                    ValidationGroup="InsertGroup"
                    ControlToValidate="txtGameCode"
                    Style="color: red; font-style:italic"
                    Display="Dynamic"
                    ErrorMessage="A game code is required<br />">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator
                    ID="GameNameReqValidator" 
                    runat="server" 
                    ValidationGroup="InsertGroup"
                    ControlToValidate="txtName"
                    Style="color: red; font-style:italic"
                    Display="Dynamic"
                    ErrorMessage="A game name is required<br />">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="GameNameValidator" 
                    runat="server"    
                    ErrorMessage="Game name must be at least 3 letters<br />"
                    ValidationGroup="InsertGroup"
                    ControlToValidate="txtName"
                    Style="color: red; font-style:italic"
                    Display="Dynamic"
                    ValidationExpression="^[\s\S]{3,}$">
                </asp:RegularExpressionValidator>
                <asp:CustomValidator ID="GameExistsValidator" 
                    runat="server" 
                    ValidationGroup="InsertGroup"
                    ControlToValidate="txtGameCode"
                    ValidateEmptyText="true"
                    Style="color: red; font-style:italic"
                    Display="Dynamic"
                    OnServerValidate="DuplicateCodeValidator_ServerValidate"
                    ErrorMessage="Game code exists, please enter unique code<br/>">
                </asp:CustomValidator>
                <asp:CustomValidator ID="GameNameExistsValidator" 
                    runat="server" 
                    ValidationGroup="InsertGroup"
                    ControlToValidate="txtName"
                    ValidateEmptyText="true"
                    Style="color: red; font-style:italic"
                    Display="Dynamic"
                    OnServerValidate="GameNameExistsValidator_ServerValidate"
                    ErrorMessage="Game already exists, please enter a unique name<br/">
                </asp:CustomValidator>
            </div>
              </div>
        </div>
    </form>
</body>
</html>
