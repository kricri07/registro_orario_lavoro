# registro_orario_lavoro

# Struttura del progetto 

    Backend

    
    backend/
├── src/
│   ├── auth/                   # Autenticazione
│   │   ├── __init__.py
│   │   ├── models.py
│   │   ├── schemas.py
│   │   ├── crud.py
│   │   └── routes.py
│   ├── dipendenti/              # Gestione dei dipendenti
│   │   ├── __init__.py
│   │   ├── models.py
│   │   ├── schemas.py
│   │   ├── crud.py
│   │   └── routes.py
│   ├── orari_lavoro/            # Registrazione degli orari di lavoro
│   │   ├── __init__.py
│   │   ├── models.py
│   │   ├── schemas.py
│   │   ├── crud.py
│   │   └── routes.py
│   ├── pause/                   # Gestione delle pause
│   │   ├── __init__.py
│   │   ├── models.py
│   │   ├── schemas.py
│   │   ├── crud.py
│   │   └── routes.py
│   ├── ruoli/                   # Gestione dei ruoli
│   │   ├── __init__.py
│   │   ├── models.py
│   │   ├── schemas.py
│   │   ├── crud.py
│   │   └── routes.py
│   ├── core/                    # Configurazioni e utility
│   │   ├── __init__.py
│   │   ├── config.py
│   │   ├── database.py
│   │   └── security.py
│   └── main.py                  # Punto di ingresso principale
├── .env
└── Dockerfile
