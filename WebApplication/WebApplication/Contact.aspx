<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar Peli" />
        <asp:Button ID="Button2" runat="server" Text="Updatear Peli" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="Eliminar Peli" OnClick="Button3_Click1" />
        <asp:Button ID="Button4" runat="server" Text="ListarPelis" OnClick="Button4_Click" />
        <asp:TextBox ID="TextLista" runat="server"></asp:TextBox>
    </h2>
    <h3>Your contact page.</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</asp:Content>
