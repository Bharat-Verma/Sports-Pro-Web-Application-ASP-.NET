<%@ Page Title="Survey Complete" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="SurveyComplete.aspx.cs" Inherits="SurveyComplete" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>SportsPro</h1>
        <p class="lead">Sports management software for the sports enthusiast</p>
    </div>
    <table class="nav-justified" style="width: 51%">
        <tr>
            <td style="width: 652px; height: 39px;">
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <p class="lead" style="width: 400px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thank you for your feedback!</p>
            </td>
        </tr>
        <tr>
            <td style="width: 652px">
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_SurCom_Msg" runat="server" Font-Bold="True" Height="40px" Width="374px">A customer service representative will contact you within 24 hours.</asp:Label>
                <br />
            </td>
            <tr>
            <td style="width: 652px">
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_SurCom_RtnToSur" runat="server" OnClick="btn_ConDis_EmpLst_Click" Text="Return to Survey" Width="175px" />
                <br />
            </td>
            </table>
</asp:Content>