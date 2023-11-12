<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABM.aspx.cs" Inherits="WebApplication.ABM" %>

<%@ Register Src="~/ControlFormulario.ascx" TagPrefix="uc1" TagName="ControlFormulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mx-auto" style="width: 250px">
        <asp:Label runat="server" CssClass="h2" ID="lbltitulo"></asp:Label>
    </div>
    <hr>
        <div >
            
            <form >
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="titulo" class="form-label">Título:</label>
                        <uc1:ControlFormulario runat="server" id="ControlFormulario" />
                        <%--<asp:TextBox runat="server" ID="tbtitulo" CssClass="form-control"></asp:TextBox>--%>
                        
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="genero" class="form-label">Género:</label>
                        <asp:DropDownList ID="ddgenero" runat="server" CssClass="form-control">
                            <asp:ListItem Text="-- Selecciona un género --" Value="" />
                            <asp:ListItem Text="Acción" Value="Accion" />
                            <asp:ListItem Text="Terror" Value="Terror" />
                            <asp:ListItem Text="Drama" Value="Drama" />
                            <asp:ListItem Text="Ciencia Ficción" Value="CienciaFiccion" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvGenero" runat="server" ControlToValidate="ddgenero" 
                            ErrorMessage="El género es obligatorio" Display="Dynamic" CssClass="text-danger" InitialValue="" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="estreno" class="form-label">Estreno:</label>
                        <asp:TextBox runat="server" TextMode="Date" ID="tbestreno" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="pais" class="form-label">País:</label>
                        <asp:TextBox runat="server" ID="tbpais" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="productora" class="form-label">Productora:</label>
                        <asp:TextBox runat="server" ID="tbproductora" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="duracion" class="form-label">Duración (min):</label>
                        <asp:TextBox runat="server" ID="tbduracion" CssClass="form-control"></asp:TextBox>
                    </div> 
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="director" class="form-label">Director:</label>
                        <asp:TextBox runat="server" ID="tbdirector" CssClass="form-control"></asp:TextBox>
                    </div>  
                    <div class="col-md-6 mb-3">
                        <label for="calificacion" class="form-label">Calificación:</label>
                        <asp:TextBox runat="server" ID="tbcalificacion" CssClass="form-control"></asp:TextBox>
                    </div>   
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="idioma" class="form-label">Idioma:</label>
                        <asp:TextBox runat="server" ID="tbidioma" CssClass="form-control"></asp:TextBox>
                    </div>  
                    <div class="col-md-6 mb-3">
                        <label for="restriccion" class="form-label">Restricción de edad:</label>
                        <asp:TextBox runat="server" ID="tbrestriccion" CssClass="form-control"></asp:TextBox>
                    </div>   
                </div>
                </br>
                <div class="row justify-content-end">
                    <div class="col-md-6 mb-3">
                        <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnCreate" Text="Agregar" Visible="false" OnClick="BtnAgregar_Click" />
                        <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnUpdate" Text="Actualizar" Visible="false" onclick="BtnActualizar_Click"/>
                        <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnDelete" Text="Eliminar" Visible="false" OnClick="BtnEliminar_Click" />
                        <asp:Button runat="server" CssClass="btn btn-primary btn-dark" ID="BtnVolver" Text="Volver" Visible="True" OnClick="BtnVolver_Click" />
                    </div>
                </div>
            </form>
        </div>
</asp:Content>
