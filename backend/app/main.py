from fastapi import FastAPI

from app.api.game_controller import router as game_router

app = FastAPI(title="MiniGame Hub API")
app.include_router(game_router)


@app.get("/health")
def health_check() -> dict[str, str]:
    return {
        "status": "ok",
        "service": "minigame-hub-backend",
    }
