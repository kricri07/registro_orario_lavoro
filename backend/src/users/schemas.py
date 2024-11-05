from pydantic import BaseModel, Field

class User(BaseModel):
    id: int = Field(gt=1,lt=100, examples=[1])
    username: str = Field(max_length=16, examples=["k.borriello"])
    password: str = Field(max_length=16, examples=["Biscotto2001"])