from sqlalchemy.orm import Session

from app.infrastructure.repositories.game_repository import GameRepository


class GameService:
    def __init__(self) -> None:
        self.repository = GameRepository()

    def list_available_games(self, db: Session) -> list[dict[str, object]]:
        return self.repository.list_active(db)
