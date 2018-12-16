El primer paso de todos es pensar en una aplicación que se ajuste lo más posible al diagrama de decisión en la implementación de una Dapp:

![alt text](https://github.com/PedroCCBlck/Dise-o-y-desarrollo/blob/master/PEC%203/diagrama%20de%20decisi%C3%B3n%20blockchain.png "Blockchain decision")

Dentro del siguiente artículo (relativo a la Comisión Europea) obtenemos la idea de crear una aplicación para la gestión descentralizada de los datos médicos y el acceso por parte de diversos centros médicos:

[EU Blockchain](https://ec.europa.eu/digital-single-market/en/blockchain-technologies)

La idea es positiva por apoyarse en varios factores:
1) Parte de la idea de tener una base de datos descentralizada en la que los centros de salud y hospitales pertenecientes a una red pública puedan acceder a los datos.
2) Se necesita una única versión de los datos de salud de los pacientes. Esto evitará que si el paciente traslada su lugar de residencia, el nuevo centro al que acuda tenga registros propios.
3) Debido a que los datos son fuertemente sensibles (según GDPR), es necesaria la implementación de fuertes medidas de seguridad desde el diseño de la aplicación.
4) El medio no es confiable (si, por ejemplo, se adhieren terceras partes como compañías de seguros y de salud).

Para preservar la privacidad de los datos, se optaría por una red Blockchain privada. Si se quisiera trasladar la funcionalidad a la red pública se tendría que preservar la privacidad de los datos a través de algoritmos como los ZPK (Zero Proof Knowledge).

<!DOCTYPE html>
<html>
<head>
  <img src="../images/hospital.jpg" alt="HTML5 Icon" style="width:128px;height:128px;">
  <title>Base de datos de pacientes demo</title>
  <br><label for="Emergencia">Control de parada (True/False) :</label><input type="text" onchange="handleEmergencia(this);" id="Emergencia" placeholder="e.g., True"></input>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
  <script src="./app.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <!-- Gestionamos las correctas validaciones de entrada-->
 <script>
  function handleEmergencia(input) {
    if ((input.value != 'True') && (input.value != 'False'))
    {
    alert("El valor aportado en el control de parada no es correcto.");
    }
    else
    {
      App.ParadaEmergencia() 
    }
  }
</script>

 <script>
    function handleChangeGlucosa(input) {
      if ((input.value < 70) || (input.value > 100))
      {
      alert("Corrija el valor de la glucosa (dentro de los umbrales)");
      };
    }
  </script>

<script>
  function handleChangeColesterol(input) {
    if ((input.value < 120) || (input.value > 200))
    {
    alert("Corrija el valor del colesterol (dentro de los umbrales)");
    };
  }
</script>

<script>
  function handleChangeTrigliceridos(input) {
    if ((input.value < 30) || (input.value > 220))
    {
    alert("Corrija el valor de los triglicéridos (dentro de los umbrales)");
    };
  }
</script>

<script>
  function handleChangeAcUrico(input) {
    if ((input.value < 2) || (input.value > 7))
    {
    alert("Corrija el valor del ácido úrico (dentro de los umbrales)");
    };
  }
</script>

<script>
  function handleChangeLinfocitos(input) {
    if ((input.value < 1300) || (input.value > 4000))
    {
    alert("Corrija el valor de los linfocitos (dentro de los umbrales)");
    };
  }
</script>

<script>
  function handleChangeId(input) {
    console.log(input.value.length);
    if (input.value.length != 8 )
    {
    alert("El identificador del paciente es un número de 8 cifras");
    };
  }
</script>

<!-- Frontend de la página de registro y consulta de información de los pacientes -->
</head>
<body>
  <h1>Bienvenido a la base de datos del consorcio de hospitales y compañías de seguros</h1>
  <h2>Base de datos de pacientes</h2>
  <h3>Tiene  <span class="black"><span id="balance"></span> tokens</span></h3>
  <h4><span class="black"><span id="accountAddress"></span></span></h4>
  <br>
  <h1>Envío de datos</h1>
  <br><label for="Glucosa">Indicador de glucosa (70-110 mg/dl)</label><input type="number" onchange="handleChangeGlucosa(this);" id="Glucosa" placeholder="e.g., 75"></input>
  <br><label for="Colesterol">Indicador de colesterol general (120-200 mg/dl)</label><input type="number" onchange="handleChangeColesterol(this);" id="Colesterol" placeholder="e.g., 125"></input>
  <br><label for="Trigliceridos">Indicador de trigliceridos (30-220 mg/dl)</label><input type="number" onchange="handleChangeTrigliceridos(this);" id="Trigliceridos" placeholder="e.g., 50"></input>
  <br><label for="AcidoUrico">Indicador de acido urico (2-7 mg/dl)</label><input type="number" onchange="handleChangeAcUrico(this);" id="AcidoUrico" placeholder="e.g., 6"></input>
  <br><label for="Linfocitos">Indicador de linfocitos (1.300-4.000 /mL)</label><input type="number" onchange="handleChangeLinfocitos(this);" id="Linfocitos" placeholder="e.g., 1350"></input>
  <br><label for="PacId">Identificador de paciente :</label><input type="text" onchange="handleChangeId(this);" id="PacId" placeholder="e.g., 76921472"></input>
  <br><br><button id="send" onclick="App.newInfo()">Envío de datos</button>
  <br><br>
  <span id="status"></span>
  <br>
  <br>
  <h1>Consulta de datos</h1>
  <br><label for="idPac">Identificador de paciente :</label><input type="text" onchange="handleChangeId(this);" id="idPac" placeholder="e.g., 76921472"></input>
  <br><br><button id="consulta" onclick="App.getInfo()">Consulta de datos</button>
  <br><br><button id="borrar" onclick="App.removeInfo()">Borrar datos</button>
  <br><br>
  <table class="table table-bordered table-responsive">
    <div style="margin: 5px">
    <thead>
    <tr class="info">
    <th scope="col">Riesgo</th>
    <th scope="col">Hospital</th>
    </tr>
    </thead>
    <tbody id="PatientTable">
    </tbody>
    </table>
  <span id="status"></span>
  <br>
  <span class="hint"><strong>Nota:</strong> Abra la consola del explorador para comprobar los errores y warnings.</span>
  <div>
  <img src="../images/doctor.jpg" alt="HTML5 Icon" style="width:128px;height:128px;">
  </div>
</body>
</html>
