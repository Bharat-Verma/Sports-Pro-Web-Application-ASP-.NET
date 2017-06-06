<%@ Page Title="Technician Maintenance" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TechnicianMaintenance.aspx.cs" Inherits="TechnicianMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="jumbotron">
        <h1>SportsPro</h1>
        <p class="lead">Sports management software for the sports enthusiast</p>
    </div>

    <asp:Label ID="Label1" runat="server" Text="Select a technician: "></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="TechID"></asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TechID], [Name] FROM [Technicians] ORDER BY [Name]"></asp:SqlDataSource>

    <br />
    <br />

    <asp:FormView ID="FormView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" 
        BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="TechID" 
        DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Both"
        onitemdeleted="FormView1_ItemDeleted" oniteminserted="FormView1_ItemInserted" 
        onitemupdated="FormView1_ItemUpdated">
        <EditItemTemplate>
            TechID:
            <asp:Label ID="TechIDLabel1" runat="server" Text='<%# Eval("TechID") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <asp:RequiredFieldValidator runat="server" ID="RequierdFieldValidatorName" 
                ControlToValidate="NameTextBox" 
                ErrorMessage="Name is a required field.">*</asp:RequiredFieldValidator>
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorEmail" 
                ControlToValidate="EmailTextBox" 
                ErrorMessage="Email is a required field.">*</asp:RequiredFieldValidator>
            <br />
            Phone:
            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorPhoneNo" 
                ControlToValidate="PhoneTextBox" 
                ErrorMessage="Phone number is a required field.">*</asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            Selected Technician
        </HeaderTemplate>
        <InsertItemTemplate>
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <asp:RequiredFieldValidator runat="server" ID="RequierdFieldValidatorName" 
                ControlToValidate="NameTextBox" 
                ErrorMessage="Name is a required field.">*</asp:RequiredFieldValidator>
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorEmail" 
                ControlToValidate="EmailTextBox" 
                ErrorMessage="Email is a required field.">*</asp:RequiredFieldValidator>
            <br />
            Phone:
            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorPhoneNo" 
                ControlToValidate="PhoneTextBox" 
                ErrorMessage="Phone number is a required field.">*</asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            TechID:
            <asp:Label ID="TechIDLabel" runat="server" Text='<%# Eval("TechID") %>' />
            <br />
            Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            Phone:
            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Technicians] WHERE [TechID] = @original_TechID 
        AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone" 
        InsertCommand="INSERT INTO [Technicians] ([Name], [Email], [Phone]) VALUES (@Name, @Email, @Phone)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Technicians] WHERE ([TechID] = @TechID)" 
        UpdateCommand="UPDATE [Technicians] SET [Name] = @Name, [Email] = @Email, 
        [Phone] = @Phone WHERE [TechID] = @original_TechID 
        AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone">
        <DeleteParameters>
            <asp:Parameter Name="original_TechID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="TechID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="original_TechID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="lblError" runat="server"></asp:Label>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        HeaderText="Please correct the following errors:" CssClass="error" />
</asp:Content>

