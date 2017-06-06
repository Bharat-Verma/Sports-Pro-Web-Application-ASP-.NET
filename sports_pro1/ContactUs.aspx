<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>SportsPro</h1>
        <p class="lead">Sports management software for the sports enthusiast</p>
    </div>
        <h2>How to contact us</h2>
        <p class="lead">If you ever have any questions or comments about our products,
            please be sure to contact us in whatever way is most convenient to you.
        </p>
    <table class="nav-justified">
        <tr>
            <td style="width: 276px; height: 36px;">
                <asp:Label ID="lbl_CusDis_sel_cust" runat="server" Text="Phone:" Font-Bold="True"></asp:Label>
                <br />
            </td>
            <td style="height: 36px">

                1-800-555-0400<br />
                Weekdays, 8 to 5 Central Time<br />

            </td>
        </tr>
        <tr>
            <td style="width: 276px">
                <asp:Label ID="lbl_CusDis_cust_add" runat="server" Text="Email:" Font-Bold="True"></asp:Label>
            </td>
            <td>

                <asp:HyperLink CssClass="hyperlink" runat="server" 
                NavigateUrl="mailto:sportspro@sportsprosoftware.com"> 
                sportspro@sportsprosoftware.com</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="width: 276px; height: 22px;">

                <asp:Label ID="lbl_CusDis_cust_add0" runat="server" Text="Fax:" Font-Bold="True"></asp:Label>

            </td>
            <td style="height: 22px">

                1-559-555-2732<br />

            </td>
        </tr>
        <tr>
            <td style="width: 276px">
                
                <asp:Label ID="lbl_CusDis_cust_add1" runat="server" Text="Address:" Font-Bold="True"></asp:Label>
                
                <br />
                <br />
                
            </td>
            <td>
                
                SportsPro Software, Inc.<br />
                1500 N. Main Street<br />
                Fresno, California 93710</td>
        </tr>
        </table>
</asp:Content>
