# README

En esta aplicación se reciben a traves del endpoint /api/v1/gps 3 tipos de request:

* POST /api/v1/gps(:.format) para añadir un nuevo punto en el gps. A través de este metodo se crean vehiculos nuevos si el JSON incluye un identificador nuevo y válido.
* GET /api/v1/gps para obtener todos los puntos gps creados
* GET /api/v1/gps/:id para obtener el punto con ese id

Además, posee un endpoint /show en el cual se despliega un mapa de GoogleMaps. En este se muestran los últimos puntos añadidos para los vehiculos existentes.

También, se proveen unos cuantos tests para probar que los métodos funcionan correctamente. Pudiendo así, continuar el desarrollo de manera segura.

Existen dos clases Vehiculos y Gps. La relación de los modelos es uno a muchos. De esta manera, en la vista /show, solo se hace un corto request a Vehiculos para obtener la última posición de éstos y, al mismo tiempo, almacenando todas las posiciones históricas. 
