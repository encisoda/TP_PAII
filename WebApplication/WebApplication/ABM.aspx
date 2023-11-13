<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABM.aspx.cs" Inherits="WebApplication.ABM" %>

<%@ Register Src="~/ControlFormulario.ascx" TagPrefix="uc1" TagName="ControlFormulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mx-auto" style="width: 250px">
        <asp:Label runat="server" CssClass="h2" ID="lbltitulo"></asp:Label>
    </div>
    <hr>
        <div>
            <form >
                <uc1:ControlFormulario runat="server" id="ControlFormulario" />
                <%--<asp:TextBox runat="server" ID="tbtitulo" CssClass="form-control"></asp:TextBox>--%>
                <br/>
                <div class="row justify-content-end">
                    <div class="col-md-6 mb-3">
                        <asp:Button runat="server" CssClass="btn btn-success" ID="BtnCreate" Text="Agregar" Visible="false" OnClick="BtnAgregar_Click" />
                        <asp:Button runat="server" CssClass="btn btn-warning" ID="BtnUpdate" Text="Actualizar" Visible="false" onclick="BtnActualizar_Click"/>
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='About.aspx'">Volver</button>
                    </div>
                </div>
            </form>
        </div>
</asp:Content>
