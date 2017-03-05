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
