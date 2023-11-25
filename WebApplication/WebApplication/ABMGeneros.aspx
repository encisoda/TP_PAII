<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMGeneros.aspx.cs" Inherits="WebApplication.ABMGeneros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr>
    <br/>
    <div class="mx-auto" style="width: 250px">
        <asp:Label runat="server" CssClass="h2" ID="lbltitulo"></asp:Label>
    </div>
    <hr>
        <div>
            <form>
                <div class="row">  
                    <div class="col-md-6 mb-3">
                        <label for="genero" class="form-label">Género:</label>
                        <asp:TextBox ID="ddgenero" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvGenero" runat="server" ControlToValidate="ddgenero" 
                            ErrorMessage="El género es obligatorio" Display="Dynamic" CssClass="text-danger" InitialValue="" />
                        <asp:Label runat="server" ID="msjError" style="color: red;font-weight: bold;"></asp:Label>
                    </div>
                </div>    
                <br/>
                <div class="row justify-content-end">
                    <div class="col-md-6 mb-3">
                        <asp:Button runat="server" CssClass="btn btn-success" ID="BtnCreate" Text="Agregar" Visible="false" OnClick="BtnAgregar_Click" />
                        <asp:Button runat="server" CssClass="btn btn-warning" ID="BtnUpdate" Text="Actualizar" Visible="false" onclick="BtnActualizar_Click"/>
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='Generos.aspx'">Volver</button>
                    </div>
                </div>
            </form>
        </div>
</asp:Content>