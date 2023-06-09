﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Sports_Management_System.Events" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <link href="bootstrap.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"/>
    <title>Events Management</title>
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
                <asp:GridView id="EventsTable" 
                    DataKeyNames="Event_ID"
                    CSSClass="table table-striped"
                    GridLines="None"
                    autogeneratecolumns="False"
                    autogenerateeditbutton="true"
                    autogeneratedeletebutton="true"
                    emptydatatext="No data available." 
                    onRowEditing="EventsTable_RowEditing"
                    onRowUpdating="EventsTable_RowUpdating"
                    onRowCancelingEdit="EventsTable_RowCancelingEdit"
                    onRowDeleting="EventsTable_RowDeleting"
                    onRowDataBound="EventsTable_RowDataBound"
                    allowpaging="True" 
                    runat="server">
                    <Columns>
                        <%--Event ID--%>
                        <asp:TemplateField HeaderText="Event ID">
                            <ItemTemplate>
                                <%#Eval("Event_ID") %>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <%--Game ID Dropdown--%>
                        <asp:TemplateField HeaderText="Game">
                            <ItemTemplate>
                                <%#getGameName(Convert.ToInt32(Eval("Game_ID"))) %>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:DropDownList ID="GameDropDownList" Enabled="true" runat="server"></asp:DropDownList>
                                <asp:CustomValidator ID="GameDropDownCV" 
                                    runat="server" 
                                    ControlToValidate="GameDropDownList"
                                    Display="Dynamic"
                                    OnServerValidate="GameDropDownCV_ServerValidate"
                                    Style="color: red; font-style:italic; display:block"
                                    ErrorMessage="A game must be selected">
                                </asp:CustomValidator>
                            </EditItemTemplate>

                        </asp:TemplateField>
                        
                        <%--Feature Event DropDown--%>
                        <asp:TemplateField HeaderText="Feature Event">
                            <ItemTemplate>
                                <%#Eval("Feature_Event") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Feature_Event"
                                    text='<%#Eval("Feature_Event")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="FeatureEventRequired"
                                    runat="server"
                                    ControlToValidate="Feature_Event"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="Must be Y or N<br />"/>
                               <asp:RegularExpressionValidator 
                                  ID="FeatureEventRegex" 
                                  runat="server" 
                                  Style="color: red; font-style:italic"
                                  Display="Dynamic"
                                  ControlToValidate="Feature_Event"
                                  ValidationExpression="[YN]"
                                  ErrorMessage="Feature event must be Y or N<br/>">
                                </asp:RegularExpressionValidator>
                            </EditITemTemplate>
                        </asp:TemplateField>

                        <%--Event Venue Text Box--%>
                        <asp:TemplateField HeaderText="Venue">
                            <ItemTemplate>
                                <%#Eval("Event_Venue") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Event_Venue"
                                    text='<%#Eval("Event_Venue")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="EventVenueRequired"
                                    runat="server"
                                    ControlToValidate="Event_Venue"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="Event venue required<br />"/>
                            </EditITemTemplate>
                        </asp:TemplateField>

                        <%--Event Date Text Box--%>
                        <asp:TemplateField HeaderText="Event date">
                            <ItemTemplate>
                                <%#Eval("Event_Date") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Event_Date"
                                    text='<%#Eval("Event_Date")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="EventDateRequired"
                                    runat="server"
                                    ControlToValidate="Event_Date"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="Event date required<br />"/>

                                <asp:RegularExpressionValidator 
                                    ID="EventDateRegex" 
                                    ControlToValidate="Event_Date" 
                                    runat="server" 
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="Event date must be in DD/MM/YYYY Format<br />" 
                                    ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$" >
                                </asp:RegularExpressionValidator>
                            </EditITemTemplate>
                        </asp:TemplateField>

                        <%--Event Start Time Text Box--%>
                        <asp:TemplateField HeaderText="Start Time">
                            <ItemTemplate>
                                <%#Eval("Event_StartTime") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Event_StartTime"
                                    text='<%#Eval("Event_StartTime")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="EventStartRequired"
                                    runat="server"
                                    ControlToValidate="Event_StartTime"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="Start time required<br />"/>
                                <asp:RegularExpressionValidator 
                                  ID="EventStartRegex" 
                                  runat="server" 
                                  Style="color: red; font-style:italic"
                                  Display="Dynamic"
                                  ControlToValidate="Event_StartTime"
                                  ValidationExpression="^([01]\d?|2[0-4]):[0-5]\d(:[0-5]\d)?$"
                                  ErrorMessage="Start Time must be in HH:MM Format<br/>">
                              </asp:RegularExpressionValidator>
                            </EditITemTemplate>
                        </asp:TemplateField>

                        <%--Event End Time Text Box--%>
                        <asp:TemplateField HeaderText="End Time">
                            <ItemTemplate>
                                <%#Eval("Event_EndTime") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Event_EndTime"
                                    text='<%#Eval("Event_EndTime")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="EventEndRequired"
                                    runat="server"
                                    ControlToValidate="Event_EndTime"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="End time required<br />"/>
                                <asp:RegularExpressionValidator 
                                  ID="EventEndRegex" 
                                  runat="server" 
                                  Style="color: red; font-style:italic"
                                  Display="Dynamic"
                                  ControlToValidate="Event_EndTime"
                                  ValidationExpression="^([01]\d?|2[0-4]):[0-5]\d(:[0-5]\d)?$"
                                  ErrorMessage="End Time must be in HH:MM Format<br/>">
                              </asp:RegularExpressionValidator>
                            </EditITemTemplate>
                        </asp:TemplateField>

                        <%--Event Description Text Box--%>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <%#Eval("Event_Description") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="Event_Description"
                                    text='<%#Eval("Event_Description")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="EventDescriptionRequired"
                                    runat="server"
                                    ControlToValidate="Event_Description"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="Description required<br />"/>
                            </EditITemTemplate>
                        </asp:TemplateField>

                        <%--World Record Text Box--%>
                        <asp:TemplateField HeaderText="World Record">
                            <ItemTemplate>
                                <%#Eval("World_Record") %>
                            </ItemTemplate>

                            <EditITemTemplate>
                                <asp:TextBox id="World_Record"
                                    text='<%#Eval("World_Record")%>'
                                    runat="server" />
                                </br>
                                <asp:RequiredFieldValidator
                                    ID="EventWorldRecordRequired"
                                    runat="server"
                                    ControlToValidate="World_Record"
                                    Display="Dynamic"
                                    Style="color: red; font-style:italic"
                                    ErrorMessage="World record required<br />"/>
                                <asp:RegularExpressionValidator 
                                  ID="WorldRecordRegex" 
                                  runat="server" 
                                  Style="color: red; font-style:italic"
                                  Display="Dynamic"
                                  ControlToValidate="World_Record"
                                  ValidationExpression="[YN]"
                                  ErrorMessage="Field must be Y or N<br/>" />
                            </EditITemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

              <div style="text-align: -webkit-center;">
                <table runat="server">
                    <tr>
                        <td>
                            Game:<br />
                            <asp:DropDownList ID="DdlGameName" runat="server" />
                        </td>
                        <td>
                            Feature Event:<br />
                            <asp:TextBox ID="TxtFeatureEvent" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            Venue:<br />
                            <asp:TextBox ID="TxtEventVenue" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            Event Date:<br />
                            <asp:TextBox ID="TxtEventDate" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            Start time:<br />
                            <asp:TextBox ID="TxtStartTime" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            End time:<br />
                            <asp:TextBox ID="TxtEndTime" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            Description:<br />
                            <asp:TextBox ID="TxtEventDescription" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            World Record:<br />
                            <asp:TextBox ID="TxtEventWorldRecord" class="form-control form-control-sm" runat="server" Width="140" />
                        </td>
                        <td style="width: auto">
                            <asp:Button ID="InsertEvent" style="margin-top:23px" ValidationGroup="InsertGroup" class="btn btn-primary btn-sm" runat="server" Text="Insert" OnClick="InsertEvent_Click" />
                        </td>
                    </tr>
                </table>

                    <asp:CustomValidator
                        ID="GamesDropDownCustomValidatorInsert"
                        runat="server"
                        Display="Dynamic"
                        ValidationGroup="InsertGroup"
                        ControlToValidate="DdlGameName"
                        Style="color: red; font-style:italic"
                        ErrorMessage="A game must be selected<br />" />

                     <asp:RequiredFieldValidator
                        ID="FeatureEventReqValidator" 
                        runat="server" 
                        ValidationGroup="InsertGroup"
                        ControlToValidate="TxtFeatureEvent"
                        Style="color: red; font-style:italic"
                        Display="Dynamic"
                        ErrorMessage="Feature event must be Y or N<br />">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator 
                          ID="FeatureEventRegexValidator" 
                          runat="server" 
                          Style="color: red; font-style:italic"
                          Display="Dynamic"
                          ControlToValidate="TxtFeatureEvent"
                          ValidationExpression="[yYnN]"
                          ErrorMessage="Feature event must be Y or N<br/>">
                      </asp:RegularExpressionValidator>

                     <asp:RequiredFieldValidator
                        ID="EventVenueReqValidator" 
                        runat="server" 
                        ValidationGroup="InsertGroup"
                        ControlToValidate="TxtEventVenue"
                        Style="color: red; font-style:italic"
                        Display="Dynamic"
                        ErrorMessage="Event venue required<br />">
                    </asp:RequiredFieldValidator>

                    <asp:RequiredFieldValidator
                        ID="EventDateRequiredValidator" 
                        runat="server" 
                        ValidationGroup="InsertGroup"
                        ControlToValidate="TxtEventDate"
                        Style="color: red; font-style:italic"
                        Display="Dynamic"
                        ErrorMessage="Event date required<br />">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator 
                        ID="EventDateRegexValidator" 
                        ControlToValidate="TxtEventDate" 
                        runat="server" 
                        Display="Dynamic"
                        ValidationGroup="InsertGroup"
                        Style="color: red; font-style:italic"
                        ErrorMessage="Event date must be in DD/MM/YYYY Format<br />" 
                        ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$" >
                    </asp:RegularExpressionValidator>

                     <asp:RequiredFieldValidator
                        ID="StarTimeReqValidator" 
                        runat="server" 
                        ValidationGroup="InsertGroup"
                        ControlToValidate="TxtStartTime"
                        Style="color: red; font-style:italic"
                        Display="Dynamic"
                        ErrorMessage="Start time required<br />">
                    </asp:RequiredFieldValidator>

                      <asp:RegularExpressionValidator 
                          ID="StartTimeRegexValidator" 
                          runat="server" 
                          Style="color: red; font-style:italic"
                          Display="Dynamic"
                          ControlToValidate="TxtStartTime"
                          ValidationExpression="^(?:[01]\d|2[0-3]):[0-5]\d$"
                          ErrorMessage="Start Time must be in HH:MM Format<br/>">
                      </asp:RegularExpressionValidator>

                     <asp:RequiredFieldValidator
                        ID="EndTimeReqValidator" 
                        runat="server" 
                        ValidationGroup="InsertGroup"
                        ControlToValidate="TxtEndTime"
                        Style="color: red; font-style:italic"
                        Display="Dynamic"
                        ErrorMessage="End time required<br />">
                    </asp:RequiredFieldValidator>

                      <asp:RegularExpressionValidator 
                          ID="EndTimeRegexValidator" 
                          runat="server" 
                          Style="color: red; font-style:italic"
                          Display="Dynamic"
                          ControlToValidate="TxtEndTime"
                          ValidationExpression="^(?:[01]\d|2[0-3]):[0-5]\d$"
                          ErrorMessage="End Time must be in HH:MM Format<br/>">
                      </asp:RegularExpressionValidator>

                     <asp:RequiredFieldValidator
                        ID="EventDescriptionReqValidator" 
                        runat="server" 
                        ValidationGroup="InsertGroup"
                        ControlToValidate="TxtEventDescription"
                        Style="color: red; font-style:italic"
                        Display="Dynamic"
                        ErrorMessage="Event description required<br />">
                    </asp:RequiredFieldValidator>

                     <asp:RequiredFieldValidator
                        ID="EventWorldRecordReqValidator" 
                        runat="server" 
                        ValidationGroup="InsertGroup"
                        ControlToValidate="TxtEventWorldRecord"
                        Style="color: red; font-style:italic"
                        Display="Dynamic"
                        ErrorMessage="World record required<br />">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator 
                        ID="EventWorldRecordRegexValidator" 
                        runat="server" 
                        Style="color: red; font-style:italic"
                        ValidationGroup="InsertGroup"
                        Display="Dynamic"
                        ControlToValidate="TxtEventWorldRecord"
                        ValidationExpression="[YN]"
                        ErrorMessage="World Record must be Y or N<br/>"/>
            </div>
              </div>
        </div>
    </form>
</body>
</html>
