from fastapi import FastAPI

app = FastAPI(title="MiniGame Hub API")


@app.get("/health")
def health_check() -> dict[str, str]:
    return {
        "status": "ok",
        "service": "minigame-hub-backend"
    }
