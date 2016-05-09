import sqlalchemy as sa

from meta import Base
import time

from pylons.controllers.util import abort

from meta import Session

from zkpylons.model.config import Config

class Payment(Base):
    """Stores details of payments made against invoices
    """
    __tablename__ = 'payment'

    id = sa.Column(sa.types.Integer, primary_key=True)
    invoice_id = sa.Column(sa.types.Integer, sa.ForeignKey('invoice.id'), nullable=False)
    amount = sa.Column(sa.types.Integer, nullable=False)
    creation_timestamp = sa.Column(sa.types.DateTime, nullable=False, default=sa.func.current_timestamp())
    last_modification_timestamp = sa.Column(sa.types.DateTime, nullable=False, default=sa.func.current_timestamp(), onupdate=sa.func.current_timestamp())

    def __init__(self, **kwargs):
        super(Payment, self).__init__(**kwargs)

    def __repr__(self):
        return '<Payment id=%r>' % (self.id)

    @property
    def gateway(self):
       return Config.get('payment_gateway', category='rego')

    @property
    def gateway_url(self):
        return Config.get('payment_gateway_url', category='rego')

    @property
    def merchant_id(self):
        return Config.get('payment_merchant_id', category='rego')

    @property
    def transaction_reference(self):
        return Config.get('event_shortname') + ' i-' + str(self.invoice.id) + ' p-' + str(self.id)

    @property
    def transaction_type(self):
        return Config.get('payment_default_transaction_type', category='rego')

    @property
    def securepay_fingerprint(self):
        import hashlib
        #fingerprint_values = [self.merchant_id, lca_info['payment_merchant_key'], self.transaction_type, self.transaction_reference, str(self.amount), self.creation_timestamp_utc.strftime('%Y%m%d%H%M%S')]
        fingerprint_values = [self.merchant_id, Config.get('payment_merchant_key', category='rego'), self.transaction_type, self.transaction_reference, str(self.amount), self.creation_timestamp_utc_formattedstring]
        return hashlib.sha1("|".join(fingerprint_values)).hexdigest()

    @property
    def creation_timestamp_utc(self):
        from datetime import timedelta
        return self.creation_timestamp - timedelta(hours=10)
        
    @property
    def creation_timestamp_utc_formattedstring(self):
        return time.strftime('%Y%m%d%H%M%S', time.gmtime())
        
    @property
    def event_name(self):
        return Config.get('event_name', category='rego')

    @classmethod
    def find_all(cls):
        return Session.query(Payment).order_by(Payment.id).all()

    @classmethod
    def find_by_id(cls, id, abort_404 = False):
        result =  Session.query(Payment).filter_by(id=id).first()
        if result is None and abort_404:
            abort(404, "No such payment object")
        return result

