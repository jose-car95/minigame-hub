USE minigame_hub;

-- Representa el tipo de minijuego disponible.
CREATE TABLE games (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Esta tabla representa los jugadores, no su participación en una partida.
CREATE TABLE players (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(80) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Representa una partida concreta del juego.
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

-- Relaciona los jugadores que participan en cada partida.
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

-- Registra cada jugada realizada en una partida.
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
