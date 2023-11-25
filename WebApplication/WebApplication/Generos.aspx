<%@ Page Title="Generos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Generos.aspx.cs" Inherits="WebApplication.Generos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    
    <h3>Generos</h3>
    <asp:Button runat="server" ID="btnAgregar" CssClass="btn btn-success mb-2" Text="Agregar" OnClick="BtnCreate_Click"/>
    <hr>
    <h4>Listado de generos</h4>
    <asp:GridView ID="GridViewGeneros" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" GridLines="None">
    <Columns>
        <asp:BoundField DataField="idGenero" HeaderText="Id" SortExpression="Id" />
        <asp:BoundField DataField="genero" HeaderText="Género" SortExpression="Genero" />
        <asp:TemplateField HeaderText="Acciones">
            <ItemTemplate>
                <div>
                    <asp:LinkButton ID="BtnModificar" runat="server" OnClick="BtnModificar_Click" Text="<span class='glyphicon glyphicon-pencil'></span>" CssClass="btn form-control-sm btn-warning">
                        </asp:LinkButton>
                    <asp:LinkButton ID="BtnBorrar" runat="server" OnClientClick="return confirm('¿Esta seguro que desea eliminar el Genero?')" OnClick="BtnBorrar_Click" Text="<span class='glyphicon glyphicon-trash'></span>" CssClass="btn form-control-sm btn-danger">
                        </asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    </asp:GridView>

    <div class="MessagePanelDiv">
    <asp:Panel ID="Message" runat="server" Visible="False">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <asp:Label ID="labelMessage" runat="server" />
    </asp:Panel>
    </div>
    
</asp:Content>