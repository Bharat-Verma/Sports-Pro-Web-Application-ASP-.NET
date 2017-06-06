<%@ Page Title="Product Maintenance" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductMaintenance.aspx.cs" Inherits="ProductMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

        <div class="jumbotron">
            <h1>SportsPro</h1>
            <p class="lead">Sports management software for the sports enthusiast</p>
        </div>
        

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProductCode" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowSorting="True" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="ProductCode" SortExpression="ProductCode">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="200px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Enter a Valid Name" 
                        ValidationGroup="edit" ForeColor="Red">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Version" SortExpression="Version">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Version") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="Enter a Valid Version" 
                        ValidationGroup="edit" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="Please enter version in valid format ##.##" 
                        ValidationGroup="edit" ForeColor="Red" ValidationExpression="^[0-9]{1,2}([.][0-9]{1,2})?$">*</asp:RegularExpressionValidator> 
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ReleaseDate","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="Enter a Valid Date in mm/dd/yyyy format" 
                        ValidationGroup="edit" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="Enter date in valid format mm/dd/yyyy" 
                        ValidationExpression="^([0-9]|0[1-9]|1[012])\/([0-9]|0[1-9]|[12][0-9]|3[01])\/(19|20)\d\d$" 
                        ValidationGroup="edit" ForeColor="Red">*</asp:RegularExpressionValidator>  
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ReleaseDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True"  CausesValidation="true" ValidationGroup="edit"  />
            <asp:CommandField ShowDeleteButton="True" />
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
    
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        HeaderText="Please correct the following errors:"  ValidationGroup="edit" CssClass="error"/>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate" 
    InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT [ProductCode], [Name], [Version], [ReleaseDate] 
    FROM [Products] ORDER BY [ProductCode]" 
    UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
    <DeleteParameters>
        <asp:Parameter Name="original_ProductCode" Type="String" />
        <asp:Parameter Name="original_Name" Type="String" />
        <asp:Parameter Name="original_Version" Type="Decimal" />
        <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ProductCode" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Version" Type="Decimal" />
        <asp:Parameter Name="ReleaseDate" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Version" Type="Decimal" />
        <asp:Parameter Name="ReleaseDate" Type="DateTime" />
        <asp:Parameter Name="original_ProductCode" Type="String" />
        <asp:Parameter Name="original_Name" Type="String" />
        <asp:Parameter Name="original_Version" Type="Decimal" />
        <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
    <br />
    <p class="lead">To add a new product, enter the product information and click Add Product
    </p>


       
        <table class="nav-justified">
            <tr>
                <td style="width: 239px">Product Code: </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="Please enter unique product code" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 239px">Name: </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Width="330px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="Please enter a valid name" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 239px">Version: </td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox6" ErrorMessage="Please enter a valid version" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="TextBox6" ErrorMessage="Please enter version in valid format ##.##" 
                        ForeColor="Red" ValidationExpression="^[0-9]{1,2}([.][0-9]{1,2})?$"></asp:RegularExpressionValidator> 
                </td>
            </tr>
            <tr>
                <td style="width: 239px">Release Date: </td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox7" ErrorMessage="Please enter date" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox7" ErrorMessage="Please enter date in valid format mm/dd/yyyy" 
                        ValidationExpression="^([0-9]|0[1-9]|1[012])\/([0-9]|0[1-9]|[12][0-9]|3[01])\/(19|20)\d\d$" 
                        ForeColor="Red"></asp:RegularExpressionValidator>       
                </td>
            </tr>
            <tr>
                <td style="width: 239px">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Add Product" Width="151px" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
        <br />
        <br />
       
    <asp:Label ID="lbl_Error" runat="server" EnableViewState="False"></asp:Label>
    <br />

</asp:Content>

