<%@ Page Title="Customer Display" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CustomerDisplay.aspx.cs" Inherits="CustomerDisplay" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>SportsPro</h1>
        <p class="lead">Sports management software for the sports enthusiast</p>
    </div>
    <table class="nav-justified">
        <tr>
            <td style="width: 276px; height: 36px;">
                <asp:Label ID="lbl_CusDis_sel_cust" runat="server" Text="Select a Customer:" Font-Bold="True"></asp:Label>
            </td>
            <td style="height: 36px">
                <asp:DropDownList ID="ddl_CusDis_cust_name" runat="server" Height="35px" Width="300px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 276px">
                <asp:Label ID="lbl_CusDis_cust_add" runat="server" Text="Address:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lbl_CusDis_cust_add_info" runat="server" Height="16px" Width="300px"></asp:Label>
                <br />
                <asp:Label ID="lbl_CusDis_cust_city_info" runat="server" Height="16px" Text="City" Width="62px"></asp:Label>
                ,
                <asp:Label ID="lbl_CusDis_cust_State_info" runat="server" Height="16px" Text="State"></asp:Label>
&nbsp;<asp:Label ID="lbl_CusDis_cust_zip_info" runat="server" Height="16px" Text="Zip" Width="62px"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 276px">
                <asp:Label ID="lbl_CusDis_phone" runat="server" Text="Phone:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lbl_CusDis_phone_info" runat="server" Height="16px" Width="300px" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 276px">
                <asp:Label ID="lbl_CusDis_email" runat="server" Text="Email:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lbl_CusDis_email_info" runat="server" Height="16px" Width="300px" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 276px">
                <br />
                <asp:Button ID="btn_CusDis_AddToConLst" runat="server" OnClick="btn_CusDis_AddToConLst_Click" Text="Add to Contact List" Width="190px" />
            </td>
            <td>
                <br />
                <asp:Button ID="btn_CusDis_DisConLst" runat="server" OnClick="btn_CusDis_DisConLst_Click" Text="Display Contact List" Width="190px" />
            </td>
        </tr>
        <tr>
            <td style="width: 276px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 276px">
                <asp:Label ID="lblMessage" runat="server" Enabled="False" Text="Customer already exist on the contact list."></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
