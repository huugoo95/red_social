<form class="form-horizontal" action="user.php" method="post">

<!-- Form Name -->
<h2>Accede a tu red</h2>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Mail">Mail</label>  
  <div class="col-md-4">
  <input id="Mail" name="Mail" type="email" placeholder="Mail" class="form-control input-md" required="">
    
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="Contraseña">Contraseña</label>  
  <div class="col-md-4">
  <input id="pass" name="passwordLogin" type="password" placeholder="Contraseña" class="form-control input-md" required="">
  
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Acceder">Acceder</label>
  <div class="col-md-4">
    <button id="Acceder" type="submit" name="Acceder" class="btn btn-danger">Acceder</button>
  </div>
</div>
<input type="hidden" id="logueo" name="logueo" value="logueo">
</form>