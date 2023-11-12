<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <h3>Peliculas</h3>
    <asp:Button runat="server" ID="btnAgregar" CssClass="btn btn-success mb-2" Text="Agregar" OnClick="BtnCreate_Click"/>
    <%--<button type="button" class="btn btn-success mb-2" id="btnAgregar" data-toggle="modal"  data-target="#agregarModal">Agregar +</button>--%>
    <hr>
    <h4>Filtros</h4>
    <form class="form-inline">
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm-3">
                    <label for="email" class="sr-only">Email:</label>
                    <asp:TextBox runat="server" ID="TextBoxFilterTitulo" CssClass="form-control"></asp:TextBox>
                    <%--<input type="text" class="form-control" placeholder="Ingresar titulo" name="titulo" id="titulo">--%>
                </div>
                <div class="col-sm-3">
                    <label for="genero" class="sr-only">Genero:</label>
                    <asp:DropDownList ID="DropDownListFiltro" runat="server" CssClass="form-control">
                        <asp:ListItem Text="-- Selecciona un género --" Value="" />
                        <asp:ListItem Text="Acción" Value="Accion" />
                        <asp:ListItem Text="Terror" Value="Terror" />
                        <asp:ListItem Text="Drama" Value="Drama" />
                        <asp:ListItem Text="Ciencia Ficción" Value="CienciaFiccion" />
                    </asp:DropDownList>
                </div>
            <div class="col-sm-4">
                <button type="button" class="btn btn-secondary mb-2" id="btnLimpiar">Limpiar</button>
                <asp:Button ID="ButtonFiltar" runat="server" OnClick="ButtonFiltrar_Click" Text="Filtrar" CssClass="btn btn-primary mb-2"/>
            </div>
        </div>
    </div>
<%--    <div>
        <asp:GridView runat="server" ID="gvupeliculas" class="table table-borderless table-hover">
            <Columns>

            </Columns>
        </asp:GridView>
    </div>--%>
    </form>
    <hr>
    <h4>Listado de peliculas</h4>
    <asp:GridView ID="GridViewPeliculas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" GridLines="None">
    <Columns>
        <asp:BoundField DataField="idPelicula" HeaderText="idPelicula" SortExpression="idPelicula" />
        <asp:BoundField DataField="Titulo" HeaderText="Título" SortExpression="Titulo" />
        <asp:BoundField DataField="Genero" HeaderText="Género" SortExpression="Genero" />
        <asp:BoundField DataField="Estreno" HeaderText="Estreno" SortExpression="Estreno" />
        <asp:BoundField DataField="Pais" HeaderText="País" SortExpression="Pais" />
        <asp:BoundField DataField="Duracion" HeaderText="Duración (min)" SortExpression="Duracion" />
        <asp:BoundField DataField="Director" HeaderText="Director" SortExpression="Director" />
        <asp:BoundField DataField="Calificacion" HeaderText="Calificación" SortExpression="Calificacion" />
        <asp:BoundField DataField="Idioma" HeaderText="Idioma" SortExpression="Idioma" />
        <asp:BoundField DataField="Restriccion" HeaderText="Restricción de Edad" SortExpression="Restriccion" />
        <asp:BoundField DataField="Productora" HeaderText="Productora" SortExpression="Productora" />
        <asp:TemplateField HeaderText="Acciones">
            <ItemTemplate>
                <asp:LinkButton ID="BtnModificar" runat="server" OnClick="BtnModificar_Click" Text="<span class='glyphicon glyphicon-pencil'></span>" CssClass="btn form-control-sm btn-warning">
                    </asp:LinkButton>
                <asp:LinkButton ID="BtnBorrar" runat="server" OnClick="BtnBorrar_Click" Text="<span class='glyphicon glyphicon-trash'></span>" CssClass="btn form-control-sm btn-danger">
                    </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    </asp:GridView>
    
</asp:Content>



