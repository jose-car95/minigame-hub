from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from app.application.game_service import GameService
from app.infrastructure.database import get_db


router = APIRouter(prefix="/api/games", tags=["games"])
service = GameService()


@router.get("")
def list_games(db: Session = Depends(get_db)) -> list[dict[str, object]]:
    return service.list_available_games(db)
