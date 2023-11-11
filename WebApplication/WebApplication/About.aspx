<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
                    <input type="text" class="form-control" placeholder="Ingresar titulo" name="titulo" id="titulo">
                </div>
                <div class="col-sm-3">
                    <label for="genero" class="sr-only">Genero:</label>
                    <select class="form-control" name="genero" id="genero">
                      <option>-- Seleccion un genero --</option>
                      <option>Acccion</option>
                      <option>Terror</option>
                      <option>Drama</option>
                      <option>Ciencia Ficcion</option>
                    </select>
                </div>
            <div class="col-sm-4">
                <button type="button" class="btn btn-secondary mb-2" id="btnLimpiar">Limpiar</button>
                <button type="button" class="btn btn-primary mb-2" id="btnFiltrar">Filtrar</button>
            </div>
        </div>
    </div>
    </form>
    <hr>
    <h4>Listado de peliculas</h4>
    <table class="table table-striped">
    <thead>
      <tr>
        <th>Titulo</th>
        <th>Genero</th>
        <th>Estreno</th>
        <th>Pais</th>
        <th>Duracion (min)</th>
        <th>Director</th>
        <th>Calificación</th>
        <th>Idioma</th>
        <th>Restricción de edad</th>
        <th>Productora</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>La caída del Halcón Negro</td>
        <td>Acción</td>
        <td>28-12-2001</td>
        <td>Estados Unidos</td>
        <td>144</td>
        <td>Ridley Scott</td>
        <td>9</td>
        <td>Inglés</td>
        <td>16</td>
        <td>Columbia Pictures</td>
        <td>
          <a href="#" class="btn btn-warning btn-sm" data-toggle="modal"  data-target="#editarModal">Editar</a>
          <a href="#" class="btn btn-danger btn-sm" data-toggle="modal"  data-target="#eliminarModal">Eliminar</a>
        </td>
      </tr>
    </tbody>
    </table>

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
                                <button type="submit" class="btn btn-primary">Agregar</button>
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
                                <button type="submit" class="btn btn-danger">Eliminar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
