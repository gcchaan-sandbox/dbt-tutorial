create database raw;
\c raw;

create schema if not exists jaffle_shop;
create schema if not exists stripe;

drop table if exists jaffle_shop.customers;
create table jaffle_shop.customers(
    id integer,
    first_name varchar(50),
    last_name varchar(50)
);

drop table if exists jaffle_shop.orders;
create table jaffle_shop.orders(
    id integer,
    user_id integer,
    order_date date,
    status varchar(50),
    _etl_loaded_at timestamp default current_timestamp
);

drop table if exists stripe.payment;
create table stripe.payment(
    id integer,
    orderid integer,
    paymentmethod varchar(50),
    status varchar(50),
    amount integer,
    created date,
    _batched_at timestamp default current_timestamp
);

\copy jaffle_shop.customers from /csv/jaffle_shop_customers.csv with csv header
-- _etl_loaded_at にデフォルトを扱わせるために列を指定する
\copy jaffle_shop.orders (id, user_id, order_date, status) from /csv/jaffle_shop_orders.csv with csv header
\copy stripe.payment (id, orderid, paymentmethod, status, amount, created) from /csv/stripe_payments.csv with csv header
