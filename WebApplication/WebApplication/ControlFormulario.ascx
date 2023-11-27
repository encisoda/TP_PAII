<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlFormulario.ascx.cs" Inherits="WebApplication.ControlFormulario" %>

<div class="row">
   <div class="col-md-6 mb-3">
        <label for="titulo" class="form-label">Título:</label>
        <asp:TextBox runat="server" ID="tbtitulo" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTitulo" runat="server" ControlToValidate="tbtitulo" 
                                    ErrorMessage="El título es obligatorio" Display="Dynamic" CssClass="text-danger" />
        </div>
        <div class="col-md-6 mb-3">
           <label for="genero" class="form-label">Género:</label>
           <div style="display:flex;">           
                <asp:DropDownList ID="ddgenero" runat="server" CssClass="form-control">
                    <asp:ListItem Text="-- Selecciona un género --" Value="" />
                </asp:DropDownList>
                &nbsp;
                <asp:Button runat="server" ID="btnGeneros" CssClass="btn btn-success" CausesValidation="false" Text="+" OnClick="IrAGeneros"/>
                <asp:RequiredFieldValidator ID="rfvGenero" runat="server" ControlToValidate="ddgenero" 
                    ErrorMessage="El género es obligatorio" Display="Dynamic" CssClass="text-danger" InitialValue="" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="estreno" class="form-label">Estreno:</label>
            <asp:TextBox runat="server" TextMode="Date" ID="tbestreno" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEstreno" runat="server" ControlToValidate="tbestreno" 
                ErrorMessage="La fecha de estreno es obligatorio" Display="Dynamic" CssClass="text-danger" />
            <asp:RangeValidator ID="rvEstreno" runat="server" ControlToValidate="tbestreno"
                ErrorMessage="La fecha no es válida" Display="Dynamic"
                Type="Date" MinimumValue="1800-01-01" MaximumValue="3000-12-31" CssClass="text-danger" />
        </div>
        <div class="col-md-6 mb-3">
            <label for="pais" class="form-label">País:</label>
            <asp:TextBox runat="server" ID="tbpais" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPais" runat="server" ControlToValidate="tbpais" 
                ErrorMessage="El pais es obligatorio" Display="Dynamic" CssClass="text-danger" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="productora" class="form-label">Productora:</label>
            <asp:TextBox runat="server" ID="tbproductora" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvProductora" runat="server" ControlToValidate="tbproductora" 
                ErrorMessage="La productora es obligatorio" Display="Dynamic" CssClass="text-danger" />
        </div>
        <div class="col-md-6 mb-3">
            <label for="duracion" class="form-label">Duración (min):</label>
            <asp:TextBox runat="server" ID="tbduracion" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDuracion" runat="server" ControlToValidate="tbduracion" 
                ErrorMessage="La duracion es obligatorio" Display="Dynamic" CssClass="text-danger" />
        </div> 
    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="director" class="form-label">Director:</label>
            <asp:TextBox runat="server" ID="tbdirector" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDirector" runat="server" ControlToValidate="tbdirector" 
                ErrorMessage="El director es obligatorio" Display="Dynamic" CssClass="text-danger" />
        </div>  
        <div class="col-md-6 mb-3">
            <label for="calificacion" class="form-label">Calificación:</label>
            <asp:TextBox runat="server" ID="tbcalificacion" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCalificacion" runat="server" ControlToValidate="tbcalificacion" 
                ErrorMessage="La calificacion es obligatorio" Display="Dynamic" CssClass="text-danger" />
            <asp:RangeValidator ID="rvCalificacion" runat="server" ControlToValidate="tbcalificacion" MinimumValue="0" 
                MaximumValue="10" Type="Integer" ErrorMessage="El valor no se encuentra entre el rango 0-10" Display="Dynamic" CssClass="text-danger" />
        </div>   
    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="idioma" class="form-label">Idioma:</label>
            <asp:TextBox runat="server" ID="tbidioma" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvIdioma" runat="server" ControlToValidate="tbidioma" 
                ErrorMessage="El idioma es obligatorio" Display="Dynamic" CssClass="text-danger" />
        </div>  
        <div class="col-md-6 mb-3">
            <label for="restriccion" class="form-label">Restricción de edad:</label>
            <asp:TextBox runat="server" ID="tbrestriccion" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvRestriccion" runat="server" ControlToValidate="tbrestriccion" 
                ErrorMessage="La restrinccion es obligatorio" Display="Dynamic" CssClass="text-danger" />
            <asp:RangeValidator ID="rvRestriccion" runat="server" ControlToValidate="tbrestriccion" MinimumValue="0" 
                MaximumValue="18" Type="Integer" ErrorMessage="El valor no se encuentra entre el rango 0-18" Display="Dynamic" CssClass="text-danger" />
        </div>   
    </div>
                        