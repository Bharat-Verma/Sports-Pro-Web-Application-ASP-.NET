<%@ Page Title="Contact Display" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ContactDisplay.aspx.cs" Inherits="ContactDisplay" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <div class="jumbotron">
        <h1>SportsPro</h1>
        <p class="lead">Sports management software for the sports enthusiast</p>
    </div>
    <table class="nav-justified">
        <tr>
            <td style="width: 354px; height: 14px;">
                <asp:Label ID="lbl_ConDis_ConList" runat="server" Font-Bold="True" Height="16px" Text="Contact list:" Width="171px"></asp:Label>
            </td>
            <td style="height: 14px">
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 354px">
                <asp:ListBox ID="LstBox_ConDis_Contact" runat="server" Width="348px"></asp:ListBox>
            </td>
            <td>
                <asp:Button ID="btn_ConDis_RmvCon" runat="server" OnClick="btn_ConDis_RmvCon_Click" Text="Remove Contact" Width="175px" />
                <br />
                <br />
                <asp:Button ID="btn_ConDis_EmpLst" runat="server" OnClick="btn_ConDis_EmpLst_Click" Text="Empty List" Width="175px" />
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 354px">
                <br />
                <asp:Button ID="btn_ConDis_SelAddCust" runat="server" OnClick="btn_ConDis_SelAddCust_Click" Text="Select Additional Customers" Width="242px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 354px">
                <br />
                <asp:Label ID="lbl_msg_disp_rmv_con" runat="server" Text="Please select the contact you want to remove."></asp:Label>
                <br />
                <asp:Label ID="lbl_msg_disp_lst_emty" runat="server" Text="Contact list is empty."></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

