CREATE TABLE "merchant" (
    "id" INT PRIMARY KEY  NOT NULL,
    "name" VARCHAR(30)  NOT NULL,
    "id_merchant_category" INT   NOT NULL
);
drop table transactions;
CREATE TABLE "transaction" (
    "id" INT PRIMARY KEY  NOT NULL,
    "date" Timestamp NOT NULL,
    "amount" FLOAT   NOT NULL,
	"card" BIGINT  NOT NULL,
	"id_merchant" INT  NOT NULL
);

CREATE TABLE "card_holder" (
    "id" INT PRIMARY KEY  NOT NULL,
    "name" VARCHAR(30)  NOT NULL
);

drop table credit_card;
CREATE TABLE "credit_card" (
    "card" BIGINT PRIMARY KEY  NOT NULL,
    "cardholder_id" INT  NOT NULL
);

CREATE TABLE "merchant_category" (
    "id" INT PRIMARY KEY  NOT NULL,
    "name" VARCHAR(30)  NOT NULL
);




