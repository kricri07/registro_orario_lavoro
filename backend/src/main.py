from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from users.routes import router as users_route
from config import settings

app = FastAPI(
    title=settings.app_name,
    version="0.0.1"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
    allow_credentials=True
)


app.include_router(users_route)

# Redirect / -> Swagger-UI documentation
@app.get("/")
def main_function():
    """
    # Redirect
    to documentation (`/docs/`).
    """
    return RedirectResponse(url="/docs/")