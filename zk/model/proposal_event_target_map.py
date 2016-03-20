"""The application's model objects"""
import sqlalchemy as sa

from meta import metadata

# for doing n-n mappings of people and proposals
proposal_event_target_map = sa.Table('proposal_event_target_map', metadata,
        sa.Column('proposal_event_target_id', sa.types.Integer, sa.ForeignKey('proposal_event_target.id', ondelete='CASCADE', onupdate='CASCADE'), primary_key=True, nullable=False),
        sa.Column('proposal_id',   sa.types.Integer, sa.ForeignKey('proposal.id', ondelete='CASCADE', onupdate='CASCADE'), primary_key=True, nullable=False)
)
