-- Users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Games Table
CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    lichess_game_id VARCHAR(255) UNIQUE NOT NULL,
    game_pgn TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Tactics Table
CREATE TABLE tactics (
    tactic_id SERIAL PRIMARY KEY,
    game_id INTEGER NOT NULL,
    start_position_fen VARCHAR(255) NOT NULL,
    blunder_move VARCHAR(255) NOT NULL,
    solution_moves VARCHAR(255) NOT NULL,
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);

