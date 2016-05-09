delete from config where category='rego' and key like 'payment%';

insert into config values ('rego', 'payment_gateway', '"securepay"', 'Name of secure payment gateway'),
       	    	   	  ('rego', 'payment_gateway_url', '"http://payment.securepay.com.au/live/v2/invoice"', 'Payment gateway URL'),
       	    	   	  ('rego', 'payment_mergant_id', '"LNX0011"', 'Merchante ID'),
			  ('rego', 'payment_default_transaction_type', '"4"', 'Default transaction type'),
			  ('rego', 'payment_merchant_key', '"6sCaeFM92y"', 'Provided by Linux Australia -- Josh H');
