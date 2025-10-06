# Pokédex - Aplicación Flutter

Una aplicación móvil desarrollada en Flutter que permite explorar información sobre Pokémon utilizando la API pública de PokeAPI.

## Características

- **Lista de Pokémon**: Visualiza una lista paginada de Pokémon con sus imágenes y tipos
- **Detalles del Pokémon**: Información detallada incluyendo estadísticas, habilidades, altura y peso
- **Interfaz atractiva**: Diseño colorido con colores específicos para cada tipo de Pokémon
- **Navegación fluida**: Navegación intuitiva entre la lista y los detalles
- **Carga progresiva**: Sistema de paginación para cargar más Pokémon según sea necesario

## Estructura del Proyecto

```
lib/
├── main.dart                    # Punto de entrada de la aplicación
├── models/
│   ├── pokemon.dart            # Modelo de datos para Pokémon
│   └── pokemon.g.dart          # Archivo generado para serialización JSON
├── services/
│   └── poke_api_service.dart   # Servicio para comunicación con PokeAPI
├── screens/
│   ├── pokemon_list_screen.dart    # Pantalla principal con lista de Pokémon
│   └── pokemon_detail_screen.dart  # Pantalla de detalles del Pokémon
└── widgets/
    └── pokemon_card.dart       # Widget de tarjeta para mostrar Pokémon
```

## Dependencias

- **http**: Para realizar peticiones HTTP a la API
- **json_annotation**: Para anotaciones de serialización JSON
- **build_runner**: Para generar código automáticamente
- **json_serializable**: Para serialización automática de JSON

## Instalación y Configuración

### Prerrequisitos

- Flutter SDK (versión 3.35.4 o superior)
- Dart SDK
- Conexión a internet para acceder a PokeAPI

### Pasos de instalación

1. **Clonar o descargar el proyecto**
   ```bash
   # Si tienes el proyecto en un repositorio
   git clone <url-del-repositorio>
   cd pokeapp
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Generar archivos de serialización**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

## Uso de la Aplicación

### Pantalla Principal
- Al abrir la aplicación, verás una lista de Pokémon en formato de cuadrícula
- Cada tarjeta muestra:
  - Número de la Pokédex
  - Imagen del Pokémon
  - Nombre
  - Tipos (con colores específicos)

### Navegación
- Toca cualquier tarjeta de Pokémon para ver sus detalles
- Usa el botón "Cargar más Pokémon" para ver más Pokémon
- Usa el botón de retroceso para volver a la lista principal

### Pantalla de Detalles
La pantalla de detalles muestra:
- **Imagen grande** del Pokémon
- **Número de la Pokédex** y nombre
- **Tipos** con colores representativos
- **Información básica**: altura y peso
- **Estadísticas base**: HP, Ataque, Defensa, etc. con barras de progreso
- **Habilidades**: incluyendo habilidades ocultas

## API Utilizada

Esta aplicación utiliza [PokeAPI](https://pokeapi.co/), una API RESTful gratuita que proporciona datos completos sobre Pokémon.

### Endpoints utilizados:
- `GET /api/v2/pokemon?offset={offset}&limit={limit}` - Lista paginada de Pokémon
- `GET /api/v2/pokemon/{name}` - Detalles específicos de un Pokémon

## Características Técnicas

### Arquitectura
- **Separación de responsabilidades**: Modelos, servicios, pantallas y widgets en carpetas separadas
- **Gestión de estado**: Uso de StatefulWidget para manejo de estado local
- **Serialización JSON**: Automática usando json_serializable
- **Manejo de errores**: Captura y muestra de errores de red

### Diseño
- **Responsive**: Adaptable a diferentes tamaños de pantalla
- **Material Design**: Siguiendo las guías de diseño de Google
- **Colores temáticos**: Cada tipo de Pokémon tiene su color representativo
- **Imágenes optimizadas**: Carga eficiente de sprites desde PokeAPI

## Pruebas

Para ejecutar las pruebas:

```bash
flutter test
```

Las pruebas incluyen:
- Verificación de que la aplicación se inicia correctamente
- Comprobación de que se muestra el título "Pokédx"

## Posibles Mejoras Futuras

- **Búsqueda**: Implementar funcionalidad de búsqueda por nombre
- **Filtros**: Filtrar por tipo, generación, etc.
- **Favoritos**: Sistema para marcar Pokémon favoritos
- **Caché**: Almacenamiento local para uso offline
- **Animaciones**: Transiciones más fluidas entre pantallas
- **Sonidos**: Efectos de sonido temáticos

## Solución de Problemas

### Error de conexión
Si experimentas problemas de conexión:
1. Verifica tu conexión a internet
2. Asegúrate de que PokeAPI esté disponible en https://pokeapi.co/

### Problemas de compilación
Si hay errores de compilación:
1. Ejecuta `flutter clean`
2. Ejecuta `flutter pub get`
3. Regenera los archivos: `dart run build_runner build --delete-conflicting-outputs`

### Rendimiento lento
Si la aplicación es lenta:
1. Verifica tu conexión a internet
2. La primera carga puede ser más lenta debido a la descarga de imágenes

## Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

## Contribuciones

Las contribuciones son bienvenidas. Por favor:
1. Haz fork del proyecto
2. Crea una rama para tu feature
3. Commit tus cambios
4. Push a la rama
5. Abre un Pull Request

## Contacto

Para preguntas o sugerencias sobre este proyecto, puedes abrir un issue en el repositorio.
