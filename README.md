# Capital Humano en Ciencia y Tecnología de Nuevo León - campe

[![Maintainability](https://api.codeclimate.com/v1/badges/a20bb0138b3bf93ddd16/maintainability)](https://codeclimate.com/github/ProyectoIntegrador2018/i2t2-campe/maintainability)

Aplicación web con el objetivo de brindar seguimiento a los becarios y exbecarios del CONACYT - I2T2

## Tabla de contenidos

* [Información del cliente](#información-del-cliente)
* [URLS de ambiente](#urls-de-ambiente)
* [Equipo](#equipo)
* [Herramientas de gestión](#herramientas-de-gestión)



### Información del cliente

| Nombre               | Email             | Rol |
| ------------------ | ----------------- | ---- |
| Antonio Hernández | antonio.hernandez@mtycic.org | Coordinador de Formación de Capital Humano  |


### URLS de ambiente

* **Producción** - [Heroku](https://radiant-bayou-47421.herokuapp.com)
* **Desarrollo** - [Github](https://github.com/ProyectoIntegrador2018/i2t2-campe)

### Equipo

| Nombre           | Email             | Rol        |
| -------------- | ----------------- | ----------- |
| René Garcia | A00818137@itesm.mx | Backend Developer, Scrum Master |
| Eduardo Trujillo | A01187313@itesm.mx | Backend Developer, Product Owner Proxy|
| Luis Villarreal | A00818257@itesm.mx | Frontend Developer, Project Manager, Configuration Manager |


### Herramientas de gestión

* [Github repo](https://github.com/ProyectoIntegrador2018/i2t2-campe)
* [Backlog](https://github.com/ProyectoIntegrador2018/i2t2-campe/projects/1)
* [Heroku](https://radiant-bayou-47421.herokuapp.com)
* [Documentation](https://drive.google.com/drive/folders/1MvOa9Pe3SnPsSsFpNiZmLR7FRvaoJJ33?usp=sharing)

## Desarrollo

### Deployment
Para este proyecto se necesita tener [Docker](https://docker.com) instalado.

1. Clonar repositorio localmente.
```shell
$ git clone https://github.com/ProyectoIntegrador2018/i2t2-campe.git
```

2. Hacer build con docker-compose.
```shell
$ docker-compose build
```

3. Una vez que Docker haya hecho built.
```shell
$ docker-compose run web bash
```

El comando anterior abrirá un sesion bash dentro del contenedor de Docker, donde ahi se podrá interactuar la aplicación de rails.

4. Configurar la Base de Datos.

```shell
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

5. Ejecutar aplicación web
```shell
$ docker-compose up
```

6. Detener ejecución de aplicación web
```shell
$ docker-compose down
```
### Stack tecnológico
**Front End**
* Ruby on Rails

**Back End**
* Ruby on Rails

**Base de datos**
* PostgreSQL
