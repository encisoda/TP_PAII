<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron mb-3 mt-3 lg-4">
        <form >
          <div class="mb-3 mt-3">
            <label for="email" class="form-label">Usuario:</label>
            <asp:TextBox runat="server" ID="TextBoxUsuario" CssClass="form-control"></asp:TextBox>
          </div>
          </br>
          <div class="mb-3">
            <label for="pwd" class="form-label">Contraseña:</label>
            <asp:TextBox runat="server" ID="TextBoxFilterPassword" CssClass="form-control" TextMode="Password"></asp:TextBox>
          </div>
          </br>
          <div class="form-check mb-3">
            <asp:Label runat="server" ID="LblMensajeError" CssClass="text-danger"></asp:Label>
          </div>
          <div class="form-check mb-3">        
              <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnIngreso" Text="Ingresar" onclick="BtnIngreso_Click"/>
          </div>
        </form>
    </div>

</asp:Content>
