<%@ Page Title="Customer Survey" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CustomerSurvey.aspx.cs" Inherits="CustomerSurvey" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>SportsPro</h1>
        <p class="lead">Sports management software for the sports enthusiast</p>
    </div>

    <asp:Label ID="Label1" runat="server" Text="Enter your Customer ID:"></asp:Label>
    <asp:TextBox ID="txtBxCustID" runat="server"></asp:TextBox>
    <asp:Button ID="btnGetIncidents" runat="server" Text="Get Incidents" 
        onclick="btn_GetIncidents_click" ValidationGroup="Cust_entered" Width="160px" />
    <asp:RequiredFieldValidator ID="rvCustomerId" runat="server" 
        ControlToValidate="txtBxCustID" ErrorMessage="Enter your ID number" 
        Display="Dynamic" ForeColor="Red" SetFocusOnError="True" 
        ValidationGroup="Cust_entered">*</asp:RequiredFieldValidator>
    <asp:CompareValidator ID="cvCustomerID" runat="server" 
        ControlToValidate="txtBxCustID" ErrorMessage="YOU MUST ENTER A NUMBER" 
        Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ForeColor="Red" 
        ValidationGroup="Val_CustID">*</asp:CompareValidator>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
        ValidationGroup="Val_CustID" />
    <asp:Label ID="Label7" runat="server" Enabled="False" Visible="False"></asp:Label>
    <br />
    <asp:ListBox ID="lbIncidents" runat="server" Height="95px" 
        Width="667px" ValidationGroup="Submit_entered" Enabled="False"></asp:ListBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IncidentID], [CustomerID], [ProductCode], [TechID], [DateOpened], [DateClosed], [Title], [Description] FROM [Incidents] ORDER BY [CustomerID]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Enabled="False" 
        Text="Please rate this incident by the following categories:" Font-Bold="True"></asp:Label>
    <table style="width: 79%;">
        <tr>
            <td class="style1" style="width: 176px">
                <asp:Label ID="Label3" runat="server" Text="Response time:" Font-Bold="True" Enabled="False"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    RepeatDirection="Horizontal" Font-Bold="False" Height="20px" Width="524px" Enabled="False">
                    <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                    <asp:ListItem Value="3">Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style2" style="width: 176px">
                <asp:Label ID="Label4" runat="server" Text="Technician efficiency:" Font-Bold="True" Enabled="False"></asp:Label>
            </td>
            <td class="style3">
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                    RepeatDirection="Horizontal" Height="20px" Width="524px" Enabled="False">
                    <asp:ListItem Value="1">Not Satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Somewhat Satisfied</asp:ListItem>
                    <asp:ListItem Value="3">Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">Completely Satisfied</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style1" style="width: 176px">
                <asp:Label ID="Label5" runat="server" Text="Problem Resolution:" Font-Bold="True" Enabled="False"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList3" runat="server" 
                    RepeatDirection="Horizontal" Height="20px" Width="524px" Enabled="False">
                    <asp:ListItem Value="1">Not Satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Somewhat Satisfied</asp:ListItem>
                    <asp:ListItem Value="3">Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">Completely Satisfied</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Additional comments:" Enabled="False"></asp:Label>
    &nbsp;<asp:TextBox ID="txtBxComments" runat="server" Height="65px" 
        MaxLength="500" TextMode="MultiLine" Width="527px" Enabled="False"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:CheckBox ID="CheckBox1" runat="server" 
        Text="Please contact me to discuss this incident." Font-Bold="True" Enabled="False" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table class="nav-justified">
        <tr>
            <td style="height: 22px; width: 60px"></td>
            <td style="height: 22px">
    <asp:RadioButtonList ID="RadioButtonList4" runat="server" Font-Bold="True" Width="168px" Enabled="False">
        <asp:ListItem>Contact by email</asp:ListItem>
        <asp:ListItem>Contact by phone</asp:ListItem>
    </asp:RadioButtonList>
            </td>
        </tr>
    </table>
&nbsp;&nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        onclick="btnSubmit_Click" Width="160px" ValidationGroup="Submit_entered" Enabled="False" />
    &nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <asp:RequiredFieldValidator ID="rvIncidentLB" runat="server" 
        ControlToValidate="lbIncidents" Display="None" EnableClientScript="False" 
        ErrorMessage="No customer with that Id Number Exists." ForeColor="Red"></asp:RequiredFieldValidator>

</asp:Content>
