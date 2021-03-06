"""
 * Add display_order to Product

Revision ID: 1e6ca7fcff4a
Revises: 30c8c19bec13
Create Date: 2012-09-23 20:48:15.303548

"""

# revision identifiers, used by Alembic.
revision = '1e6ca7fcff4a'
down_revision = '30c8c19bec13'

from alembic import op
import sqlalchemy as sa


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.add_column('product', sa.Column('display_order', sa.Integer()))
    op.execute("UPDATE product SET display_order=10")
    op.alter_column('product', 'display_order', nullable=False)

    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('product', 'display_order')
    ### end Alembic commands ###
