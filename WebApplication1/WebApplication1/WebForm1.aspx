<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style></style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"/>
    <link rel="stylesheet" href="assets/clockpicker/dist/bootstrap-clockpicker.min.css"/>
    <link rel="stylesheet" href="assets/alerts/dist/sweetalert.css"/>
    
    <link rel="stylesheet" type="text/css" href="assets/datatable/datatables.min.css"/>

    <style>
         .nav-pills .nav-link.active, .nav-pills .show>.nav-link
        {
            background-color:#545b62;
        }

         a{
             color: #6c757d;
         }

         a:hover {
            color: #545b62;
            text-decoration: underline;
        }

    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="card bg-light mt-3 ml-1 mr-1" >
                <div class="card-header text-center"><h1>Practica Web "Horarios"</h1>
                    <div class="col-lg-12 text-left">  
                        <h3>Mensaje:</h3>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>

                    </div>
                </div>
                    <div class="card-body">
                        <div class="col-lg-12">
                            <div class="nav flex-column nav-pills col-lg-2 float-left" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Conexion</a>
                                <a class="nav-link" id="v-pills-grupo-tab" data-toggle="pill" href="#add_grupo" role="tab" aria-controls="add_grupo" aria-selected="false">Agregar Grupo</a>
                                <a class="nav-link" id="v-pills-materias-tab" data-toggle="pill" href="#add_materia" role="tab" aria-controls="add_materia" aria-selected="false">Agregar Materias</a>
                                <a class="nav-link" id="v-pills-maestros-tab" data-toggle="pill" href="#add_maestro" role="tab" aria-controls="add_maestro" aria-selected="false">Agregar Maestros</a>
                                <a class="nav-link" id="v-pills-asignacion-tab" data-toggle="pill" href="#add_asignacion" role="tab" aria-controls="add_horario" aria-selected="false">Agregar Asignacion</a>
                                <a class="nav-link" id="v-pills-horarios-tab" data-toggle="pill" href="#add_horario" role="tab" aria-controls="add_horario" aria-selected="false">Agregar Horarios</a>
                                <a class="nav-link" id="v-pills-m_horario-tab" data-toggle="pill" href="#m_horario" role="tab" aria-controls="m_horario" aria-selected="false">Mostrar Horarios</a>

                                <a class="nav-link" id="v-pills-asesoria-tab" data-toggle="pill" href="#add_asesoria" role="tab" aria-controls="m_horario" aria-selected="false">Crear Asesoria</a>
                                <a class="nav-link" id="v-pills-m_inscripcion-tab" data-toggle="pill" href="#add_inscripcion" role="tab" aria-controls="m_horario" aria-selected="false">Inscribir en Asesoria</a>
                                <a class="nav-link" id="v-pills-m_asesoria-tab" data-toggle="pill" href="#m_asesoria" role="tab" aria-controls="m_horario" aria-selected="false">Mostrar Asesorias</a>
                            </div>
                            <div class="tab-content col-lg-10 float-right" id="v-pills-tabContent">
                                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                      <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Probar conexion" CssClass="btn btn-secondary btn-block"/>
                                      
                                </div>
                                
                                                                            

                                        
                                <div class="tab-pane fade" id="add_grupo" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                      <div class="row">
                                          <div class="col-lg-8">
                                          <div class="form-group">
                                              <label>Grado</label>
                                              <asp:DropDownList ID="DropDownList10" runat="server" AutoPostBack="False" CssClass="form-control">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                </asp:DropDownList>
                                                
                                          </div>
                                          <div class="form-group">
                                              <label>Letra</label>
                                              <asp:DropDownList ID="DropDownList11" runat="server" AutoPostBack="False" CssClass="form-control">
                                        <asp:ListItem>A</asp:ListItem>
                                        <asp:ListItem>B</asp:ListItem>
                                        <asp:ListItem>C</asp:ListItem>
                                        <asp:ListItem>D</asp:ListItem>
                                </asp:DropDownList>
                                          </div>
                                          <div class="form-group">
                                              <label>Nivel</label>
                                              <asp:DropDownList ID="DropDownList12" runat="server" AutoPostBack="false" CssClass="form-control">
                                                  <asp:ListItem>TSU</asp:ListItem>
                                                  <asp:ListItem>ING</asp:ListItem>

                                              </asp:DropDownList>
                                          </div>
                                      </div>
                                      <div class="col-lg-4">
                                          <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Inserta Grupo" CssClass="btn btn-secondary btn-block" Height="125"/>
                                          <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Insertar Seguro" CssClass="btn btn-secondary btn-block" Height="125"/>
                                      </div>
                                      </div>
                                  </div>
                                <div class="tab-pane fade" id="add_materia" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                           <label>Nombre de la Materia</label>
                                           <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="Button6" runat="server" Text="Guardar Materia" CssClass="btn btn-secondary btn-block" OnClick="Button6_Click"/>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="add_maestro" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                           <label>Nombre del Maestro</label>
                                           <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                           <label>Apellido del Maestro</label>
                                           <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="Button8" runat="server" Text="Guardar Profesor" CssClass="btn btn-secondary btn-block" OnClick="Button8_Click"/>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="add_asignacion" role="tabpanel" aria-labelledby="add_horario">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label>Selecciona un Grupo</label>
                                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Selecciona una Materia</label>
                                                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Selecciona un Maestro</label>
                                                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Selecciona un Periodo o Cuatrimestre</label>
                                                <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Agregar Asignacion" CssClass="btn btn-secondary btn-block"/>
                                        </div>
                                    </div>
                                <div class="tab-pane fade" id="add_horario" role="tabpanel" aria-labelledby="add_horario">
                                        <div class="col-lg-12">
                                            <!--<div class="form-group">
                                                <label>Selecciona un Grupo</label>
                                                <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>-->
                                            <div class="form-group">
                                                <label>Selecciona una Asignacion</label>
                                                <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Selecciona un Dia</label>
                                                <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Selecciona una Hora</label>
                                                <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Button ID="Button7" runat="server" OnClick="Button_Click" Text="Agregar Horario" CssClass="btn btn-secondary btn-block"/>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="m_horario" role="tabpanel" aria-labelledby="m_horario">

                                        <div class="col-lg-12">
                                            <div class="form-group">

                                            <label>Selecciona un Grupo</label>
                                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="False" CssClass="form-control ">
                                            </asp:DropDownList>  
                                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Mostra Horario" CssClass="btn btn-secondary btn-block mt-3"/>
                                            </div>
                                            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" CssClass="text-center">
                                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#33276A" />
                                            </asp:GridView>
                                        </div>
                                  </div>
                                <div class="tab-pane fade" id="add_asesoria" role="tabpanel" >
                                    
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label>Maestro</label>
                                                <asp:DropDownList ID="DropDownList13" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label>Cupo</label>
                                                <input type="text" id="Cupo" value="" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Dia</label>
                                                <asp:DropDownList ID="DropDownList14" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>Selecciona una Hora</label>
                                                <asp:DropDownList ID="Hora" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>

                                            <div class="col-lg-12 mt-4">
                                                <button type="button" id="btn-guardar" class="btn btn-primary btn-block">Guardar Asincrono con AJAX</button>
                                            </div>

                                            



                                        </div>
                                  </div>
                                <div class="tab-pane fade" id="add_inscripcion" role="tabpanel" >
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label>Maestro</label>
                                                <asp:DropDownList ID="DropDownList17" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>

                                            <div class="form-group">
                                                <label>Selecciona un Horario de Asesoria</label>
                                                <select disabled="disabled" class="form-control" id="cmbAsesoriaInscripcion">
                                                    <option></option>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label>Tema</label>
                                                <input type="text" id="tema" value="" class="form-control"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Matricula</label>
                                                <input type="text" id="matricula" value="" class="form-control"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Nombre</label>
                                                <input type="text" id="nombre" value="" class="form-control"/>
                                            </div>
                                            
                                        </div>
                                        <div class="col-lg-12 mt-4">
                                                <button type="button" id="btn-guardar-inscripcion" class="btn btn-primary btn-block">Guardar Asincrono con AJAX</button>
                                           </div>
                                  </div>
                                <div class="tab-pane fade" id="m_asesoria" role="tabpanel" >
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label>Selecciona un Profesor</label>
                                                <asp:DropDownList ID="DropDownList16" runat="server" AutoPostBack="False" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>

                                            <div class="form-group">
                                                <label>Asesoria</label>
                                                <select id="cmbAsesoria" disabled="disabled" class="form-control">
                                                    <option></option>
                                                </select>
                                            </div>

                                            <div id="table">

                                            </div>
                                        </div>
                                  </div>
                            </div>
                            
                        </div>
                                                                    
                                                                    

                    </div>
            </div>
        </div>
    </form>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="assets/clockpicker/dist/bootstrap-clockpicker.min.js"></script>
 
