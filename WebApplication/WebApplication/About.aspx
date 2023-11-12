<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="modal fade" id="eliminarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Eliminar Película</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <p>
                                    <b>¿Está seguro que desea eliminar la pelicula?</b>
                                </p>
                            </div>
                        </div>
                        </br>
                        <div class="row justify-content-end">
                            <div class="col-md-6 mb-3">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                <asp:Button ID="ButtonEliminar" runat="server" OnClick="ButtonEliminar_Click" Text="Eliminar" CssClass="btn btn-danger"/>
                                <%--<button type="submit" class="btn btn-danger">Eliminar</button>--%>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="agregarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Agregar Película</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form >
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="titulo" class="form-label">Título:</label>
                                <asp:TextBox runat="server" ID="tbtitulo" CssClass="form-control"></asp:TextBox>
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
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Agregar" CssClass="btn btn-primary"/>
                                <%--<button type="submit" class="btn btn-primary">Agregar</button>--%>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

     <div class="modal fade" id="editarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Editar Película</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="titulo" class="form-label">Título:</label>
                                <input type="text" class="form-control" id="titulo" name="titulo">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="genero" class="form-label">Género:</label>
                                <select class="form-control" name="genero" id="genero">
                                  <option>-- Seleccion un genero --</option>
                                  <option>Acccion</option>
                                  <option>Terror</option>
                                  <option>Drama</option>
                                  <option>Ciencia Ficcion</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="estreno" class="form-label">Estreno:</label>
                                <input type="text" class="form-control" id="estreno" name="estreno">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="pais" class="form-label">País:</label>
                                <input type="text" class="form-control" id="pais" name="pais">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="productora" class="form-label">Productora:</label>
                                <input type="text" class="form-control" id="productora" name="productora">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="duracion" class="form-label">Duración (min):</label>
                                <input type="text" class="form-control" id="duracion" name="duracion">
                            </div> 
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="director" class="form-label">Director:</label>
                                <input type="text" class="form-control" id="director" name="director">
                            </div>  
                            <div class="col-md-6 mb-3">
                                <label for="calificacion" class="form-label">Calificación:</label>
                                <input type="text" class="form-control" id="calificacion" name="calificacion">
                            </div>   
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="idioma" class="form-label">Idioma:</label>
                                <input type="text" class="form-control" id="idioma" name="idioma">
                            </div>  
                            <div class="col-md-6 mb-3">
                                <label for="restriccion" class="form-label">Restricción de edad:</label>
                                <input type="text" class="form-control" id="restriccion" name="restriccion">
                            </div>   
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="productora" class="form-label">Productora:</label>
                                <input type="text" class="form-control" id="productora" name="productora">
                            </div>    
                        </div>
                        </br>
                        <div class="row justify-content-end">
                            <div class="col-md-6 mb-3">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                <button type="submit" class="btn btn-primary">Editar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    

    <h3>Peliculas</h3>
    <button type="button" class="btn btn-success mb-2" id="btnAgregar" data-toggle="modal"  data-target="#agregarModal">Agregar +</button>
    <%--<p><a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#agregarModal">Agregar +</a></p>--%>
    <%--<p><a class="btn btn-primary btn-lg">Agregar +</a></p>--%>
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
    <div>
        <asp:GridView runat="server" ID="gvupeliculas" class="table table-borderless table-hover">
            <Columns>

            </Columns>
        </asp:GridView>
    </div>
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
                <a href="#" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editarModal" >Editar</a>
                <a href="#" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#eliminarModal" >Eliminar</a>
                <%--<asp:Button runat="server" CommandName="Eliminar" CssClass="btn btn-danger btn-sm" Text="Eliminar" OnClientClick='<%# "abrirEliminarModal(" + Eval("idPelicula") + "); return false;" %>' />--%>

            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    </asp:GridView>
    
</asp:Content>



