<%@ Page Title="Incident Display" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="IncidentDisplay.aspx.cs" Inherits="IncidentDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="jumbotron">
        <h1>SportsPro</h1>
        <p class="lead">Sports management software for the sports enthusiast</p>
    </div>

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <span >
                <table width="800" style="background-color: #eeeeee;">
                    <td width="400">
                        <asp:Label ID="ProductLabel" runat="server" Text='<%# Eval("Product") %>' /></td>
                    <td width="200">
                        <asp:Label ID="CustomerLabel" runat="server" Text='<%# Eval("Customer") %>' /></td>
                    <td width="200">
                        <asp:Label ID="TechnicianLabel" runat="server" Text='<%# Eval("Technician") %>' /></td>
                    <tr>
                        <td>DateOpened:
            <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened") %>' /></td>
                    </tr>
                    <tr>
                        <td>DateClosed:
            <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed") %>' /></td>
                    </tr>
                    <tr>
                        <td>Title:
            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /></td>
                    </tr>
                    <tr>
                        <td>Description:
            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' /></td>
                    </tr>
                </table>
                <br />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #008A8C; color: #FFFFFF;">DateOpened:
            <asp:TextBox ID="DateOpenedTextBox" runat="server" Text='<%# Bind("DateOpened") %>' />
                <br />
                DateClosed:
            <asp:TextBox ID="DateClosedTextBox" runat="server" Text='<%# Bind("DateClosed") %>' />
                <br />
                Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Product:
            <asp:TextBox ID="ProductTextBox" runat="server" Text='<%# Bind("Product") %>' />
                <br />
                Customer:
            <asp:TextBox ID="CustomerTextBox" runat="server" Text='<%# Bind("Customer") %>' />
                <br />
                Technician:
            <asp:TextBox ID="TechnicianTextBox" runat="server" Text='<%# Bind("Technician") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
                <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">DateOpened:
            <asp:TextBox ID="DateOpenedTextBox" runat="server" Text='<%# Bind("DateOpened") %>' />
                <br />
                DateClosed:
            <asp:TextBox ID="DateClosedTextBox" runat="server" Text='<%# Bind("DateClosed") %>' />
                <br />
                Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Product:
            <asp:TextBox ID="ProductTextBox" runat="server" Text='<%# Bind("Product") %>' />
                <br />
                Customer:
            <asp:TextBox ID="CustomerTextBox" runat="server" Text='<%# Bind("Customer") %>' />
                <br />
                Technician:
            <asp:TextBox ID="TechnicianTextBox" runat="server" Text='<%# Bind("Technician") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
                <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="background-color: #DCDCDC; color: #000000;">
                <headertemplate>
                    <div style="font-weight:700; text-align: left;width: 800px;background-color: #000000;font-family: Verdana, Arial, Helvetica, sans-serif;color: #0094ff;">
                        <table width="800">
                        <tr>
                            <td width="400">Product</td>
                            <td width="200">Customer</td>
                            <td width="200">Technician</td>
                        </tr>
                        </table>
                    </div>
                </headertemplate>
                <table width="800">
                    <td width="400">
                        <asp:Label ID="ProductLabel" runat="server" Text='<%# Eval("Product") %>' /></td>
                    <td width="200">
                        <asp:Label ID="CustomerLabel" align="right" runat="server" Text='<%# Eval("Customer") %>' /></td>
                    <td width="200">
                        <asp:Label ID="TechnicianLabel" align="right" runat="server" Text='<%# Eval("Technician") %>' /></td>
                    <tr>
                        <td>DateOpened: 
            <asp:Label ID="DateOpenedLabel" align="right" runat="server" Text='<%# Eval("DateOpened") %>' /></td>
                    </tr>
                    <tr>
                        <td>DateClosed: 
            <asp:Label ID="DateClosedLabel" align="right" runat="server" Text='<%# Eval("DateClosed") %>' /></td>
                    </tr>
                    <tr>
                        <td>Title: 
            <asp:Label ID="TitleLabel" runat="server" align="right" Text='<%# Eval("Title") %>' /></td>
                    </tr>
                    <tr>
                        <td>Description: 
            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' /></td>
                    </tr>
                </table>
                <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <footerstyle backcolor="#CCCCCC" font-bold="True" forecolor="White">
            <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="width: 800px; text-align: center;background-color: #000000;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="2">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowLastPageButton="true"/>
                    </Fields>
                </asp:DataPager>
            </div>
            </footerstyle>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">DateOpened:
            <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened") %>' />
                <br />
                DateClosed:
            <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed") %>' />
                <br />
                Title:
            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                <br />
                Description:
            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                <br />
                Product:
            <asp:Label ID="ProductLabel" runat="server" Text='<%# Eval("Product") %>' />
                <br />
                Customer:
            <asp:Label ID="CustomerLabel" runat="server" Text='<%# Eval("Customer") %>' />
                <br />
                Technician:
            <asp:Label ID="TechnicianLabel" runat="server" Text='<%# Eval("Technician") %>' />
                <br />
                <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DateOpened, DateClosed, Title, Description, Products.Name as &quot;Product&quot;, Customers.Name as &quot;Customer&quot;, Technicians.Name as &quot;Technician&quot;
        FROM Incidents INNER JOIN Customers
        ON Incidents.CustomerID = Customers.CustomerID
        INNER JOIN Products
        ON Incidents.ProductCode = Products.ProductCode
        INNER JOIN Technicians
        ON Incidents.TechID = Technicians.TechID
        ORDER BY Customers.Name;"></asp:SqlDataSource>
</asp:Content>

