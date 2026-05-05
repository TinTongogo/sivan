"""add agent_type column to agents

区分 system / dynamic / user 三类智能体，替代 agent_id 硬编码判断。

Revision ID: 002_add_agent_type
Revises: 90943beca35f
Create Date: 2026-05-05
"""

from __future__ import annotations

from collections.abc import Sequence
from typing import Union

from alembic import op
import sqlalchemy as sa


revision: str = "002_add_agent_type"
down_revision: str | None = "90943beca35f"
branch_labels: str | Sequence[str] | None = None
depends_on: str | Sequence[str] | None = None


def upgrade() -> None:
    op.add_column(
        "agents",
        sa.Column("agent_type", sa.Text(), server_default="user", nullable=False),
    )


def downgrade() -> None:
    op.drop_column("agents", "agent_type")
