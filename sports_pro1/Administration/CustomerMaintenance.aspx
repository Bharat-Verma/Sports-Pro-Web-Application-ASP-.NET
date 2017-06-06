<%@ Page Title="Product Maintenance" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerMaintenance.aspx.cs" Inherits="CustomerMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


    <div class="jumbotron">
        <h1>SportsPro</h1>
        <p class="lead">Sports management software for the sports enthusiast</p>
    </div>

    <br />
    <table class="nav-justified">
        <tr>
            <td style="width: 355px">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" Visible="false" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
                <br />
            </td>
            
            <td><asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="180px" 
                AutoGenerateRows="False" CellPadding="4" DataKeyNames="CustomerID" DataSourceID="SqlDataSource2" 
                ForeColor="#333333" GridLines="Vertical" 
                onitemupdated="DetailsView1_ItemUpdated"
                onitemdeleted="DetailsView1_ItemDeleted"
                oniteminserted="DetailsView1_ItemInserted" >
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ButtonType="Button" />
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            Selected Customer
        </HeaderTemplate>
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
                <br />
                <asp:Label ID="lbl_Error" runat="server" EnableViewState="False"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 355px"></td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID 
        AND [Name] = @original_Name AND [City] = @original_City AND [State] = @original_State" 
        InsertCommand="INSERT INTO [Customers] ([Name], [City], [State]) VALUES (@Name, @City, @State)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [CustomerID], [Name], [City], [State] FROM [Customers]" 
        UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [City] = @City, [State] = @State 
        WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name 
        AND [City] = @original_City AND [State] = @original_State">
        <DeleteParameters>
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <br />
    
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID 
        AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City 
        AND [State] = @original_State AND [ZipCode] = @original_ZipCode 
        AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) 
        AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" 
        InsertCommand="INSERT INTO [Customers] ([Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) 
        VALUES (@Name, @Address, @City, @State, @ZipCode, @Phone, @Email)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)" 
        UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, 
        [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, 
        [Email] = @Email WHERE [CustomerID] = @original_CustomerID 
        AND [Name] = @original_Name AND [Address] = @original_Address 
        AND [City] = @original_City AND [State] = @original_State 
        AND [ZipCode] = @original_ZipCode 
        AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) 
        AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

