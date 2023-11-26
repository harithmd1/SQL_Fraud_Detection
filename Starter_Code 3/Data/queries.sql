-- card_holder Inner Join merchant
SELECT card_holder.id
,card_holder.name as card_holder_name
,merchant.name as merchant_name
,id_merchant_category 
FROM card_holder
INNER JOIN merchant
ON merchant.id=card_holder.id
;

-- Change table name transaction to trans (transactiion name is not code friendly)
ALTER TABLE transaction RENAME TO trans

-- credit card Left Join trans
SELECT credit_card.card,
credit_card.cardholder_id,
trans.id as transaction_id,
trans.date,
trans.amount
FROM credit_card
LEFT JOIN trans
ON trans.card =credit_card.card
;

-- merchant_category Left Join merchant
SELECT merchant_category.id as merchant_category_id,
merchant_category.name as merchan_category_name,
merchant.id as merchant_id,
merchant.name as merchant_name
FROM merchant_category
LEFT JOIN merchant
ON merchant.id_merchant_category=merchant_category.id
;
-- Join 3 tables credit card, transaction id, card holder
select credit_card.card,
trans.id as transaction_id,
trans.date,
trans.amount,
card_holder.id as card_holder_id,
card_holder.name
from card_holder
left join credit_card 
	on card_holder.id= credit_card.cardholder_id
left join trans
	on credit_card.card = trans.card

-- Find several small transactions less than $2 per card holder
select credit_card.card,
trans.id as transaction_id,
trans.date,
trans.amount,
card_holder.id as card_holder_id,
card_holder.name
from card_holder
left join credit_card 
	on card_holder.id= credit_card.cardholder_id
left join trans
	on credit_card.card = trans.card
where trans.amount < 2
;

-- Find top 100 highest transactions from7 to 9 AM and find Anomalies vs rest of the day
select credit_card.card,
trans.id as transaction_id,
trans.date,
trans.amount,
card_holder.id as card_holder_id,
card_holder.name
from card_holder
left join credit_card 
	on card_holder.id= credit_card.cardholder_id
left join trans
	on credit_card.card = trans.card
WHERE date_part('hour',trans.date) >=7 AND date_part('hour',trans.date) <9
ORDER BY amount DESC
LIMIT 100
;

--Find top 5 merchants hacked with small transactions less than $2
select credit_card.card,
trans.id as transaction_id,
trans.date,
trans.amount,
card_holder.id as card_holder_id,
card_holder.name
from card_holder
left join credit_card 
	on card_holder.id= credit_card.cardholder_id
left join trans
	on credit_card.card = trans.card
where trans.amount < 2
ORDER BY amount DESC
LIMIT 5
;

-- Create View for Joining 3 tables
CREATE VIEW three_tables AS
select credit_card.card,
trans.id as transaction_id,
trans.date,
trans.amount,
card_holder.id as card_holder_id,
card_holder.name
from card_holder
left join credit_card 
	on card_holder.id= credit_card.cardholder_id
left join trans
	on credit_card.card = trans.card
;	

-- Creat a view for small transactions <$2
CREATE VIEW small_transactions AS
select credit_card.card,
trans.id as transaction_id,
trans.date,
trans.amount,
card_holder.id as card_holder_id,
card_holder.name
from card_holder
left join credit_card 
	on card_holder.id= credit_card.cardholder_id
left join trans
	on credit_card.card = trans.card
where trans.amount < 2
;

-- Create view for top 100 highest transactions 7-9AM
CREATE VIEW highest_transactions AS
select credit_card.card,
trans.id as transaction_id,
trans.date,
trans.amount,
card_holder.id as card_holder_id,
card_holder.name
from card_holder
left join credit_card 
	on card_holder.id= credit_card.cardholder_id
left join trans
	on credit_card.card = trans.card
WHERE date_part('hour',trans.date) >=7 AND date_part('hour',trans.date) <9
ORDER BY amount DESC
LIMIT 100
;

-- Create view for top 5 merchants hacked with small transactions
CREATE VIEW top_5_merchants_hacked_with_small_transactions AS
select credit_card.card,
trans.id as transaction_id,
trans.date,
trans.amount,
card_holder.id as card_holder_id,
card_holder.name
from card_holder
left join credit_card 
	on card_holder.id= credit_card.cardholder_id
left join trans
	on credit_card.card = trans.card
where trans.amount < 2
ORDER BY amount DESC
LIMIT 5
;

-- See Three_tables view:
SELECT * from three_tables
;

-- See small_transactions view
select * from small_transactions
;

-- See highest_transactions 7am to 9am view
select * from highest_transactions
;

-- See top_5_merchants_hacked_with_small_transactions view
select * from top_5_merchants_hacked_with_small_transactions
;

-- Customer 2 and 18 fraud?
-- YES with snall transactions but NO with large transactions 7-9AM

-- HVPLOT line transactions and time, combine in one plot, df

-- Biggest Customer, Credit Card, first quarter 2018, expensive restaurant bills, card holder id 25
-- 2018-03-05 8:26AM (expensive breakfast :) of $1617), Crystal Clark

-- HVPLOT box expenditure from Jan 2018 to June 2018 for ID 25 card holder

-- Outliers (how many per month) "STD" or"quartiles