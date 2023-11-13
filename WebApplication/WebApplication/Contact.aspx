<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Grupo: 3</h2>

    <div class="contact">
        <div class="contact-item">
            <img src="img/alexis.PNG" alt="Imagen de Alexis Ricardo Burgos" width="100" height="100">
            </br>
            <span>Burgos,</br> Alexis Ricardo</span>
        </div>

        <div class="contact-item">
            <img src="img/daniel.PNG" alt="Imagen de Daniel Agustin Enciso Villalba" width="100" height="100">
            </br>
            <span>Enciso Villalba,</br> Daniel Agustin</span>
        </div>

        <div class="contact-item">
            <img src="img/sergio.PNG" alt="Imagen de Sergio Luna" width="100" height="100">
            </br>
            <span>Luna,</br> Sergio</span>
        </div>

        <div class="contact-item">
            <img src="img/leandro.PNG" alt="Imagen de Leandro Fabián Politano" width="100" height="100">
            </br>
            <span>Politano,</br> Leandro Fabián</span>
        </div>

        <div class="contact-item">
            <img src="img/mauro.PNG" alt="Imagen de Mauro Ariel Politano" width="100" height="100">
            </br>
            <span>Politano,</br> Mauro Ariel</span>
        </div>
    </div>

    <style>
    .contact-item {
        display: inline-block;
        margin-right: 20px; 
    }
    </style>
</asp:Content>
