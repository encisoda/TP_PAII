<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <h3>Peliculas</h3>
    <asp:Button runat="server" ID="btnAgregar" CssClass="btn btn-success mb-2" Text="Agregar" OnClick="BtnCreate_Click"/>
    <hr>
    <h4>Filtros</h4>
    <form class="form-inline">
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm-3">
                    <label for="filtroTitulo" class="sr-only">Titulo:</label>
                    <asp:TextBox runat="server" ID="TextBoxFilterTitulo" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-3">
                    <label for="genero" class="sr-only">Genero:</label>
                    <asp:DropDownList ID="DropDownListFiltro" runat="server" CssClass="form-control">
                        <asp:ListItem Text="-- Selecciona un género --" Value="" />
                    </asp:DropDownList>
                </div>
            <div class="col-sm-4">
                <asp:LinkButton ID="BtnLimpiarFiltros" runat="server" OnClick="ButtonLimpiarFiltrar_Click" Text="<span class='glyphicon glyphicon-repeat'></span>" CssClass="btn btn-secondary mb-2"/>
                <asp:Button ID="BtnFiltar" runat="server" OnClick="ButtonFiltrar_Click" Text="Filtrar" CssClass="btn btn-primary mb-2"/>
            </div>
        </div>
    </div>
    </form>
    <hr>
    <h4>Listado de peliculas</h4>
    <asp:GridView ID="GridViewPeliculas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" GridLines="None">
    <Columns>
        <asp:BoundField DataField="idPelicula" HeaderText="idPelicula" SortExpression="idPelicula" />
        <asp:BoundField DataField="Titulo" HeaderText="Título" SortExpression="Titulo" />
        <asp:BoundField DataField="Genero" HeaderText="Género" SortExpression="Genero" />
        <asp:BoundField DataField="Estreno" HeaderText="Estreno" SortExpression="Estreno" DataFormatString="{0:dd-M-yyyy}" />
        <asp:BoundField DataField="Pais" HeaderText="País" SortExpression="Pais" />
        <asp:BoundField DataField="Duracion" HeaderText="Duración (min)" SortExpression="Duracion" />
        <asp:BoundField DataField="Director" HeaderText="Director" SortExpression="Director" />
        <asp:BoundField DataField="Calificacion" HeaderText="Calificación" SortExpression="Calificacion" />
        <asp:BoundField DataField="Idioma" HeaderText="Idioma" SortExpression="Idioma" />
        <asp:BoundField DataField="Restriccion" HeaderText="Restricción de Edad" SortExpression="Restriccion" />
        <asp:BoundField DataField="Productora" HeaderText="Productora" SortExpression="Productora" />
        <asp:TemplateField HeaderText="Acciones">
            <ItemTemplate>
                <div>
                    <asp:LinkButton ID="BtnModificar" runat="server" OnClick="BtnModificar_Click" Text="<span class='glyphicon glyphicon-pencil'></span>" CssClass="btn form-control-sm btn-warning">
                        </asp:LinkButton>
                    <asp:LinkButton ID="BtnBorrar" runat="server" OnClick="BtnBorrar_Click" Text="<span class='glyphicon glyphicon-trash'></span>" CssClass="btn form-control-sm btn-danger">
                        </asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    </asp:GridView>
    
</asp:Content>



