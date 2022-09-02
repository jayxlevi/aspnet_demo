<%@ Page Title="Popular Restaurants" Language="C#" MasterPageFile="~/Results.Master" AutoEventWireup="true" CodeBehind="Restaurants.aspx.cs" Inherits="FinalProject.Restaurants" Theme="Restaurants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h2>Kenosha's Favorite Restaurants</h2>
    <p>Kenosha has a wide variety of locally owned restaurants. From cafes to bars, diners to fine dining, and flavors from all around the world; all of which can be found here in Kenosha, Wisconsin.</p>
    <p>Here are popular restaurants reported by local poll takers!</p>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlLocalFavorites">
        <Columns>
            <asp:BoundField DataField="business_name" HeaderText="Name" SortExpression="business_name"  HtmlEncode="false"/>
            <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlLocalFavorites" runat="server" ConnectionString="<%$ ConnectionStrings:LocalPoll_ConnString %>" SelectCommand="SELECT * FROM [poll_results] WHERE ([category] = @category)" DeleteCommand="DELETE FROM [poll_results] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [poll_results] ([business_name], [category], [rating]) VALUES (@business_name, @category, @rating)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [poll_results] SET [business_name] = @business_name, [rating] = @rating WHERE [Id] = @original_Id">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="business_name" Type="String" />
            <asp:Parameter Name="category" Type="String" />
            <asp:Parameter Name="rating" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="Restaurant" Name="category" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="business_name" Type="String" />
            <asp:Parameter Name="rating" Type="Int32" />
            <asp:Parameter Name="original_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
