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

data = [
    { 'name': 'Main Conference' },
    { 'name': 'Python in Education Seminar' },
    { 'name': 'DjangoCon AU' },
    { 'name': 'Science and Data Miniconference' },
    { 'name': 'Internet of Things Miniconference' }
]

def upgrade():
    # Create the events target table.
    event_targets = op.create_table('proposal_event_target',
                                    sa.Column('id', sa.types.Integer, 
                                              primary_key=True),
                                    sa.Column('name', sa.types.String(40), 
                                              unique=True, 
                                              nullable=False))

    # Populate it.
    op.bulk_insert(event_targets, data)

    # Add JSON column to proposal.
    op.add_column('proposal', sa.Column('event_targets', 
                                        sa.dialects.postgresql.JSON, nullable=True))
     

     
def downgrade():
    op.drop_column('proposal', 'event_targets')
    op.drop_table('proposal_event_target')
