-- Crea il database
CREATE DATABASE registro_orari;
\c registro_orari;

-- Crea la tabella dei ruoli
CREATE TABLE ruoli (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL
);

-- Crea la tabella per i dipendenti
CREATE TABLE dipendenti (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    posizione VARCHAR(50)
);

-- Crea la tabella degli utenti (con credenziali per il login)
CREATE TABLE utenti (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,  -- La password dovrebbe essere memorizzata in forma hash
    dipendente_id INT NOT NULL,
    ruolo_id INT NOT NULL,
    CONSTRAINT fk_dipendente FOREIGN KEY (dipendente_id) REFERENCES dipendenti(id) ON DELETE CASCADE,
    CONSTRAINT fk_ruolo FOREIGN KEY (ruolo_id) REFERENCES ruoli(id) ON DELETE SET NULL
);

-- Crea la tabella per registrare gli orari di ingresso e uscita
CREATE TABLE orari_lavoro (
    id SERIAL PRIMARY KEY,
    dipendente_id INT NOT NULL,
    data DATE NOT NULL,
    orario_ingresso TIMESTAMP NOT NULL,
    orario_uscita TIMESTAMP,
    note TEXT,
    CONSTRAINT fk_dipendente_orario FOREIGN KEY (dipendente_id) REFERENCES dipendenti(id) ON DELETE CASCADE
);

-- Crea la tabella per registrare le pause durante gli orari di lavoro
CREATE TABLE pause (
    id SERIAL PRIMARY KEY,
    orario_lavoro_id INT NOT NULL,
    orario_inizio TIMESTAMP NOT NULL,
    orario_fine TIMESTAMP,
    CONSTRAINT fk_orario_lavoro FOREIGN KEY (orario_lavoro_id) REFERENCES orari_lavoro(id) ON DELETE CASCADE
);

-- Inserisci i ruoli di esempio
INSERT INTO ruoli (nome) VALUES
('ADMIN'),
('USER');

-- Inserisci alcuni dipendenti di esempio
INSERT INTO dipendenti (nome, cognome, email, posizione) VALUES
('Mario', 'Rossi', 'mario.rossi@example.com', 'Sviluppatore'),
('Lucia', 'Bianchi', 'lucia.bianchi@example.com', 'Designer'),
('Marco', 'Verdi', 'marco.verdi@example.com', 'Project Manager');

-- Inserisci utenti di esempio con ruolo e dipendente associati
-- NOTA: la password dovrebbe essere hashata (qui per esempio, la password è "password123" hashata con bcrypt)
INSERT INTO utenti (username, password, dipendente_id, ruolo_id) VALUES
('mario.rossi', '$2a$10$VjVoiNC1mS9odW9Xjv6O.eW5YxVx.nHPWZ/USs2fiEnHgCBT9vn5m', 1, 2),
('lucia.bianchi', '$2a$10$VjVoiNC1mS9odW9Xjv6O.eW5YxVx.nHPWZ/USs2fiEnHgCBT9vn5m', 2, 2),
('marco.verdi', '$2a$10$VjVoiNC1mS9odW9Xjv6O.eW5YxVx.nHPWZ/USs2fiEnHgCBT9vn5m', 3, 1);

-- Inserisci alcune registrazioni di esempio di orari di lavoro
INSERT INTO orari_lavoro (dipendente_id, data, orario_ingresso, orario_uscita, note) VALUES
(1, '2024-11-06', '2024-11-06 09:00:00', '2024-11-06 17:00:00', 'Lavoro standard'),
(2, '2024-11-06', '2024-11-06 10:00:00', '2024-11-06 18:00:00', 'Ha lavorato da remoto');

-- Inserisci alcune pause di esempio
INSERT INTO pause (orario_lavoro_id, orario_inizio, orario_fine) VALUES
(1, '2024-11-06 12:30:00', '2024-11-06 13:00:00'),  -- Pausa pranzo
(2, '2024-11-06 14:00:00', '2024-11-06 14:15:00');  -- Pausa breve
