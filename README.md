# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Una applicacion para tus citas medicas

Modelo de negocio: *imagen*

Como fue la creacion:

1- Cree un repositorio en github, lo clone en mi local y cree el proyecto en rails donde agregue los archivos docker-compose.yml y Dockerfile con la configuracion deseada, agregue la gemas necesarias en el Gemfile y corri el contenedor, cuando estuvo todo ok pushee. Finalmente cree una rama "abi" para poder continuar con los cambios.

2- Creacion del model User con la gema devise, esto me genera el model y las distintas rutas de logeo de usuario; luego en application_controler valide que antes de cualquier accion se loguee el usuario. 

3- Creacion del model Medico con atributos {name, specialty}, usando el comando rails g model y luego abriendo la consola de rails para generar algunos registros en la base de datos. 

(Aclaracion: luego de cada creacion de modelos corri las migraciones pendientes)  

4- Creacion del model, CRUD y views de appointment usando el comando rails g scaffold.  

5- Agregue la relacion has_many :appointment en model user; Ademas de validacion para el campo meet_motive en el model de appointment; luego linkee, en cada archivo index de las vistas, las distintas rutas que iba a necesitar; por ultimo en layout/application.html.erb agregar el boton cerrar sesion si el usuario esta logueado.

6-en home controller agregue skip_before_action :authenticate_user!, only: [:index]

7-creacion de una carpeta partials con el archivo navigation que contiene un header con los botones de inicio de session cierre de session y crear cuenta, render en home y appointment a partials/navigation.

8-en create de appointment agregue un current_user y en index busque por id de usuario ordenando de forma ascendente

9-