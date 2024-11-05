from fastapi import APIRouter

from database import users
from users.schemas import User

router = APIRouter(
    prefix="/users",
    tags=["User"]
)

@router.get("/allUsers")
async def users_list():
    return users

@router.get("/user")
async def get_user(id: int = 1):
    for user in users:
        if user["id"] == id:
            return user