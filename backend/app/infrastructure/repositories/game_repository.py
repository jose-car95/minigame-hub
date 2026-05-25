from sqlalchemy import text
from sqlalchemy.orm import Session


class GameRepository:
    def list_active(self, db: Session) -> list[dict[str, object]]:
        query = text(
            """
            SELECT id, code, name, description
            FROM games
            WHERE is_active = TRUE
            ORDER BY id
            """
        )

        result = db.execute(query)

        return [dict(row._mapping) for row in result]
