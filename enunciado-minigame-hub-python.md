# 🕹️ MiniGame Hub — Ejercicio Full Stack en Python

> **Proyecto de aprendizaje:** desarrollo completo de una aplicación separada en **frontend**, **backend** y **base de datos**, empezando por un minijuego de **3 en raya**, pero preparada para crecer con más minijuegos en el futuro.

---

## 📌 Índice

1. [Contexto del ejercicio](#1-contexto-del-ejercicio)
2. [Objetivo general](#2-objetivo-general)
3. [Stack tecnológico propuesto](#3-stack-tecnológico-propuesto)
4. [Precondiciones de desarrollo](#4-precondiciones-de-desarrollo)
5. [Descripción funcional](#5-descripción-funcional)
6. [Arquitectura esperada](#6-arquitectura-esperada)
7. [Reglas de arquitectura](#7-reglas-de-arquitectura)
8. [Modelo de datos](#8-modelo-de-datos)
9. [Scripts de base de datos](#9-scripts-de-base-de-datos)
10. [Fase 1 — Comprender el problema](#10-fase-1--comprender-el-problema)
11. [Fase 2 — Diseño de datos](#11-fase-2--diseño-de-datos)
12. [Fase 3 — Backend base](#12-fase-3--backend-base)
13. [Fase 4 — Arquitectura por capas en backend](#13-fase-4--arquitectura-por-capas-en-backend)
14. [Fase 5 — Crear jugadores y partidas](#14-fase-5--crear-jugadores-y-partidas)
15. [Fase 6 — Implementar movimientos del 3 en raya](#15-fase-6--implementar-movimientos-del-3-en-raya)
16. [Fase 7 — Frontend con Streamlit](#16-fase-7--frontend-con-streamlit)
17. [Fase 8 — Historial de partidas](#17-fase-8--historial-de-partidas)
18. [Fase 9 — Preparar la app para más minijuegos](#18-fase-9--preparar-la-app-para-más-minijuegos)
19. [Fase 10 — Buenas prácticas finales](#19-fase-10--buenas-prácticas-finales)
20. [Flujo final esperado](#20-flujo-final-esperado)
21. [Endpoints finales esperados](#21-endpoints-finales-esperados)
22. [Requisitos no funcionales](#22-requisitos-no-funcionales)
23. [Criterios de evaluación](#23-criterios-de-evaluación)
24. [Orden recomendado de desarrollo](#24-orden-recomendado-de-desarrollo)
25. [Extensiones opcionales](#25-extensiones-opcionales)
26. [Entrega final esperada](#26-entrega-final-esperada)

---

# 1. Contexto del ejercicio

Vas a desarrollar una aplicación sencilla llamada **MiniGame Hub**, una plataforma básica de minijuegos.

El primer minijuego será **3 en raya**, pero la solución debe diseñarse para que en el futuro se puedan añadir otros juegos como:

- Ahorcado.
- Buscaminas.
- Memory.
- Piedra, papel o tijera.
- Conecta 4 simplificado.

El objetivo no es hacer una aplicación enorme, sino practicar una forma de desarrollo ordenada, realista y escalable.

La aplicación estará separada en tres partes:

```text
Frontend Python  →  Backend Python  →  Base de datos MySQL
```

---

# 2. Objetivo general

Construir una aplicación full stack simple, separada por responsabilidades, que permita:

- Ver una lista de minijuegos.
- Crear una partida de 3 en raya.
- Registrar dos jugadores.
- Jugar turnos alternos entre `X` y `O`.
- Validar movimientos.
- Detectar ganador.
- Detectar empate.
- Guardar partidas y movimientos en MySQL.
- Consultar un historial básico de partidas.
- Preparar la arquitectura para añadir más juegos.

---

# 3. Stack tecnológico propuesto

## 3.1. Backend

Se usará:

```text
Python + FastAPI
```

FastAPI es una opción muy adecuada para este ejercicio porque permite crear APIs REST de forma sencilla, limpia y profesional.

El backend será responsable de:

- Exponer endpoints HTTP.
- Validar datos recibidos desde el frontend.
- Ejecutar reglas de negocio.
- Coordinar operaciones.
- Acceder a la base de datos mediante repositorios.
- Devolver respuestas JSON.

---

## 3.2. Frontend

Se usará:

```text
Python + Streamlit
```

Streamlit permite crear interfaces web usando Python, sin necesidad de aprender todavía React, HTML, CSS o JavaScript.

El frontend será responsable de:

- Mostrar pantallas.
- Mostrar botones.
- Recoger acciones del usuario.
- Llamar al backend por HTTP.
- Mostrar respuestas del backend.
- Representar visualmente el tablero de 3 en raya.

---

## 3.3. Base de datos

Se usará:

```text
MySQL
```

Puedes usar una de estas opciones:

| Opción | Descripción |
|---|---|
| XAMPP | MySQL/MariaDB local con phpMyAdmin |
| MySQL local | Instalación directa en el equipo |
| MySQL remoto | Instancia en un servidor o VPS |

Para empezar, **XAMPP en local** es suficiente.

---

## 3.4. Herramientas recomendadas

- Python 3.11 o superior.
- MySQL 8 o MariaDB compatible.
- XAMPP, MySQL Workbench, DBeaver, DataGrip o phpMyAdmin.
- Postman, Insomnia o Thunder Client.
- Git.
- VS Code o PyCharm.
- Terminal o PowerShell.

---

# 4. Precondiciones de desarrollo

Antes de empezar, deberías tener instalado:

```text
Python 3.11+
pip
Git
MySQL o XAMPP
Un editor de código
Una herramienta para probar APIs
```

También deberías saber ejecutar comandos básicos como:

```bash
python --version
pip --version
git --version
```

Y deberías poder crear un entorno virtual:

```bash
python -m venv .venv
```

Activarlo en Windows:

```bash
.venv\Scripts\activate
```

Activarlo en Linux/macOS:

```bash
source .venv/bin/activate
```

---

# 5. Descripción funcional

La aplicación debe permitir:

1. Ver una lista de minijuegos disponibles.
2. Seleccionar el juego **3 en raya**.
3. Crear una nueva partida.
4. Introducir el nombre de dos jugadores.
5. Asignar automáticamente:
   - Jugador 1 → `X`
   - Jugador 2 → `O`
6. Mostrar un tablero de 3x3.
7. Permitir movimientos por turnos.
8. Validar si una casilla está ocupada.
9. Validar si el movimiento está dentro del tablero.
10. Detectar ganador.
11. Detectar empate.
12. Guardar partida y movimientos en MySQL.
13. Mostrar historial de partidas.

No hace falta implementar:

- Login.
- Contraseñas.
- Registro de usuarios real.
- Roles.
- Autenticación.
- Sistema online multiusuario en tiempo real.

---

# 6. Arquitectura esperada

La estructura recomendada del proyecto será:

```text
minigame-hub/
│
├── backend/
│   ├── app/
│   │   ├── api/
│   │   │   ├── health_controller.py
│   │   │   ├── game_controller.py
│   │   │   ├── match_controller.py
│   │   │   └── player_controller.py
│   │   │
│   │   ├── application/
│   │   │   ├── game_service.py
│   │   │   ├── match_service.py
│   │   │   └── tic_tac_toe_service.py
│   │   │
│   │   ├── domain/
│   │   │   ├── game_rules.py
│   │   │   ├── tic_tac_toe_rules.py
│   │   │   └── game_rules_factory.py
│   │   │
│   │   ├── infrastructure/
│   │   │   ├── database.py
│   │   │   ├── models.py
│   │   │   └── repositories/
│   │   │       ├── game_repository.py
│   │   │       ├── player_repository.py
│   │   │       ├── match_repository.py
│   │   │       └── move_repository.py
│   │   │
│   │   ├── schemas/
│   │   │   ├── game_schema.py
│   │   │   ├── match_schema.py
│   │   │   ├── player_schema.py
│   │   │   └── move_schema.py
│   │   │
│   │   ├── config.py
│   │   └── main.py
│   │
│   ├── .env.example
│   ├── requirements.txt
│   └── README.md
│
├── frontend/
│   ├── app.py
│   ├── api_client.py
│   ├── requirements.txt
│   └── README.md
│
├── database/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   └── 03_seed_data.sql
│
├── .gitignore
└── README.md
```

---

# 7. Reglas de arquitectura

## 7.1. El frontend no puede acceder directamente a MySQL

Incorrecto:

```text
Streamlit → MySQL
```

Correcto:

```text
Streamlit → FastAPI → MySQL
```

El frontend solo debe llamar al backend mediante HTTP.

---

## 7.2. El backend no debe tener toda la lógica en los controladores

Incorrecto:

```text
endpoint /move:
    validar movimiento
    calcular ganador
    guardar movimiento
    cambiar turno
    devolver respuesta
```

Correcto:

```text
endpoint /move:
    llama a MatchService
```

El controlador recibe la petición y delega.

---

## 7.3. La lógica del 3 en raya debe estar separada

No mezcles las reglas del juego con la base de datos.

Debe existir una clase o módulo dedicado a reglas:

```text
TicTacToeRules
```

Responsabilidades:

- Validar si una casilla está libre.
- Validar si el movimiento está dentro del tablero.
- Calcular si hay ganador.
- Calcular si hay empate.
- Calcular el siguiente turno.

---

## 7.4. La persistencia debe estar en repositorios

El acceso a MySQL debe estar encapsulado en repositorios.

Ejemplo conceptual:

```text
MatchRepository
MoveRepository
PlayerRepository
GameRepository
```

El resto de la aplicación no debería construir SQL directamente.

---

# 8. Modelo de datos

El sistema tendrá estas entidades principales:

```text
Game
Player
Match
MatchPlayer
Move
```

---

## 8.1. Game

Representa un minijuego disponible.

Ejemplos:

- 3 en raya.
- Ahorcado.
- Buscaminas.
- Memory.

Para este ejercicio solo implementarás 3 en raya, pero la tabla debe permitir añadir más juegos.

Campos sugeridos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | BIGINT | Identificador |
| code | VARCHAR | Código interno del juego |
| name | VARCHAR | Nombre visible |
| description | VARCHAR | Descripción |
| is_active | BOOLEAN | Si el juego está disponible |
| created_at | TIMESTAMP | Fecha de creación |

---

## 8.2. Player

Representa un jugador simple.

Campos sugeridos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | BIGINT | Identificador |
| nickname | VARCHAR | Nombre del jugador |
| created_at | TIMESTAMP | Fecha de creación |

No hay contraseña ni login.

---

## 8.3. Match

Representa una partida concreta.

Campos sugeridos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | BIGINT | Identificador |
| game_id | BIGINT | Juego al que pertenece |
| status | VARCHAR | Estado de la partida |
| current_turn | VARCHAR | Turno actual |
| winner_symbol | VARCHAR | Ganador, si existe |
| created_at | TIMESTAMP | Fecha de creación |
| updated_at | TIMESTAMP | Fecha de actualización |

Estados posibles:

```text
CREATED
IN_PROGRESS
FINISHED
DRAW
```

---

## 8.4. MatchPlayer

Relaciona jugadores con una partida.

Campos sugeridos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | BIGINT | Identificador |
| match_id | BIGINT | Partida |
| player_id | BIGINT | Jugador |
| symbol | VARCHAR | X u O |

Símbolos posibles:

```text
X
O
```

---

## 8.5. Move

Representa un movimiento realizado en una partida.

Campos sugeridos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | BIGINT | Identificador |
| match_id | BIGINT | Partida |
| player_id | BIGINT | Jugador |
| row_index | INT | Fila |
| col_index | INT | Columna |
| symbol | VARCHAR | X u O |
| move_number | INT | Número de movimiento |
| created_at | TIMESTAMP | Fecha del movimiento |

---

# 9. Scripts de base de datos

Debes crear los scripts SQL en la carpeta `database`.

---

## 9.1. Crear base de datos

Archivo:

```text
database/01_create_database.sql
```

Contenido esperado:

```sql
CREATE DATABASE IF NOT EXISTS minigame_hub
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE minigame_hub;
```

---

## 9.2. Crear tablas

Archivo:

```text
database/02_create_tables.sql
```

Contenido esperado:

```sql
USE minigame_hub;

CREATE TABLE games (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE players (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(80) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE matches (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    game_id BIGINT NOT NULL,
    status VARCHAR(30) NOT NULL,
    current_turn VARCHAR(1),
    winner_symbol VARCHAR(1),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_matches_games
        FOREIGN KEY (game_id) REFERENCES games(id)
);

CREATE TABLE match_players (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    match_id BIGINT NOT NULL,
    player_id BIGINT NOT NULL,
    symbol VARCHAR(1) NOT NULL,

    CONSTRAINT fk_match_players_matches
        FOREIGN KEY (match_id) REFERENCES matches(id),

    CONSTRAINT fk_match_players_players
        FOREIGN KEY (player_id) REFERENCES players(id),

    CONSTRAINT uq_match_symbol UNIQUE (match_id, symbol),
    CONSTRAINT uq_match_player UNIQUE (match_id, player_id)
);

CREATE TABLE moves (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    match_id BIGINT NOT NULL,
    player_id BIGINT NOT NULL,
    row_index INT NOT NULL,
    col_index INT NOT NULL,
    symbol VARCHAR(1) NOT NULL,
    move_number INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_moves_matches
        FOREIGN KEY (match_id) REFERENCES matches(id),

    CONSTRAINT fk_moves_players
        FOREIGN KEY (player_id) REFERENCES players(id),

    CONSTRAINT uq_match_cell UNIQUE (match_id, row_index, col_index),
    CONSTRAINT uq_match_move_number UNIQUE (match_id, move_number)
);
```

---

## 9.3. Datos iniciales

Archivo:

```text
database/03_seed_data.sql
```

Contenido esperado:

```sql
USE minigame_hub;

INSERT INTO games (code, name, description, is_active)
VALUES
('tic_tac_toe', '3 en raya', 'Juego clásico de X contra O en tablero de 3x3.', TRUE);
```

---

# 10. Fase 1 — Comprender el problema

## Objetivo

Antes de programar, debes escribir en `README.md` una explicación breve de qué vas a construir.

Debe incluir:

- Nombre del proyecto.
- Objetivo.
- Partes principales.
- Flujo general.
- Tecnologías.
- Qué problema resuelve.

---

## Prompt de aprendizaje

```text
Explícame de forma sencilla qué es una aplicación full stack separada en frontend, backend y base de datos. Usa como ejemplo una app de minijuegos donde el primer juego es 3 en raya. Quiero entender qué responsabilidad tiene cada parte y por qué no debería mezclarlo todo en un único archivo.
```

---

## Definition of Done

La fase estará terminada cuando:

- Existe un README inicial.
- Entiendes qué hace frontend, backend y base de datos.
- Puedes explicar el flujo `Streamlit → FastAPI → MySQL`.

---

# 11. Fase 2 — Diseño de datos

## Objetivo

Diseñar la base de datos antes de escribir backend.

---

## Tareas

- Crear base de datos `minigame_hub`.
- Crear tabla `games`.
- Crear tabla `players`.
- Crear tabla `matches`.
- Crear tabla `match_players`.
- Crear tabla `moves`.
- Insertar el juego `tic_tac_toe`.
- Probar las tablas en MySQL.

---

## Prompt de aprendizaje

```text
Explícame qué es una base de datos relacional usando como ejemplo una app de minijuegos. Quiero entender qué son tablas, columnas, claves primarias, claves foráneas, relaciones 1:N y N:M. Usa las tablas games, players, matches, match_players y moves.
```

---

## Prompt sobre relacional vs no relacional

```text
Explícame la diferencia entre bases de datos relacionales y no relacionales. Usa como ejemplo guardar partidas de 3 en raya. ¿Por qué MySQL encaja bien para este ejercicio? ¿Cuándo tendría sentido usar MongoDB u otra base de datos documental?
```

---

## Definition of Done

- La base de datos existe.
- Las tablas se crean sin errores.
- Hay un registro en `games` para 3 en raya.
- Puedes ver las tablas desde XAMPP, MySQL Workbench, DBeaver o consola.

---

# 12. Fase 3 — Backend base

## Objetivo

Crear un backend FastAPI capaz de arrancar y conectarse a MySQL.

---

## Estructura sugerida

```text
backend/
├── app/
│   ├── main.py
│   ├── config.py
│   ├── api/
│   ├── domain/
│   ├── application/
│   └── infrastructure/
└── requirements.txt
```

---

## Dependencias sugeridas

```text
fastapi
uvicorn
pydantic
sqlalchemy
pymysql
python-dotenv
```

---

## Endpoints mínimos iniciales

```text
GET /health
GET /api/games
```

---

## Ejemplo de respuesta para `/health`

```json
{
  "status": "ok",
  "service": "minigame-hub-backend"
}
```

---

## Ejemplo de respuesta para `/api/games`

```json
[
  {
    "id": 1,
    "code": "tic_tac_toe",
    "name": "3 en raya",
    "description": "Juego clásico de X contra O en tablero de 3x3."
  }
]
```

---

## Prompt de aprendizaje

```text
Explícame qué es un backend y qué es una API REST. Usa FastAPI como ejemplo. Quiero entender qué es un endpoint, qué son GET y POST, qué es JSON y por qué el frontend no debería consultar directamente la base de datos.
```

---

## Definition of Done

- El backend arranca con `uvicorn`.
- `GET /health` responde correctamente.
- `GET /api/games` devuelve el juego 3 en raya desde MySQL.
- La conexión a base de datos no está escrita dentro del controlador.

---

# 13. Fase 4 — Arquitectura por capas en backend

## Objetivo

Reorganizar el backend para separar responsabilidades.

---

## Capas esperadas

```text
api
application
domain
infrastructure
```

---

## Responsabilidad de cada capa

### api

Contiene los controladores FastAPI.

Ejemplos:

- `GameController`
- `MatchController`
- `MoveController`

Su función es recibir peticiones HTTP y devolver respuestas.

---

### application

Contiene casos de uso o servicios.

Ejemplos:

- `GameService`
- `MatchService`
- `TicTacToeService`

Su función es coordinar la lógica de aplicación.

---

### domain

Contiene reglas puras del negocio.

Ejemplo:

- `TicTacToeRules`

Su función es saber cómo funciona el 3 en raya, sin importar HTTP ni MySQL.

---

### infrastructure

Contiene detalles técnicos.

Ejemplos:

- Modelos SQLAlchemy.
- Repositorios.
- Conexión a base de datos.
- Configuración técnica.

Su función es hablar con MySQL y con servicios externos.

---

## Prompt de aprendizaje

```text
Explícame qué es la arquitectura por capas en backend. Usa como ejemplo FastAPI, un juego de 3 en raya y MySQL. Quiero entender las capas api, application, domain e infrastructure, y qué código debería vivir en cada una.
```

---

## Definition of Done

- Los endpoints no tienen SQL directo.
- La lógica del 3 en raya no está en los endpoints.
- El acceso a MySQL está encapsulado en repositorios.
- Existe una separación clara entre `api`, `application`, `domain` e `infrastructure`.

---

# 14. Fase 5 — Crear jugadores y partidas

## Objetivo

Implementar la creación de jugadores y partidas.

---

## Endpoints necesarios

```text
POST /api/players
POST /api/matches
GET /api/matches/{match_id}
```

---

## Crear jugador

Request:

```json
{
  "nickname": "Mario"
}
```

Response:

```json
{
  "id": 1,
  "nickname": "Mario"
}
```

---

## Crear partida

Request:

```json
{
  "game_code": "tic_tac_toe",
  "player_x_name": "Mario",
  "player_o_name": "Lucia"
}
```

Response:

```json
{
  "id": 1,
  "game": "tic_tac_toe",
  "status": "IN_PROGRESS",
  "current_turn": "X",
  "players": [
    {
      "id": 1,
      "nickname": "Mario",
      "symbol": "X"
    },
    {
      "id": 2,
      "nickname": "Lucia",
      "symbol": "O"
    }
  ],
  "board": [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""]
  ]
}
```

---

## Prompt de aprendizaje

```text
Explícame qué es un caso de uso en una aplicación backend. Usa como ejemplo crear una partida de 3 en raya con dos jugadores. Quiero entender por qué esta lógica debería estar en un servicio de aplicación y no directamente en el controlador FastAPI.
```

---

## Definition of Done

- Puedes crear jugadores.
- Puedes crear una partida de 3 en raya.
- La partida se guarda en MySQL.
- Los jugadores quedan asociados a la partida con símbolo `X` y `O`.
- Al consultar la partida aparece el tablero vacío.

---

# 15. Fase 6 — Implementar movimientos del 3 en raya

## Objetivo

Permitir jugar una partida completa.

---

## Endpoint necesario

```text
POST /api/matches/{match_id}/moves
```

---

## Request

```json
{
  "player_id": 1,
  "row": 0,
  "col": 2
}
```

---

## Response

```json
{
  "match_id": 1,
  "status": "IN_PROGRESS",
  "current_turn": "O",
  "winner_symbol": null,
  "board": [
    ["", "", "X"],
    ["", "", ""],
    ["", "", ""]
  ]
}
```

---

## Reglas obligatorias

El backend debe validar:

- La partida existe.
- La partida está en curso.
- El jugador pertenece a la partida.
- Es el turno del jugador.
- La fila está entre `0` y `2`.
- La columna está entre `0` y `2`.
- La casilla está libre.
- No se puede jugar después de terminar.
- Después de cada movimiento se comprueba ganador.
- Si no hay ganador y el tablero está lleno, se marca empate.

---

## Prompt de aprendizaje

```text
Explícame cómo modelar las reglas del 3 en raya como lógica de dominio. Quiero separar las reglas puras del juego de FastAPI y de MySQL. Dame una explicación conceptual de una clase TicTacToeRules y qué métodos debería tener.
```

---

## Definition of Done

- Puedes realizar movimientos válidos.
- No puedes mover en una casilla ocupada.
- No puedes mover fuera del tablero.
- No puedes mover si no es tu turno.
- El sistema detecta ganador.
- El sistema detecta empate.
- Todos los movimientos quedan guardados en MySQL.

---

# 16. Fase 7 — Frontend con Streamlit

## Objetivo

Crear una interfaz sencilla separada del backend.

---

## Estructura sugerida

```text
frontend/
├── app.py
├── api_client.py
└── requirements.txt
```

---

## Responsabilidades

### app.py

Contiene la interfaz:

- Título de la app.
- Listado de juegos.
- Formulario para crear partida.
- Tablero visual.
- Botones para jugar.
- Historial básico.

---

### api_client.py

Contiene las llamadas HTTP al backend:

```text
get_games()
create_match()
get_match(match_id)
make_move(match_id, player_id, row, col)
```

---

## Pantallas mínimas

No hace falta usar routing complejo. Puede ser una sola pantalla con secciones:

1. Juegos disponibles.
2. Crear nueva partida.
3. Partida actual.
4. Historial básico.

---

## Prompt de aprendizaje

```text
Explícame qué es un frontend y qué responsabilidad tiene en una arquitectura separada. Usa Streamlit como ejemplo. Quiero entender por qué el frontend debería llamar a la API del backend en vez de conectarse directamente a MySQL.
```

---

## Definition of Done

- Streamlit arranca en un puerto distinto al backend.
- El frontend muestra el juego 3 en raya usando la API.
- Puedes crear una partida desde la interfaz.
- Puedes jugar haciendo click en botones del tablero.
- El frontend no tiene conexión directa a MySQL.

---

# 17. Fase 8 — Historial de partidas

## Objetivo

Añadir una vista simple de partidas jugadas.

---

## Endpoint sugerido

```text
GET /api/matches
```

---

## Response esperada

```json
[
  {
    "id": 1,
    "game": "3 en raya",
    "status": "FINISHED",
    "winner_symbol": "X",
    "created_at": "2026-05-25T12:00:00"
  },
  {
    "id": 2,
    "game": "3 en raya",
    "status": "DRAW",
    "winner_symbol": null,
    "created_at": "2026-05-25T12:15:00"
  }
]
```

---

## Frontend

Añade una tabla con:

- ID partida.
- Juego.
- Estado.
- Ganador.
- Fecha.

---

## Prompt de aprendizaje

```text
Explícame cómo se diseña un endpoint de listado en una API REST. Usa como ejemplo listar partidas de una app de minijuegos. Quiero entender paginación básica, ordenación, filtros y por qué no siempre conviene devolver todos los datos de golpe.
```

---

## Definition of Done

- El backend lista partidas.
- El frontend muestra historial.
- El historial se obtiene desde MySQL a través del backend.

---

# 18. Fase 9 — Preparar la app para más minijuegos

## Objetivo

Refactorizar lo mínimo para que añadir otro juego en el futuro sea viable.

No tienes que implementar otro juego todavía. Solo preparar la arquitectura.

---

## Patrón recomendado: Strategy

Crea una abstracción conceptual:

```text
GameRules
```

Y una implementación:

```text
TicTacToeRules
```

La idea es que en el futuro puedas tener:

```text
HangmanRules
MemoryRules
MinesweeperRules
```

---

## Patrón recomendado: Factory

Puedes crear una fábrica sencilla:

```text
GameRulesFactory
```

Su responsabilidad será devolver las reglas adecuadas según el `game_code`.

Ejemplo conceptual:

```text
game_code = "tic_tac_toe"
rules = GameRulesFactory.get_rules(game_code)
```

---

## Prompt de aprendizaje

```text
Explícame el patrón Strategy y el patrón Factory usando una app de minijuegos. Quiero entender cómo podría tener TicTacToeRules ahora y añadir HangmanRules más adelante sin reescribir todo el backend.
```

---

## Definition of Done

- Existe una separación clara entre `MatchService` y `TicTacToeRules`.
- Existe una forma razonable de resolver reglas por `game_code`.
- El código permite imaginar añadir otro juego sin tocar todo el sistema.

---

# 19. Fase 10 — Buenas prácticas finales

## Objetivo

Dejar el proyecto limpio y fácil de entender.

---

## Tareas

- Añadir README principal.
- Añadir README en backend.
- Añadir README en frontend.
- Añadir archivo `.env.example`.
- Añadir instrucciones de ejecución.
- Añadir capturas opcionales.
- Añadir listado de endpoints.
- Añadir explicación breve de arquitectura.
- Añadir comentarios solo donde aporten claridad.
- Eliminar código muerto.
- Revisar nombres.
- Revisar errores.
- Revisar validaciones.

---

## Prompt de aprendizaje

```text
Explícame qué buenas prácticas debería aplicar en un proyecto pequeño de Python con FastAPI, Streamlit y MySQL. Quiero una checklist de estructura, nombres, configuración, errores, validaciones, documentación y separación de responsabilidades.
```

---

## Definition of Done

- El proyecto arranca siguiendo el README.
- La base de datos se puede crear desde scripts.
- El backend se puede probar con Postman.
- El frontend se puede usar desde navegador.
- La arquitectura está documentada.
- El código está separado por responsabilidades.

---

# 20. Flujo final esperado

Al terminar, el flujo debería ser este:

```text
Usuario abre Streamlit
        ↓
Streamlit pide juegos a FastAPI
        ↓
FastAPI consulta MySQL
        ↓
Streamlit muestra "3 en raya"
        ↓
Usuario crea partida
        ↓
FastAPI crea jugadores, partida y relación entre ambos
        ↓
Usuario pulsa una casilla
        ↓
FastAPI valida reglas del juego
        ↓
FastAPI guarda movimiento en MySQL
        ↓
FastAPI devuelve tablero actualizado
        ↓
Streamlit actualiza la pantalla
```

---

# 21. Endpoints finales esperados

```text
GET  /health
GET  /api/games
POST /api/players
POST /api/matches
GET  /api/matches
GET  /api/matches/{match_id}
POST /api/matches/{match_id}/moves
```

---

# 22. Requisitos no funcionales

La aplicación debe cumplir:

- Código legible.
- Separación frontend/backend/base de datos.
- Sin autenticación.
- Sin acceso directo del frontend a MySQL.
- Validaciones en backend.
- Errores claros.
- README suficiente para ejecutar.
- Base de datos creada por scripts.
- Arquitectura preparada para crecer.
- Nombres consistentes.
- Configuración por `.env`.
- Código organizado por responsabilidad.

---

# 23. Criterios de evaluación

| Área | Criterio |
|---|---|
| Base de datos | Tablas correctamente relacionadas |
| Base de datos | Claves primarias y foráneas bien definidas |
| Backend | FastAPI arranca correctamente |
| Backend | Endpoints REST claros |
| Backend | No hay SQL en controladores |
| Backend | Repositorios separados |
| Backend | Servicios de aplicación separados |
| Backend | Reglas del 3 en raya aisladas |
| Frontend | Streamlit consume la API |
| Frontend | No conecta directamente a MySQL |
| Juego | Turnos correctos |
| Juego | Ganador correcto |
| Juego | Empate correcto |
| Juego | Movimientos inválidos bloqueados |
| Escalabilidad | Hay base para añadir más juegos |
| Documentación | README claro |

---

# 24. Orden recomendado de desarrollo

Sigue este orden:

1. Crear README inicial.
2. Crear scripts de base de datos.
3. Probar MySQL.
4. Crear backend mínimo con `/health`.
5. Conectar backend con MySQL.
6. Implementar `GET /api/games`.
7. Crear jugadores.
8. Crear partidas.
9. Consultar partida.
10. Implementar reglas del 3 en raya.
11. Implementar movimientos.
12. Probar backend completo con Postman.
13. Crear frontend Streamlit.
14. Conectar frontend con backend.
15. Mostrar tablero.
16. Permitir jugar desde la UI.
17. Añadir historial.
18. Refactorizar con Strategy/Factory.
19. Documentar.
20. Hacer revisión final.

---

# 25. Extensiones opcionales

Cuando termines la versión básica, puedes ampliar con:

- Ranking de jugadores.
- Número de victorias por jugador.
- Revancha.
- Modo jugador contra CPU.
- Segundo minijuego: Ahorcado.
- Docker Compose para MySQL + backend + frontend.
- Tests unitarios para `TicTacToeRules`.
- Tests de integración para endpoints.
- Paginación de historial.
- Filtros por estado de partida.
- Mejoras visuales en Streamlit.
- Exportar historial a CSV.

---

# 26. Entrega final esperada

Al final deberías tener una aplicación ejecutable con:

- MySQL funcionando.
- Backend FastAPI funcionando.
- Frontend Streamlit funcionando.
- 3 en raya jugable.
- Partidas guardadas.
- Historial visible.
- Código organizado por capas.
- Documentación suficiente.

La versión mínima aceptable no tiene que ser visualmente espectacular. Tiene que ser:

```text
clara
funcional
separada
validada
documentada
ampliable
```

---

## ✅ Resumen final

Este ejercicio está pensado para aprender haciendo.

No se trata solo de programar un 3 en raya. Se trata de entender cómo se construye una aplicación full stack real, separando:

```text
Interfaz de usuario
Lógica de aplicación
Reglas de dominio
Persistencia de datos
Base de datos
```

Si completas este proyecto correctamente, tendrás una base muy buena para pasar después a aplicaciones más profesionales con:

- React.
- FastAPI avanzado.
- Spring Boot.
- Docker.
- PostgreSQL.
- Autenticación.
- Microservicios.
- Despliegue cloud.
