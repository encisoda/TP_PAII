<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlFormulario.ascx.cs" Inherits="WebApplication.ControlFormulario" %>

<asp:TextBox runat="server" ID="tbtitulo" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvTitulo" runat="server" ControlToValidate="tbtitulo" 
                            ErrorMessage="El título es obligatorio" Display="Dynamic" CssClass="text-danger" />
                        