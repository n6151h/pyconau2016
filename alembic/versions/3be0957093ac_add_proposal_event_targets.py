"""add proposal event targets

Revision ID: 3be0957093ac
Revises: 4cb574d6501a
Create Date: 2016-03-20 22:34:04.607354

"""

# revision identifiers, used by Alembic.
revision = '3be0957093ac'
down_revision = '4cb574d6501a'

from alembic import op
import sqlalchemy as sa

def upgrade():
    op.create_table('proposal_event_target',
                    sa.Column('id', sa.types.Integer, primary_key=True),
                    sa.Column('name', sa.types.String(40), unique=True, 
                              nullable=False)
                )
                    
    op.create_table('proposal_event_target_map',
                    sa.Column('proposal_event_target_id', sa.types.Integer, 
                              sa.ForeignKey('proposal_event_target.id',
                                            ondelete='CASCADE', onupdate='CASCADE'),
                              primary_key=True, nullable=False),
                    sa.Column('proposal_id',   sa.types.Integer, 
                              sa.ForeignKey('proposal.id', ondelete='CASCADE', 
                                            onupdate='CASCADE'), 
                              primary_key=True, nullable=False)
                )


def downgrade():
    op.drop_table('proposal_target_event_map')
    op.drop_table('proposal_event_target')