<script type="text/javascript" src="assets/datatable/datatables.min.js"></script>
    <script src="assets/alerts/dist/sweetalert.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $('.clockpicker').clockpicker();

            $('#btn-guardar').on('click', function (e) {
                e.preventDefault();

                var asesoria = new Object();
                asesoria.Idprofesor = $('#DropDownList13').val();
                asesoria.Cupo =$('#Cupo').val() ;
                asesoria.Dia =$('#DropDownList14').val() ;
                asesoria.Idhora = $('#Hora').val();
                console.log(asesoria);
            
                asesoria = JSON.stringify(asesoria);

                $.ajax({
		            url: 'http://localhost:49849/Service1.svc/AgregarAsesoria',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    processData: true,
		            data: asesoria,
	            })
	            .done(function(respuesta) {
	                console.log(respuesta);
	                if (respuesta==true)
	                {

	                    swal('Hurray!', 'Exito al Agregar la Asesoria!', 'success');
	                }
	                else
	                {

	                    swal('Espera!', 'Parece que ya existe en la BD o No se pudo agregar!', 'info');
	                }
	            })
                    .fail(function (error) {
                    swal('Oh No!','Algo Ocurrio!','warning');
		            console.log(error);
	            });

            });

            $('#btn-guardar-inscripcion').on('click', function (e) {
                e.preventDefault();

                var asesoria = new Object();
                asesoria.Idasesoria = $('#cmbAsesoriaInscripcion').val();
                asesoria.Matricula =$('#matricula').val() ;
                asesoria.Nombre =$('#nombre').val() ;
                asesoria.Tema =$('#tema').val() ;
            
                    asesoria = JSON.stringify(asesoria);
                    console.log(asesoria);

                $.ajax({
		            url: 'http://localhost:49849/Service1.svc/AgregarInscripcion',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    processData: true,
		            data: asesoria,
	            })
	            .done(function(respuesta) {
	                console.log(respuesta);
	                

	                if(respuesta==true){
	                    
	                    swal('Hurray!', 'Exito al Agregar!', 'success');
	                }
                    else
                    {
	                    swal('Espera!', 'Parece que ya existe en la BD o No se pudo agregar!', 'info');
	                }

	                $("#DropDownList17").val($("#DropDownList17 option:first").val());
	                $('#cmbAsesoriaInscripcion').attr('disabled', 'disabled');
	                $('#cmbAsesoriaInscripcion').html("");
	                $('#matricula').val("");
	                $('#nombre').val("");
	                $('#tema').val("");
	            })
                    .fail(function (error) {
                    swal('Oh No!','Algo Ocurrio!','warning');
		            console.log(error);
	            });

            });

            $('#DropDownList16').on('change', function (e) {
                e.preventDefault();
                var p = new Object();
                p.idprofesor = parseInt($('#DropDownList16').val());
                    p = JSON.stringify(p);
                
                    $.ajax({
                        url: 'http://localhost:49849/Service1.svc/AsesoriasProfesor',
                        type: 'POST',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        processData: false,
                        data: p,
	                })
                    .done(function (respuesta) {
                        var json= JSON.parse(respuesta);
                    console.log(json.html);
                    var html = "<option></option>";

                        if (json != null && json.exito == true) {
                            json.html.forEach(function (elemento) {
                                console.log(elemento);
                                html += "<option value='" + elemento.IdAsesoria + "'>Dia: " + elemento.Dia1 + " De: " + elemento.HoraInicio + " a " + elemento.HoraFin + "</option>";
                            });
                            
                            console.log(html);
                            $('#cmbAsesoria').html(html);
                            $('#cmbAsesoria').removeAttr('disabled','disabled');
                        }
                        else
                        {
                            swal('Ups!', 'No hay asesorias para este profesor!', 'warning');
                            $('#cmbAsesoria').attr('disabled','disabled');
                            $('#table').html("");
                        }

	                })
                    .fail(function (error) {
                    swal('Oh No!','Algo Ocurrio!','warning');
		            console.log(error);
	                });

            });

            $('#DropDownList17').on('change', function (e) {
                e.preventDefault();
                var p = new Object();
                p.idprofesor = parseInt($('#DropDownList17').val());
                p = JSON.stringify(p);

                $.ajax({
                    url: 'http://localhost:49849/Service1.svc/AsesoriasProfesor',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    processData: false,
                    data: p,
                })
                .done(function (respuesta) {
                    var json = JSON.parse(respuesta);
                    console.log(json.html);
                    var html = "<option></option>";

                    if (json != null && json.exito == true) {
                        json.html.forEach(function (elemento) {
                            console.log(elemento);
                            html += "<option value='" + elemento.IdAsesoria + "'>Dia: " + elemento.Dia1 + " De: " + elemento.HoraInicio + " a " + elemento.HoraFin + "</option>";
                        });

                        console.log(html);
                        $('#cmbAsesoriaInscripcion').html(html);
                        $('#cmbAsesoriaInscripcion').removeAttr('disabled', 'disabled');
                    }
                    else {
                        swal('Ups!', 'No hay asesorias para este profesor!', 'warning');
                        $('#cmbAsesoriaInscripcion').attr('disabled', 'disabled');
                    }

                })
                .fail(function (error) {
                    swal('Oh No!', 'Algo Ocurrio!', 'warning');
                    console.log(error);
                });

            });

            $('#cmbAsesoria').on('change', function (e) {
                e.preventDefault();
                var p = new Object();
                p.idprofesor = parseInt($('#cmbAsesoria').val());
                p = JSON.stringify(p);
                $.ajax({
                    url: 'http://localhost:49849/Service1.svc/MostrarAsesorias',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    processData: false,
                    data: p,
	            })
                    .done(function (respuesta) {
                      var json= JSON.parse(respuesta);
                        var html = '<button class="btn btn-primary btn-block mb-4 mt-4" type="button" id="cancelar-asesoria" value="'+$('#cmbAsesoria').val()+'">Cancelar Asesoria</button><table class="table table-striped table-hover text-center" id="tbl"  width="100%"><thead class="thead-light"> <tr><th >IdAA</th><th >Matricula</th><th >Nombre</th><th >Tema</th><th>Accion</th></tr></thead><tbody>';
                        if (json!=null && json.exito==true)
                        {
                            json.html.forEach(function (elemento) {
                                html += "<tr><td>" + elemento.IdAA + "</td><td>" + elemento.Matricula + "</td><td>" + elemento.Nombre + "</td><td>" + elemento.Tema + "</td><td><button type='button' class='btn btn-danger btn-eliminar-alumno' value='" + elemento.IdAA + "'>Eliminar</button></td></tr>";

                            });
                        }

                        html += "</table>";
                        $('#table').html(html);
                        $('#tbl').DataTable();

                        $('.btn-eliminar-alumno').on('click', function (e) {
                                e.preventDefault();

                                var p = new Object();
                                p.idprofesor = this.value;
                                    p = JSON.stringify(p);
                
                                    $.ajax({
                                        url: 'http://localhost:49849/Service1.svc/EliminarAA',
                                        type: 'POST',
                                        contentType: 'application/json; charset=utf-8',
                                        dataType: 'json',
                                        processData: false,
                                        data: p,
	                                })
                                    .done(function (respuesta) {
                                        console.log(respuesta);
                                        
                                        swal('Eliminado!', 'Se elimino correctamente, se recargara la tabla', 'success');
                                         $('#cmbAsesoria').change();
	                                })
                                    .fail(function (error) {
                                        swal('Oh No!','Algo Ocurrio!','warning');
		                                console.log(error);
	                                });

                            });

                        $('#cancelar-asesoria').on('click', function (e) {
                            e.preventDefault();
                            
                                var p = new Object();
                                p.idprofesor = this.value;
                                    p = JSON.stringify(p);
                                    console.log(p);
                                    $.ajax({
                                        url: 'http://localhost:49849/Service1.svc/EliminarAsesoria',
                                        type: 'POST',
                                        contentType: 'application/json; charset=utf-8',
                                        dataType: 'json',
                                        processData: false,
                                        data: p,
	                                })
                                    .done(function (respuesta) {
                                        console.log(respuesta);
                                        $("#DropDownList16").val($("#DropDownList16 option:first").val());
                                        $('#cmbAsesoria').attr('disabled', 'disabled');
                                        $('#cmbAsesoria').html("");
                                        $('#table').html("");
                                        swal('Eliminado!', 'Se elimino correctamente', 'success');
                                        
	                                })
                                    .fail(function (error) {
                                        swal('Oh No!','Algo Ocurrio!','warning');
		                                console.log(error);
	                                });
                        });
                    
	            })
                .fail(function (error) {
                    swal('Oh No!','Algo Ocurrio!','warning');
		            console.log(error);
	            });

            });

            

            


        });
        

        

        
    </script>
</body>
</html>
