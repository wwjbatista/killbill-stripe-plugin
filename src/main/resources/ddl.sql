/*! SET storage_engine=INNODB */;

create table stripe_hpp_requests (
  record_id serial
, kb_account_id char(36) not null
, kb_payment_id char(36) default null
, kb_payment_transaction_id char(36) default null
, session_id varchar(255) not null
, additional_data longtext default null
, created_date datetime not null
, kb_tenant_id char(36) not null
, primary key(record_id)
) /*! CHARACTER SET utf8 COLLATE utf8_bin */;
create index stripe_hpp_requests_kb_account_id on stripe_hpp_requests(kb_account_id);
create unique index stripe_hpp_requests_kb_session_id on stripe_hpp_requests(session_id);
create index stripe_hpp_requests_kb_payment_transaction_id on stripe_hpp_requests(kb_payment_transaction_id);

create table stripe_responses (
  record_id serial
, kb_account_id char(36) not null
, kb_payment_id char(36) not null
, kb_payment_transaction_id char(36) not null
, transaction_type varchar(32) not null
, amount numeric(15,9)
, currency char(3)
, stripe_id varchar(255) not null
, additional_data longtext default null
, created_date datetime not null
, kb_tenant_id char(36) not null
, primary key(record_id)
) /*! CHARACTER SET utf8 COLLATE utf8_bin */;
create index stripe_responses_kb_payment_id on stripe_responses(kb_payment_id);
create index stripe_responses_kb_payment_transaction_id on stripe_responses(kb_payment_transaction_id);
create index stripe_responses_stripe_id on stripe_responses(stripe_id);

create table stripe_payment_methods (
  record_id serial
, kb_account_id char(36) not null
, kb_payment_method_id char(36) not null
, stripe_id varchar(255) not null
, is_default smallint not null default 0
, is_deleted smallint not null default 0
, additional_data longtext default null
, created_date datetime not null
, updated_date datetime not null
, kb_tenant_id char(36) not null
, primary key(record_id)
) /*! CHARACTER SET utf8 COLLATE utf8_bin */;
create unique index stripe_payment_methods_kb_payment_id on stripe_payment_methods(kb_payment_method_id);
create index stripe_payment_methods_stripe_id on stripe_payment_methods(stripe_id);
