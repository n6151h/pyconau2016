"""Create registeration.gender column

Revision ID: 36218127b542
Revises: 3993d1027c62
Create Date: 2016-05-24 20:29:50.284392

"""

# revision identifiers, used by Alembic.
revision = '36218127b542'
down_revision = '3993d1027c62'

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.add_column('registration', sa.Column('gender', sa.Text))

def downgrade():
    pass
