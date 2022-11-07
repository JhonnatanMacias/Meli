# Meli


Aplicación Mobile para iOS 13+ que muestra información de Items y su respectiva descripción, igualmente se puede hacer una busqueda por palabras claves.

## Comenzando 🚀

_Estas instrucciones te permitirán obtener una copia del proyecto en funcionamiento en tu máquina local para propósitos de desarrollo y pruebas._



### Pre-requisitos 📋

_MackBook_

```
MacBook con Xcode
```

### Instalación 🔧

_Descargar el proyecto de github_

```
Descargar el proyecto de github
Abrir la terminal con la ubicación del proyecto 
Los ultimos cambios estan en el brach _main_, ubicarse en este
y ejecutar el comando: pod install
Abrir el proyecto con Xcode y ejecutarlo.

```

### Funcionamiento 🔧

_Los datos vienen del servicio [https://api.mercadolibre.com/sites/MLC/](https://api.mercadolibre.com/sites/MLC/search?)

```
Al iniciar el proyecto, se muestra la pantalla principal con un campo de busqueda,
al escribir palabra clave, se mostraran los resultados de esta, en una lista.

Se puede abrir cada item en detalle seleccionando

Al volver hacia la lista de items, se puede realizar otra busqueda



Igualmente se muestra un mensaje de error cuando ocurre uno.

```


## Construido con 🛠️

_Menciona las herramientas que utilizaste para crear tu proyecto_

* [Xcode] - IDE 
* [CocoaPods] - Manejador de dependencias: permite automatizar la búsqueda, descarga e integración de nuevas versiones
                 de librerías externas en el proyecto.
* [MVVM] - ViewModel es el componente principal de este patrón de arquitectura. ViewModel permite que la arquitectura 
         sea más comprobable y elimina la complejidad de la vista. Permite una mayor capacidad de prueba de los estados de vista.
         Permite un mejor mantenimiento de la vista compleja.
* [Binding] - MVVM Bindings: El enlace MVVM juega un papel vital en el proyecto. La forma en que se comunica entre el modelo de vista   y el controlador de de vital importancia.
* [Alamofire] - usado para las peticiones a APIs: Las interacciones de las llamadas a la API (POST/GET/PUT/etc.) serán más fáciles y comprensibles. Alamofire simplifica una serie de tareas de red comunes que hacen que el desarrollo sea más rápido y fácil.

## Autores ✒️

_Jhonnatan Macias_

* **Jhonnatan Macias** - *Trabajo Inicial* - [jhonnatanmacias](https://github.com/JhonnatanMacias)

