# MiniGame Hub

MiniGame Hub es una aplicacion full stack de minijuegos desarrollada con Python.
La primera version permitira jugar partidas de 3 en raya entre dos jugadores y
consultar el historial de partidas.

## Objetivo

El objetivo del proyecto es aprender como se construye una aplicacion separando
correctamente:

- La interfaz que utiliza el usuario.
- La logica del backend.
- Las reglas propias del juego.
- El almacenamiento permanente de datos.

## Funcionalidades Iniciales

- Consultar los juegos disponibles.
- Crear una partida de 3 en raya.
- Registrar dos jugadores para una partida.
- Realizar movimientos alternos con `X` y `O`.
- Detectar movimientos invalidos, ganador o empate.
- Guardar partidas y movimientos.
- Consultar un historial basico.

## Tecnologias

- **Frontend:** Streamlit.
- **Backend:** FastAPI.
- **Base de datos:** MySQL.
- **Lenguaje principal:** Python.

## Arquitectura General

La aplicacion estara dividida en tres partes principales:

```text
Usuario -> Streamlit -> FastAPI -> MySQL
```

- **Streamlit** mostrara la interfaz y enviara las acciones del usuario al
  backend.
- **FastAPI** recibira las peticiones, aplicara validaciones y reglas de
  negocio, y consultara o modificara los datos.
- **MySQL** almacenara juegos, jugadores, partidas y movimientos.

El frontend no accedera directamente a la base de datos. Todas las operaciones
pasaran por el backend.

## Primer Minijuego

El primer juego implementado sera **3 en raya**. La arquitectura estara
preparada para anadir nuevos minijuegos en el futuro sin tener que rehacer toda
la aplicacion.
