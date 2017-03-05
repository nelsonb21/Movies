# Movies

## Capas de la aplicación

### Persistencia 

MovieStore: Contiene los metodos encargados de la gestion (guardar, actualizar, eliminar) de los datos locales.

### Vistas 

MoviesViewController: Se encarga de presentar la vista principal con el listado de las peliculas.
MoviesDetailViewController: Se encarga de presentar el detalle de la pelicula seleccionada.

MoviesCollectionViewCell: Se encarga de presentar el contenido de cada celda en la vista principal.

MovieDetailInformationTableViewCell: Se encarga de presentar la información de la pelicula.
MovieDetailVideoTableViewCell: Se encarga de presentar los videos correspondientes a la pelicula.

### Red 

APIConfig: Se cuentran las url bases del API.

APIQuery: Contiene los headers del API en caso que sean necesarios y se definieron metodos que retornan el tipo de request y la url.

MovieRouter: Dependiendo del request que se desea realizar, se retorna un URLResquest para ser utilizado en MovieController.

MovieController: Realiza el request al API de las opciones referentes a Movies. Además se maneja los datos locales de Movies.

VideoRouter: Dependiendo del request que se desea realizar, se retorna un URLResquest para ser utilizado en VideoController.

VideoController: Realiza el request al API para obtener los videos de una pelicula indicada.

### Negocio

Movie: Representa el objeto de las peliculas que se mostraran en la app. 

Video: Representa el objeto de los videos de cada pelicula.

## En qué consiste el principio de responsabilidad única? Cuál es su propósito?

Básicamente consiste en que cada clase que se cree debe tener una unica funcionalidad. Es decir, si tengo una clase que se encarga de mostrar el contenido de una vista, lo ideal es tener las funciones encargadas de los request en una clase o estructura diferente.

## Qué características tiene, según su opinión, un “buen” código o código limpio

  Evitar el codigo repetitivo.
  Evitar tener clases demasiado grandes.
  El código debe ser fácil de entender.
  Nombrar correctamente las variables y funciones. Evitar nombres sin sentido como X o Y.
  Mantener la identación durante todo el código.
  Evitar escribir funciones grandes.
  Documentar las secciones del código y las funciones que lo requieran.
  
