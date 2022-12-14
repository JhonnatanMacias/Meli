# Meli


Aplicaci贸n Mobile para iOS 13+ que muestra informaci贸n de Items y su respectiva descripci贸n, igualmente se puede hacer una busqueda por palabras claves.

## Comenzando 馃殌

_Estas instrucciones te permitir谩n obtener una copia del proyecto en funcionamiento en tu m谩quina local para prop贸sitos de desarrollo y pruebas._



### Pre-requisitos 馃搵

_MackBook_

```
MacBook con Xcode
```

### Instalaci贸n 馃敡

_Descargar el proyecto de github_

```
Descargar el proyecto de github
Abrir la terminal con la ubicaci贸n del proyecto 
Los ultimos cambios estan en el brach _main_, ubicarse en este
y ejecutar el comando: pod install
Abrir el proyecto con Xcode y ejecutarlo.

```

### Funcionamiento 馃敡

_Los datos vienen del servicio [https://api.mercadolibre.com/sites/MLC/](https://api.mercadolibre.com/sites/MLC/search?)

```
Al iniciar el proyecto, se muestra la pantalla principal con un campo de busqueda,
al escribir palabra clave, se mostraran los resultados de esta, en una lista.

Se puede abrir cada item en detalle seleccionando

Al volver hacia la lista de items, se puede realizar otra busqueda



Igualmente se muestra un mensaje de error cuando ocurre uno.

```


## Construido con 馃洜锔?

_Menciona las herramientas que utilizaste para crear tu proyecto_

* [Xcode] - IDE 
* [CocoaPods] - Manejador de dependencias: permite automatizar la b煤squeda, descarga e integraci贸n de nuevas versiones
                 de librer铆as externas en el proyecto.
* [MVVM] - ViewModel es el componente principal de este patr贸n de arquitectura. ViewModel permite que la arquitectura 
         sea m谩s comprobable y elimina la complejidad de la vista. Permite una mayor capacidad de prueba de los estados de vista.
         Permite un mejor mantenimiento de la vista compleja.
* [Binding] - MVVM Bindings: El enlace MVVM juega un papel vital en el proyecto. La forma en que se comunica entre el modelo de vista   y el controlador de de vital importancia.
* [Alamofire] - usado para las peticiones a APIs: Las interacciones de las llamadas a la API (POST/GET/PUT/etc.) ser谩n m谩s f谩ciles y comprensibles. Alamofire simplifica una serie de tareas de red comunes que hacen que el desarrollo sea m谩s r谩pido y f谩cil.

## Autores 鉁掞笍

_Jhonnatan Macias_

* **Jhonnatan Macias** - *Trabajo Inicial* - [jhonnatanmacias](https://github.com/JhonnatanMacias)

