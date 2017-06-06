<%@ Page Title="Customer Incident Display" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerIncidentDisplay.aspx.cs" Inherits="CustomerIncidentDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
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
                <asp:DropDownList ID="ddl_CusDis_cust_name" runat="server" Height="35px" Width="300px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </table>

    <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" 
        ForeColor="Black" GridLines="Horizontal" Width="1165px" style="margin-right: 0px">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            <span class="col-xs-3">Product/Incident</span>
            <span class="col-xs-3">Tech Name</span>
            <span class="col-xs-3 text-right">Opened</span>
            <span class="col-xs-3 text-right">Closed</span>
        </HeaderTemplate>
        <ItemStyle BackColor="#F7F7DE" />
        <ItemTemplate>
            <asp:Label ID="Product_IncidentLabel" runat="server" Text='<%# Eval("Product/Incident") %>' CssClass="col-xs-3" />
            <asp:Label ID="Tech_NameLabel" runat="server" Text='<%# Eval("Tech Name") %>' CssClass="col-xs-3"/>
            <asp:Label ID="OpenedLabel" runat="server" Text='<%# Eval("Opened") %>' CssClass="col-xs-3 text-right"/>
            <asp:Label ID="ClosedLabel" runat="server" Text='<%# Eval("Closed") %>' CssClass="col-xs-3 text-right"/>
            <br />
            <asp:Label ID="DESCRIPTIONLabel" runat="server" Text='<%# Eval("DESCRIPTION") %>' />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT PRODUCTS.NAME  AS &quot;Product/Incident&quot;, INCIDENTS.DESCRIPTION,
        TECHNICIANS.NAME AS &quot;Tech Name&quot;, CONVERT(VARCHAR(8), INCIDENTS.DATEOPENED, 1) AS &quot;Opened&quot;, 
        CONVERT(VARCHAR(8), INCIDENTS.DATECLOSED, 1) AS &quot;Closed&quot; 
        FROM TECHNICIANS FULL OUTER JOIN INCIDENTS
        ON TECHNICIANS.TECHID = INCIDENTS.TECHID
        FULL OUTER JOIN PRODUCTS
        ON INCIDENTS.PRODUCTCODE = PRODUCTS.PRODUCTCODE
        WHERE ([CUSTOMERID] = @CUSTOMERID);  ">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddl_CusDis_cust_name" Name="CustomerID" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

