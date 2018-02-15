DROP TABLE IF EXISTS address, cart, cart_line, category,product, user_detail;

CREATE TABLE category (
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active BOOLEAN
);

CREATE TABLE user_detail (
	id BIGSERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(70),
	email VARCHAR(100),
	contact_number VARCHAR(15)
);

CREATE TABLE product (
	id BIGSERIAL PRIMARY KEY,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT REFERENCES category (id),
	supplier_id INT REFERENCES user_detail(id),
	purchases INT DEFAULT 0,
	views INT DEFAULT 0
);

CREATE TABLE address (
	id BIGSERIAL PRIMARY KEY,
	user_id int REFERENCES user_detail (id),
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN
);

CREATE TABLE cart (
	id BIGSERIAL PRIMARY KEY,
	user_id int REFERENCES user_detail (id),
	grand_total DECIMAL(10,2),
	cart_lines int
);

CREATE TABLE cart_line (
	id BIGSERIAL PRIMARY KEY,
	cart_id int REFERENCES cart (id),
	total DECIMAL(10,2),
	product_id int REFERENCES product (id),
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean
);

-- adding three categories
INSERT INTO category (name, description,image_url,is_active) VALUES ('Laptop', 'This is description for Laptop category!', 'CAT_1.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Television', 'This is description for Television category!', 'CAT_2.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Mobile', 'This is description for Mobile category!', 'CAT_3.png', true);
-- adding three users 

INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Virat', 'Kohli', 'ADMIN', true, '$2a$10$uxr0fhibR9AJE3XfST7U9OfdPoJVwZu.SaKGKHSC56c1MI8Ho1EfC', 'vk@gmail.com', '8888888888');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Ravindra', 'Jadeja', 'SUPPLIER', true, '$2a$10$roocZ//5h.TpO5221l00te1TGp1uGrC3c7280LZ0mYI7meqk2LeuO', 'rj@gmail.com', '9999999999');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Ravichandra', 'Ashwin', 'SUPPLIER', true, '$2a$10$roocZ//5h.TpO5221l00te1TGp1uGrC3c7280LZ0mYI7meqk2LeuO', 'ra@gmail.com', '7777777777');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Ashish', 'Patil', 'USER', true, '$2a$10$roocZ//5h.TpO5221l00te1TGp1uGrC3c7280LZ0mYI7meqk2LeuO', 'abc@gmail.com', '9145000000');

-- adding a supplier correspondece address
INSERT INTO address( user_id, address_line_one, address_line_two, city, state, country, postal_code, is_billing, is_shipping) 
VALUES (2, '102 Sabarmati Society, Mahatma Gandhi Road', 'Near Salt Lake, Gandhi Nagar', 'Ahmedabad', 'Gujarat', 'India', '111111', true, false );

-- adding five products
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'iPhone 5s', 'apple', 'This is one of the best phone available in the market right now!', 18000, 5, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDDEF123DEFX', 'Samsung s7', 'samsung', 'A smart phone by samsung!', 32000, 2, true, 3, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDPQR123WGTX', 'Google Pixel', 'google', 'This is one of the best android smart phone available in the market right now!', 57000, 5, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDMNO123PQRX', ' Macbook Pro', 'apple', 'This is one of the best laptops available in the market right now!', 54000, 3, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZDEFX', 'Dell Latitude E6510', 'dell', 'This is one of the best laptop series from dell that can be used!', 48000, 5, true, 1, 3, 0, 0 );
