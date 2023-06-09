﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Competitor.aspx.cs" Inherits="Sports_Management_System.Competitor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <link href="bootstrap.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"/>
    <title>Competitor Module</title>
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
              <asp:GridView id="CompetitorTable" 
                    DataKeyNames="Competitor_ID"
                    CSSClass="table table-striped"
                    GridLines="None"
                    autogeneratecolumns="False"
                    autogenerateeditbutton="true"
                    autogeneratedeletebutton="true"
                    emptydatatext="No data available." 
                    onRowEditing="CompetitorTable_RowEditing"
                    onRowUpdating="CompetitorTable_RowUpdating"
                    onRowCancelingEdit="CompetitorTable_RowCancelingEdit"
                    onRowDeleting="CompetitorTable_RowDeleting"
                    onRowDatabound="CompetitorTable_RowDataBound"
                    allowpaging="True" 
                    runat="server">
                    <Columns>
                        <%--Competitor ID--%>
                        <asp:TemplateField HeaderText="Competitor ID">
                            <ItemTemplate>
                                <%#Eval("Competitor_ID") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <%--First Name Text Box--%>
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <%#Eval("Competitor_FName") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Competitor_FName"
                                    text='<%#Eval("Competitor_FName")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="FirstNameReqValidator"
                                    runat="server"
                                    ControlToValidate="Competitor_FName"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="First name required<br />"/>
                                <asp:RegularExpressionValidator ID="GameNameRegValidator" 
                                    runat="server"    
                                    ErrorMessage="30 character limit<br />"
                                    ControlToValidate="Competitor_FName"
                                    Style="color: red; font-style:italic"
                                    Display="Dynamic"
                                    ValidationExpression="^[\s\S]{1,30}$">
                                </asp:RegularExpressionValidator>
                            </EditITemTemplate>
                        </asp:TemplateField>

                        <%--Surname Text Box--%>
                        <asp:TemplateField HeaderText="Surname" >
                            <ItemTemplate>
                                <%#Eval("Competitor_Surname") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Competitor_Surname"
                                    text='<%#Eval("Competitor_Surname")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="SurnameReqValidator"
                                    runat="server"
                                    ControlToValidate="Competitor_Surname"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="Surname required<br />"/>
                                <asp:RegularExpressionValidator ID="SurnameCharLimitValidator" 
                                    runat="server"    
                                    ErrorMessage="30 character limit<br />"
                                    ControlToValidate="Competitor_Surname"
                                    Style="color: red; font-style:italic"
                                    Display="Dynamic"
                                    ValidationExpression="^[\s\S]{1,30}$">
                                </asp:RegularExpressionValidator>
                            </EditITemTemplate>
                        </asp:TemplateField>

                        <%-- DOB Text Box --%>
                        <asp:TemplateField HeaderText="DOB (DD/MM/YYYY)">
                            <ItemTemplate>
                                <%#Eval("Competitor_DOB") %>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox id="Competitor_DOB"
                                    text='<%#Eval("Competitor_DOB") %>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="DOBReqValidator"
                                    runat="server"
                                    ControlToValidate="Competitor_DOB"
                                    Style="color: red; font-style:italic"
                                    Display="Dynamic"
                                    ErrorMessage="DOB required<br />"/>
                                <asp:RegularExpressionValidator ID="DOBRegexValidator"
                                    runat="server"
                                    ControlToValidate="Competitor_DOB"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMEssage="Must be in format DD/MM/YYYY"
                                    ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <%--Country Text Box--%>
                        <asp:TemplateField HeaderText="Country" >
                            <ItemTemplate>
                                <%#Eval("Competitor_Country") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Competitor_Country"
                                    text='<%#Eval("Competitor_Country")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="CountryReqValidator"
                                    runat="server"
                                    ControlToValidate="Competitor_Country"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="Country required<br />"/>
                            </EditITemTemplate>
                        </asp:TemplateField>
                        
                        <%--Competitor Bio Text Box--%>
                        <asp:TemplateField HeaderText="Bio">
                            <ItemTemplate>
                                <%#Eval("Competitor_Bio") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Competitor_Bio"
                                    text='<%#Eval("Competitor_Bio")%>'
                                    runat="server" />
                                </br>
                                <asp:RegularExpressionValidator ID="BioCharLimitValidator" 
                                    runat="server"    
                                    ErrorMessage="100 character limit<br />"
                                    ControlToValidate="Competitor_Bio"
                                    Style="color: red; font-style:italic"
                                    Display="Dynamic"
                                    ValidationExpression="^[\s\S]{1,100}$">
                                </asp:RegularExpressionValidator>

                            </EditITemTemplate>
                        </asp:TemplateField>

                        <%-- Games Selection --%> 
                        <asp:TemplateField HeaderText="Add Games">  
                            <ItemTemplate>  
                                <asp:DropDownList ID="GamesDropdownList" runat="server">  
                                </asp:DropDownList>
                                <asp:Button ID="AddGameButton" Text="Add" Class="btn btn-primary btn-sm" Enabled="false" runat="server" OnClick="AddGameButton_Click" />
                                <asp:CustomValidator ID="GameCompetitorExistsCV" 
                                    runat="server" 
                                    ErrorMessage="Already participating in selected game<br />"
                                    ControlToValidate="GamesDropdownList"
                                    OnServerValidate="GameCompetitorExistsCV_ServerValidate"
                                    Style="color: red; font-style:italic; display:block"
                                    Display="Dynamic" />
                            </ItemTemplate>  
                        </asp:TemplateField>  

                        <%-- Games Deletion --%> 
                        <asp:TemplateField HeaderText="Delete Games">  
                            <ItemTemplate>  
                                <asp:DropDownList ID="GamesDropdownListDelete" Enabled="false" runat="server">  
                                </asp:DropDownList>
                                <asp:Button ID="DeleteGameButton" Text="Delete" Class="btn btn-primary btn-sm" Enabled="false" runat="server" OnClick="DeleteGameButton_Click" />
                                <asp:CustomValidator ID="GameCompetitorDeleteCV" 
                                    runat="server" 
                                    ErrorMessage="Must participate in at least one game. Add another game for this competitor prior to deleting this game<br />"
                                    ControlToValidate="GamesDropdownListDelete"
                                    OnServerValidate="GameCompetitorDeleteCV_ServerValidate"
                                    Style="color: red; font-style:italic; display:block"
                                    Display="Dynamic" />
                            </ItemTemplate>  
                        </asp:TemplateField>  
                    </Columns>
                </asp:GridView>

              <div style="text-align: -webkit-center;">
                <table runat="server">
                    <tr>
                        <td>
                            First Name:<br />
                            <asp:TextBox ID="TxtFirstName" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            Surname:<br />
                            <asp:TextBox ID="TxtSurname" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            DOB:<br />
                            <asp:TextBox ID="TxtDOB" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            Country:<br />
                            <asp:TextBox ID="TxtCountry" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            Bio:<br />
                            <asp:TextBox ID="TxtBio" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            Game:<br />
                            <asp:DropDownList ID="GamesDropDownList" runat="server"></asp:DropDownList>
                        </td>
                        <td style="width: auto">
                            <asp:Button ID="InsertCompetitor" style="margin-top:23px" ValidationGroup="InsertGroup" class="btn btn-primary btn-sm" runat="server" Text="Insert" OnClick="InsertCompetitor_Click" />
                        </td>
                    </tr>
                </table>


                <asp:CustomValidator
                    ID="GamesDropDownCustomValidatorInsert"
                    runat="server"
                    Display="Dynamic"
                    ValidationGroup="InsertGroup"
                    ControlToValidate="GamesDropDownList"
                    Style="color: red; font-style:italic"
                    ErrorMessage="A game must be selected<br />" />

                <asp:RegularExpressionValidator 
                    ID="InsertFirstNameRegexValidator" 
                    ControlToValidate="TxtFirstName" 
                    runat="server" 
                    Display="Dynamic"
                    ValidationGroup="InsertGroup"
                    Style="color: red; font-style:italic"
                    ErrorMessage="30 character limit<br />" 
                    ValidationExpression="^[\s\S]{1,30}$">
                </asp:RegularExpressionValidator>

                <asp:RegularExpressionValidator 
                    ID="InsertSurnameRegexValidator" 
                    ControlToValidate="TxtSurname" 
                    runat="server" 
                    Display="Dynamic"
                    ValidationGroup="InsertGroup"
                    Style="color: red; font-style:italic"
                    ErrorMessage="30 character limit<br />" 
                    ValidationExpression="^[\s\S]{1,30}$">
                </asp:RegularExpressionValidator>

                <asp:RegularExpressionValidator 
                    ID="InsertDOBRegexValidator" 
                    ControlToValidate="TxtDOB" 
                    runat="server" 
                    Display="Dynamic"
                    ValidationGroup="InsertGroup"
                    Style="color: red; font-style:italic"
                    ErrorMessage="DOB must be in DD/MM/YYYY Format<br />" 
                    ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$" >
                </asp:RegularExpressionValidator>

                <asp:RegularExpressionValidator 
                    ID="InsertBioRegexValidator" 
                    ControlToValidate="TxtBio" 
                    runat="server" 
                    Display="Dynamic"
                    ValidationGroup="InsertGroup"
                    Style="color: red; font-style:italic"
                    ErrorMessage="100 character limit<br />" 
                    ValidationExpression="^[\s\S]{1,100}$" >
                </asp:RegularExpressionValidator>

                <asp:RequiredFieldValidator
                    ID="InsertFirstNameReqValidator" 
                    runat="server" 
                    ValidationGroup="InsertGroup"
                    ControlToValidate="TxtFirstName"
                    Style="color: red; font-style:italic"
                    Display="Dynamic"
                    ErrorMessage="First name required<br />">
                </asp:RequiredFieldValidator>

                <asp:RequiredFieldValidator
                    ID="InsertSurnameReqValidator" 
                    runat="server" 
                    ValidationGroup="InsertGroup"
                    ControlToValidate="TxtSurname"
                    Style="color: red; font-style:italic"
                    Display="Dynamic"
                    ErrorMessage="Surname required<br />">
                </asp:RequiredFieldValidator>

                <asp:RequiredFieldValidator
                    ID="InsertDOBReqValidator" 
                    runat="server" 
                    ValidationGroup="InsertGroup"
                    ControlToValidate="TxtDOB"
                    Style="color: red; font-style:italic"
                    Display="Dynamic"
                    ErrorMessage="DOB required<br />">
                </asp:RequiredFieldValidator>

                <asp:RequiredFieldValidator
                    ID="InsertCountryValidator" 
                    runat="server" 
                    ValidationGroup="InsertGroup"
                    ControlToValidate="TxtCountry"
                    Style="color: red; font-style:italic"
                    Display="Dynamic"
                    ErrorMessage="Country required<br />">
                </asp:RequiredFieldValidator>



            </div>
              </div>
        </div>
    </form>
</body>
</html>
