# DnD Skill Bar — Flutter (Android + iOS)

Port de la app Android (Kotlin/Compose) a Flutter, para poder compilar
también para iOS desde el mismo código. Escrito sin poder compilar en este
entorno (no hay Flutter/Dart SDK disponible acá), así que puede necesitar
algún ajuste chico cuando lo corras — pedime el error tal cual y lo
resolvemos, igual que hicimos con la versión Android.

## Qué incluye

- **Datos**: los mismos 342 hechizos, 97 subclases, 32 razas, 42 dotes,
  13 trasfondos, estilos de combate y maniobras que la versión Android
  (`lib/data/`).
- **Modelos**: personaje, hechizo conocido, arma, características (`lib/models/`).
- **Provider** (`lib/providers/character_provider.dart`): equivalente al
  `CharacterViewModel` de Android — mismas funciones (descansos, gastar
  recursos, PV, metamagia, maniobras, etc.).
- **Almacenamiento local** con `hive` (`lib/storage/`) — más liviano que
  SQLite para este caso, funciona igual en Android e iOS.
- **Pantallas** (`lib/ui/screens/`): lista de personajes, formulario
  crear/editar, y la barra de habilidades principal.
- **Componentes** (`lib/ui/widgets/`): barra de PV/CA, ataques, salvaciones,
  habilidades, espacios de conjuro, rasgos raciales, etc. — mismos que Android.

## Cómo levantarlo

Necesitás tener [Flutter instalado](https://docs.flutter.dev/get-started/install)
(el instalador te deja Dart incluido).

1. Descomprimí este zip.
2. Abrí una terminal en la carpeta `dndbar_flutter/` y corré:
   ```
   flutter create --platforms=android,ios .
   ```
   Esto genera las carpetas `android/` e `ios/` con todo el proyecto nativo
   necesario para compilar — **no vienen incluidas en este zip** porque son
   auto-generadas y específicas de la versión de Flutter que tengas instalada.
   Ojo: este comando no debe tocar tu carpeta `lib/` ni `pubspec.yaml`
   existentes (si te pregunta si sobreescribir algo de `lib/`, decile que no).
3. Instalá las dependencias:
   ```
   flutter pub get
   ```
4. Para correr en Android (con un emulador abierto o celu conectado):
   ```
   flutter run
   ```
5. Para compilar el APK de Android:
   ```
   flutter build apk --debug
   ```
   Te lo deja en `build/app/outputs/flutter-apk/app-debug.apk`.

## Para iOS específicamente

Esto **requiere una Mac** con Xcode instalado (o un servicio de compilación
en la nube como Codemagic, si no tenés Mac — ver el mensaje anterior donde
lo charlamos). Con una Mac:

```
flutter build ios --debug
```

Después abrís `ios/Runner.xcworkspace` en Xcode para firmarlo con tu Apple
ID e instalarlo en un iPhone conectado por cable (con cuenta gratis, dura
7 días; con Apple Developer Program pago, permanente).

## Qué falta / posibles ajustes

- **No pude compilarlo yo mismo** — es posible que aparezca algún error de
  sintaxis Dart chico al correr `flutter analyze` o `flutter run` la primera
  vez. Mandame el mensaje de error tal cual y lo arreglamos.
- **Iconos/nombre de la app**: Flutter pone un ícono genérico al generar
  `android/` e `ios/` con `flutter create`. Se puede personalizar después.
- **Verificar que `flutter pub get` baje bien `hive`/`hive_flutter`/`provider`/
  `path_provider`/`uuid`** (dependencias declaradas en `pubspec.yaml`).
