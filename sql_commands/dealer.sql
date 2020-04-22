create table exchange_rates 
(
id serial primary key,
bid varchar(30) not null,
ask varchar(30) not null,
trendAsk varchar(30),
trendBid varchar(30),
date timestamp not null,
ccy_id integer references currency_code(id),
base_ccy_id integer references currency_code(id),
source_id int references source(id)
);	

insert into public.exchange_rates 
(bid, ask, trendask, trendbid, date, ccy_id, base_ccy_id, source_id) 
values 
('29.3', '27.248', null, null, now(), 
(select cc.id from public.currency_code cc where cc.code='840'), 
(select cc.id from public.currency_code cc where cc.code='980'), 
(select c.id from public.source c where c.source='monobank'));

select c.id from public.source c where c.source='monobank';

insert into public.currency_code(code, ccy, description) values ('643', 'RUR', 'Российский рубль');

insert into public.source(source, api_key, description) values ('privatbank', null, '');

insert into public.source_url (source_id, url, data_type) 
values (
(select s.id from public.source s where source='privatbank'),
'https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11',
'non-cash'
);

ALTER TABLE public.source_url
ADD data_type CHARACTER VARYING(20) null;

SELECT * FROM information_schema.tables WHERE table_schema = 'public';

SELECT * FROM exchange_rates where ccy_id=3;

ALTER TABLE exchange_rates RENAME COLUMN base_ccy TO base_ccy_id;

SELECT * FROM source_url;

SELECT * FROM source;

SELECT * FROM currency_code where code='840' or code='980';

SELECT * FROM source s, source_url su where ;

select
s.source,
s.api_key,
su.url,
su.data_type
FROM source s LEFT JOIN source_url su ON s.id = su.source_id;

ALTER TABLE public.ccy_code ADD CONSTRAINT ccy_code_key UNIQUE (code);

delete from exchange_rates where id > 0;