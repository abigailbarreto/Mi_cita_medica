# README
Una aplicacion para registrar tus citas médicas!

--INSTRUCCIONES PARA CORRER LA APLICACIÓN--

Esta aplicacion esta dockerizada por lo tanto solo vas a necesitar tener instalado docker y docker-compose en tu pc, luego:

1-En la carpeta donde clonaste el repo vas a abrir una nueva terminal y vas a colocar los siguientes comandos en orden:
          -docker-compose build 
          -docker-compose up

Listo, tu aplicacion ya esta corriendo, anda a tu navegador web y pone la sig ruta => localhost:3000 











COMO FUE LA CREACIÓN:

1- Cree un repositorio en github, lo clone en mi local y cree el proyecto en rails donde agregue los archivos docker-compose.yml y Dockerfile con la configuracion deseada, agregue la gemas necesarias en el Gemfile y corri el contenedor, cuando estuvo todo ok pushee. Finalmente cree una rama "abi" para poder continuar con los cambios.

2- Creacion del model User con la gema devise, esto me genera el model y las distintas rutas de logeo de usuario; luego en application_controler valide que antes de cualquier accion se loguee el usuario. 
(rails g devise User)

3- Creacion del model Medico con atributos {name, specialty}. Luego abriendo la consola de rails para generar algunos registros en la base de datos. 
(rails g model Medico)

4- Creacion del model, CRUD y views de appointment.
(rails g scaffold)  

5-rails db:migrate

6- Agregue la relacion has_many :appointment en model user

7- Validacion para el campo meet_motive (presence: true)

8- Cree la home. 
(rails g controller Home index)

9- Linkee, en cada archivo index de las vistas, las distintas rutas que iba a necesitar.

10- En home controller agregue skip_before_action :authenticate_user!, only: [:index] para que en esa vista no me pida loguearme.

7- Creacion de una carpeta partials con el archivo navigation que contiene un header con los botones de inicio de sesion y crear cuenta si el usuario no esta logueado o cierre de sesion si lo esta, render en home y appointment a partials/navigation.

8- En el create de appointment, antes de guardar, agregue current_user para que guarde las citas con el id del usuario que esta actualmente en la sesion. 

9- Validacion para que el estado de la cita antes de guardar sea true.

10- Selector para los medicos en el formulario de citas.

11- Creacion de 2 variables en el index de appointments, una variable almacena los registros que tienen una fecha futuras a la del dia actual y la otra los que tienen fechas pasadas; con estos datos genere en la vista index 2 botones que muestran estas variables con los registros obtenidos.

12- Modificacion del selector del formulario para que no pueda elegir una fecha anterior a la del dia actual y para que solo pueda elegir en el horario de consulta de los medicos.

13-validaciones de citas
    -un medico no puede tener en el dia 2 citas a la misma hora    
    -un usuario no puede tener en el dia 2 citas a la misma hora

14- Generar CSS para las vistas.