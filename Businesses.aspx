<%@ Page Title="Popular Businesses" Language="C#" MasterPageFile="~/Results.Master" AutoEventWireup="true" CodeBehind="Businesses.aspx.cs" Inherits="FinalProject.Buisnesses" Theme="Businesses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h2>Kenosha's Favorite Businesses</h2>
    <p>There are all sorts of shops and businesses to visit here in Kenosha, especially in the downtown area! Kenosha has many local businesses alongside larger ones. </p>
        <p>Here are popular businesses reported by local poll takers!</p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="business_name" HeaderText="Name" SortExpression="business_name" HtmlEncode="false" />
            <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalPoll_ConnString %>" SelectCommand="SELECT * FROM [poll_results] WHERE ([category] = @category)" DeleteCommand="DELETE FROM [poll_results] WHERE [Id] = @Id" InsertCommand="INSERT INTO [poll_results] ([business_name], [category], [rating]) VALUES (@business_name, @category, @rating)" UpdateCommand="UPDATE [poll_results] SET [business_name] = @business_name, [rating] = @rating WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="business_name" Type="String" />
            <asp:Parameter Name="category" Type="String" />
            <asp:Parameter Name="rating" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="Other" Name="category" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="business_name" Type="String" />
            <asp:Parameter Name="rating" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
