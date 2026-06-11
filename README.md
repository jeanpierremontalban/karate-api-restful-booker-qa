# Api Automation Testing HerokuApp

**Autor:** Jean Piere Montalban Peña  
**Fecha:** 11 de junio de 2026

Este proyecto es un reto técnico desarrollado con el framework Karate para la automatización de pruebas de API sobre HerokuApp.

---

## API Automation Testing

Los endpoints automatizados son:
1. CreateBooking
2. GetBooking
3. UpdateBooking

**API utilizada:**  
URL: https://restful-booker.herokuapp.com/apidoc/index.html

Para el tercer escenario se automatiza el endpoint **Auth – Create Token**, ya que el token es requerido en el header `Cookie` con el formato `token=<valor>`.

---

## Tabla de Contenidos
- [Introducción](#introducción)
- [Testing API con Karate](#testing-api-con-karate)
- [Prerrequisitos](#prerrequisitos)
- [Ejecutar las pruebas localmente](#ejecutar-las-pruebas-localmente)

---

## Introducción

En este proyecto se aplican los casos de prueba más comunes con el framework Karate.  
Se utiliza la API de https://restful-booker.herokuapp.com/apidoc/index.html, que expone endpoints para operaciones GET, PUT, POST y DELETE.

---

## Testing API con Karate

**Karate** es la única herramienta open-source que combina automatización de pruebas de API, mocks, pruebas de rendimiento y automatización de UI en un único framework. La sintaxis BDD inspirada en Cucumber es neutral al lenguaje y accesible para no programadores. Incluye aserciones poderosas para JSON y XML, y permite ejecutar pruebas en paralelo.

https://github.com/intuit/karate

---

## Prerrequisitos

El proyecto está desarrollado en Java con Gradle. Se requiere instalar:

- [Oracle Java 8 SDK](https://java.oracle.com)
- [Gradle](https://gradle.org/)
- IDE recomendado: [IntelliJ IDEA](http://www.jetbrains.com)

Configuración para ejecutar features/escenarios en IntelliJ:

```
[Run configuration - Cucumber Java]
    Main class: com.intuit.karate.cli.Main
    Glue: com.intuit.karate
```

---

## Ejecutar las pruebas localmente

Desde la carpeta raíz del proyecto, ejecutar:

```bash
gradle clean test
```

O para ejecutar el runner en paralelo:

```bash
gradle clean test --tests features.parallel.Runner.Runner
```
