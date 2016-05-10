delete from config where category='rego' and key like 'payment%';

insert into config values ('rego', 'payment_gateway', '"securepay"', 'Name of secure payment gateway'),
       	    	   	  ('rego', 'payment_gateway_url', '"https://payment.securepay.com.au/live/v2/invoice"', 'Payment gateway URL'),
       	    	   	  ('rego', 'payment_merchant_id', '"LNX0011"', 'Merchante ID'),
			  ('rego', 'payment_default_transaction_type', '"4"', 'Default transaction type'),
			  ('rego', 'payment_merchant_key', '"6sCaeFM92y"', 'Provided by Linux Australia -- Josh H');

-- Might need these to make the first t-shirt free
--insert into product_include select id, category_id, 1 from product where category_id=2;
