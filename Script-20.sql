SELECT * FROM TB_CATEGORY tc ;


CREATE TABLE tb_user(
    id NUMBER PRIMARY KEY,
    user_id varchar2(50) NOT null, 
    user_pw varchar2(50) NOT null, 
    name varchar2(50), 
    birth date, 
    create_date date
);
SELECT * FROM tb_game;


DROP TABLE tb_user;
CREATE TABLE tb_game(
	id NUMBER NOT NULL,
	name varchar2(200),
	cost NUMBER,
	create_date date
);

CREATE TABLE tb_buy(
	id NUMBER NOT NULL,
	user_id NUMBER,
	game_id NUMBER,
	discount_cost NUMBER,
	refund_date DATE,
	create_date date
);

CREATE TABLE tb_category(
	id NUMBER NOT NULL,
	TYPE varchar2(200)
);

CREATE TABLE tb_gametocategory(
	game_id NUMBER NOT NULL,
	category_id number
);

CREATE TABLE tb_discount(
	id NUMBER NOT NULL,
	game_id NUMBER,
	sale NUMBER,
	start_date DATE,
	end_date DATE,
	create_date date
);

CREATE TABLE userselectlog(
	id number,
	user_id number,
	game_id number,
	discount_id number,
	create_date date
);

CREATE SEQUENCE SEQ_tb_user;
CREATE SEQUENCE SEQ_tb_game;
CREATE SEQUENCE SEQ_tb_buy;
CREATE SEQUENCE SEQ_tb_category;
CREATE SEQUENCE SEQ_tb_gametocategory;
CREATE SEQUENCE SEQ_tb_discount;
CREATE SEQUENCE SEQ_tb_userselectlog;


