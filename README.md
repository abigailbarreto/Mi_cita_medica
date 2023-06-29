# README
Una applicacion para resgistrar tus citas médicas!

--ISTRUCCIONES PARA CORRER LA APLICACIÓN--

Esta aplicacion esta dockerizada por lo tanto solo vas a necesitar tener instalado docker y docker-compose en tu pc, luego:

1-En la carpeta donde clonaste el repo vas a abrir una nueva terminal y vas a colocar los siguientes comandos en orden:
          -docker build 
          -docker-compose up

Listo, tu aplicacion ya esta corriendo, anda a tu navegador web y pone la sig ruta => localhost:3000 











COMO FUE LA CREACIÓN:

1- Cree un repositorio en github, lo clone en mi local y cree el proyecto en rails donde agregue los archivos docker-compose.yml y Dockerfile con la configuracion deseada, agregue la gemas necesarias en el Gemfile y corri el contenedor, cuando estuvo todo ok pushee. Finalmente cree una rama "abi" para poder continuar con los cambios.

2- Creacion del model User con la gema devise, esto me genera el model y las distintas rutas de logeo de usuario; luego en application_controler valide que antes de cualquier accion se loguee el usuario. 

3- Creacion del model Medico con atributos {name, specialty}, usando el comando rails g model y luego abriendo la consola de rails para generar algunos registros en la base de datos. 

(Aclaracion: luego de cada creacion de modelos corri las migraciones pendientes)  

4- Creacion del model, CRUD y views de appointment usando el comando rails g scaffold.  

5- Agregue la relacion has_many :appointment en model user; Ademas de validacion para el campo meet_motive en el model de appointment; luego linkee, en cada archivo index de las vistas, las distintas rutas que iba a necesitar; por ultimo en layout/application.html.erb agregar el boton cerrar sesion si el usuario esta logueado.

6-en home controller agregue skip_before_action :authenticate_user!, only: [:index]

7-creacion de una carpeta partials con el archivo navigation que contiene un header con los botones de inicio de session cierre de session y crear cuenta, render en home y appointment a partials/navigation.

8-en create de appointment agregue un current_user y en index busque por id de usuario ordenando de forma ascendente <= esto sufrio cambios mas adelante

9- validaciones para el estado de la cita y la fecha 

10-selector en el formulario de citas

11- ultimo paso, asignar una busqueda a 2 variables en el index de appointments, una variable contiene las fechas futuras a la del dia y la otra las fechas pasadas; con estos datos genere en la vista index 2 botones que almacenan estas busquedas y muestran los registros obtenidos.

12- validacion de la hora para que solo se pueda elegir en el horario de consulta.