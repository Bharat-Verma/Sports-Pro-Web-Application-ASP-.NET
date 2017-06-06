<%@ Page Title="Technician Incident Summary" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TechnicianIncidentSummary.aspx.cs" Inherits="TechnicianIncidentSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron">
        <h1>SportsPro</h1>
        <p class="lead">Sports management software for the sports enthusiast</p>
    </div>

    <table class="nav-justified" style="width: 65%">
        <tr>
            <td style="width: 180px">&nbsp;</td>
            <td style="width: 191px">Select a technician: </td>
            <td>

    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="Name" DataValueField="TechID" Height="20px" Width="150px"></asp:DropDownList>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllTechnicians" TypeName="TechnicianDB"></asp:ObjectDataSource>

    <br />
    <table class="nav-justified">
        <tr>
            <td style="width: 180px">&nbsp;</td>
            <td style="width: 687px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="ObjectDataSource2" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="DateOpened" DataFormatString="{0:d}" HeaderText="Date Opened">
                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                        <ItemStyle HorizontalAlign="Left" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ProductCode" HeaderText="Product">
                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                        <ItemStyle HorizontalAlign="Left" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Customer">
                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                        <ItemStyle HorizontalAlign="Left" Width="150px" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetOpenTechIncidents" TypeName="IncidentDB">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="techID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 180px"></td>
            <td style="width: 687px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

    <br />

    
    <br />
</asp:Content>

