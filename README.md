# caribe_tour

Esta es una aplicación móvil para los turistas de la región caribe colombiana. Te permite seleccionar tus lugares favoritos y armar una ruta óptima entre estos lugares, puedes obtener rutas recomendadas con la ayuda de un chatbot, reseñar lugares y compartir tu experiencia en las redes sociales. Hecha con Flutter.

![alt text](https://github.com/johncerpa/caribe-tour-demo/blob/main/mapa.png?raw=true)
![alt text](https://github.com/johncerpa/caribe-tour-demo/blob/main/iphone_cards.png?raw=true)

## Para comenzar

Corre los siguientes comandos: cd caribe_tour & flutter run

## Tecnologías usadas:
- Autenticación de usuarios
- Base de datos: Firestore
- Map: Google Maps API
- Servicio de rutas: Google Directions Service
- Clima: OpenWeather API
- Chatbot: DialogFlow

## Acerca de la estructura de este proyecto
En este proyecto utilizamos Domain Driven Design para la arquitectura

El código está estructurado en 4 capas:
- Capa de presentación (Widgets, emición de eventos a BLoC)
- Capa de aplicación (Patrón BLoC para el manejo de estado, casos de uso, eventos -> estado)
- Capa de infraestructura (Implementación de servicios como Auth, Repositorios, etc.)
- Capa de dominio (Reglas de negocio, entidades, ValueObjects, interfaces para los servicios)

Cada capa está organizada por funcionalidad, por ejemplo: funcionalidada uth, funcionalidad de rutas, etc.

Usamos ValueObjects validados para hacer que estados erroneos no puedan ocurrir en la aplicación

NOTA: Existe un problema con el zoom del paquete `google_maps`, para un arreglo rápido hicimos lo siguiente:

Abrimos este archivo -> flutter/common/flutter/packages/flutter/lib/src/services/platform_views.dart

Comentamos "assert(downTiem != null)" en la clase AndroidMotionEvent
