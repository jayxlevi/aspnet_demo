<%@ Page Title="Locals Recommend" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="LocalFavorites.aspx.cs" Inherits="FinalProject.LocalFavorites" Theme="Default" %>
<asp:Content ID="Head" ContentPlaceHolderID="head" runat="server">
    <script>

        function clearForm() {
            document.forms[0].reset();
        }//end of clearForm

    </script>
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h2>Enter your favorite locations here!</h2>
    <asp:ValidationSummary ID="ValidationSummary1" CssClass="error-message"
        DisplayMode="List"
        HeaderText="The following fields are required:" runat="server" />

    <asp:Label ID="BusinessName" runat="server" Text="Business's Name"></asp:Label>

    <asp:TextBox ID="txtBusinessName" runat="server" Width="300px"></asp:TextBox>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Business Name" CssClass="error-message" ControlToValidate="txtBusinessName">*</asp:RequiredFieldValidator>
        <br />
    <br />

    <asp:Label ID="Category" runat="server" Textx="Category"></asp:Label>

    <asp:DropDownList ID="drpDownCategory" runat="server">
        <asp:ListItem>Restaurant</asp:ListItem>
        <asp:ListItem>Outdoors</asp:ListItem>
        <asp:ListItem>Other</asp:ListItem>
    </asp:DropDownList>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Category" CssClass="error-message" ControlToValidate="drpDownCategory">*</asp:RequiredFieldValidator>
        <br />
    <br />

    <asp:Label ID="Rating" runat="server" Text="Rating (1-10)"></asp:Label>

    <asp:DropDownList ID="drpDownRating" runat="server">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>8</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
    </asp:DropDownList>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Rating" CssClass="error-message" ControlToValidate="drpDownRating">*</asp:RequiredFieldValidator>
        <br />
    <br />

    <asp:Button ID="btnAdd" runat="server" Font-Size="Large" Height="35px"
        OnClick="btnAdd_Click" Text="Add" CssClass="form-button" />
    <asp:Button ID="btnClear" runat="server" Text="Clear Form" OnClientClick="clearForm()"
        PostBackUrl="~/LocalFavorites" CausesValidation="False" Height="35px" Font-Size="Large" CssClass="form-button" />
    <asp:Button ID="btnCancel" runat="server" Font-Size="Large" Height="35px"
        PostBackUrl="~/Default" Text="Cancel" CausesValidation="False" CssClass="form-button" />

</asp:Content>
