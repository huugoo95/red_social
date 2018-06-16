
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.php">Red Social</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="novedades.php">Explorar novedades <span class="sr-only">(current)</span></a></li>
      </ul>
      <form class="navbar-form navbar-left" action="buscamiwis.php" method="post" >
        <div class="form-group">
          <input type="text" id="amiwi" name="amiwi" class="form-control" placeholder="Búsqueda de amigos" size="65">
        </div>
        <button type="submit" class="btn btn-default">Buscar!</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?php 
        session_start();
        if (isset($_SESSION["Nombre"])) {echo "Bienvenido <b>".$_SESSION["Nombre"]."</b>";}else{echo "¿Nos conocemos?";} ?> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="user.php">Mi perfil</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="index.php?logout=si">Cerrar Sesión</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
