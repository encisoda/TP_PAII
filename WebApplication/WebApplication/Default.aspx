<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Ingresar &raquo;</a></p>
    </div>--%>
    <div class="jumbotron mb-3 mt-3 lg-4">
        <form >
          <div class="mb-3 mt-3">
            <label for="email" class="form-label">Usuario:</label>
            <%--<input type="email" class="form-control" id="email" placeholder="Ingrese el Usuario" name="email">--%>
            <asp:TextBox runat="server" ID="TextBoxUsuario" CssClass="form-control"></asp:TextBox>
          </div>
          </br>
          <div class="mb-3">
            <label for="pwd" class="form-label">Contrasenia:</label>
            <%--<input type="password" class="form-control" id="pwd" placeholder="Ingrese la Contrasenia" name="pswd">--%>
            <asp:TextBox runat="server" ID="TextBoxFilterPassword" CssClass="form-control" TextMode="Password"></asp:TextBox>
          </div>
          </br>
          <div class="form-check mb-3">
              <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnIngreso" Text="Ingresar" onclick="BtnIngreso_Click"/>
            <%--<button type="submit" class="btn btn-primary">Ingresar</button>--%>
          </div>
        </form>
    </div>

</asp:Content>
