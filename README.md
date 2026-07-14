# Api Automation Testing HerokuApp

**Autor:** Jean Piere Montalban Peña  
**Fecha:** 13 de julio de 2026

Este proyecto es un reto técnico desarrollado con el framework Karate para la automatización de pruebas de API sobre HerokuApp.

---

## API Automation Testing

Los endpoints automatizados son:
1. Auth – CreateToken
2. Booking – GetBooking
3. Booking – UpdateBooking

**API utilizada:**  
URL: https://restful-booker.herokuapp.com/apidoc/index.html

Para los escenarios de actualización se automatiza el endpoint **Auth – CreateToken**, ya que el token es requerido en el header `Cookie` con el formato `token=<valor>`. Los casos incluyen escenarios happy y unhappy con aserciones sobre status code, tiempos de respuesta y estructura de payload.

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
