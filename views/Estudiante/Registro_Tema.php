<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Registro Tema</title>
    <link rel="stylesheet" href="../../dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../dist/css/adminlte.css">
    <script src="https://kit.fontawesome.com/c043dd7bb6.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../dist/css/fontawesome.css">
    <script src="../../dist/js/jquery.js"></script>
    <script src="../../dist/js/typehead.js"></script>
    <style>
        .navbar{
            background-color:white;
        }
        .logo-utp{
            width:60px;
            border-radius: 50px;   
            margin-left: 2%;  
        }
        .pnav{
            margin-left: 2%;
        }
        .icon{
            color: black;
            margin-right: 2%;
        }
        .btn{
            background-color: #801F71;
            color: white;
        }
        .sub{
            margin-top: 20%;
            font-size: 30px;
            color: white;
        }
        .icono{
            font-size: 50px;
            margin-top: 5%;
            color: white;
        }
        .container-f {
            width: auto;
            max-width: 680px;
            padding: 0 15px;
        }
        .footer-f {
        background-color: #f5f5f5;
        margin-top: 17%;
        }
        .d5-1{
            width: 40%;
        }
        .card{
            justify-content: center;
            width: 80%;
            padding: 5%;
        }
        .r{
            float: right;
            width: 20%;
        }
        .jumbotron{
            background-color: #330C2D;
            color: white;
        }
    </style>
</head>
<body>
        <nav class="navbar navbar-expand-lg navbar-light">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                  <img src="../../dist/img/logo.jpg" class="logo-utp">
                  
                  <ul class="navbar-nav mr-auto mt-2 mt-lg-0 text-dark">
                    <li class="nav-item active">
                      <a class="nav-link" href="#">Inicio </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Solictudes</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Repositorio</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Celendario</a>
                    </li>
                  </ul>

                  <a class="text-dark icon">Cerrar Sesión</a> <i class="fas fa-user icon "></i>
            </div>
        </nav>
        <section class="jumbotron ">
                <div class="container">
                        <h1 class="jumbotron-heading">Registro Oficial del Tema de Graduacion</h1>
                          <a href="#" class="btn  my-2">Ver requisitos</a>
                        </p>
                </div>
        </section class="card">
       
        <div class="container">
            <div class="  card">
                    <form method="POST" action="../../controllers/AnteproyectoController.php">
                        <div class="form-group d2-1">
                            <input type="text" class="form-control" name="titulo"  placeholder="Titulo" >
                        </div>
                        <div class="form-group d5-1">
                                <input type="text" class="form-control" name="objetivo" placeholder="Obejtivo General">
                        </div>
                        <div class="form-group d5-1">
                            <p>El tema escogido tiene mayor relevancia en el área académica de :</p>
                                   <select class="custom-select my-1 mr-sm-2" name="prioridad">
                                        <option value="1">Arquitectura y Redes de Computadoras</option>
                                        <option value="2">Computación y Simulación de Sistemas</option>
                                        <option value="3">Ingeniería de Software</option>
                                        <option value="4">Programacion de Computadoras</option>
                                        <option value="5">Sistemas de Información</option>
                                    </select>
                                   
                        </div>       
                        <div class="form-group">
                                <select class="custom-select my-1 mr-sm-2 " name="tipoTrabajo">
                                        <option selected>Tipo de Trabajo </option>
                                        <option value="Teorico">Teorico</option>
                                        <option value="Teorico-practico">Teorico - Practico</option>
                                </select>              
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control typeahead" name="asesor" placeholder="asesor" autocomplete="off" spellcheck="false">
                        </div>

                        <?php 
                            if(isset($_FILES['archivo']) && $_FILES['archivo']['type']=='application/pdf'){
                            move_uploaded_file ($_FILES['archivo']['tmp_name'] , '../../dist/archivos/'.$_FILES['archivo']['name']);
                            }
                        ?>


                        <div class="form-group">
                                <label class="form">Sibir Archivo (PDF)</label>
                                <input type="file" class="form-control" name="archivo">
                        </div>
                        <button type="submit" class="btn btn-primary r">Enviar</button>
                    </form>
            </div>
        </div>

        <footer class="footer-f  py-3">
                <div class="container-f">
                  <span class="text-muted">Place sticky footer content here.</span>
                </div>
        </footer>
<script src="../../dist/js/bootstrap.js"></script>

</body>
</html>