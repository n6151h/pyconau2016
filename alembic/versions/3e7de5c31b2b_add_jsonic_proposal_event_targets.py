"""add JSONic proposal event targets

Revision ID: 3e7de5c31b2b
Revises: 4cb574d6501a
Create Date: 2016-03-21 07:13:24.424092

"""

# revision identifiers, used by Alembic.
revision = '3e7de5c31b2b'
down_revision = '4cb574d6501a'

from alembic import op
import sqlalchemy as sa

from sqlalchemy.dialects.postgresql import JSON

def upgrade():
    op.add_column('proposal', sa.column('event_targets', sa.types.Text))


def downgrade():
    op.drop_column('proposal', 'event_targets')
