"""add rank column to proposal_type

Revision ID: 3993d1027c62
Revises: 3e7de5c31b2b
Create Date: 2016-04-06 21:49:28.687125

"""

# revision identifiers, used by Alembic.
revision = '3993d1027c62'
down_revision = '3e7de5c31b2b'

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.add_column('proposal_type', sa.Column('rank', sa.types.Integer,
                                             default=0))
    op.execute("update proposal_type set rank=0")

    op.alter_column('proposal_type', 'rank', nullable=False)

def downgrade():
    op.drop_column('proposal_type', 'rank')
