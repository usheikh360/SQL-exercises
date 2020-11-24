DROP DATABASE IF EXISTS BarberShopAppointmentBookings;

CREATE DATABASE BarberShopAppointmentBookings;

USE BarberShopAppointmentBookings;

CREATE TABLE type_of_hair_cut(
	type_of_hair_cut_id int,
	hair_cut_name varchar (20),
	description varchar (100),
	cost_of_haircut DECIMAL(5,2),
	
	CONSTRAINT pk_type_of_hair_cut PRIMARY KEY (type_of_hair_cut_id)
);

CREATE TABLE feedback_for_type_of_haircut(
	feedback_id int,
	rating int CHECK (rating<=5),
	comment varchar (150),
	type_of_hair_cut_id int,
	CONSTRAINT pk_feedback_for_type_of_haircut PRIMARY KEY (feedback_id),
	CONSTRAINT fk_feedback_for_type_of_haircut FOREIGN KEY(type_of_hair_cut_id) REFERENCES type_of_hair_cut(type_of_hair_cut_id) 
);

CREATE TABLE hairdresser (
	hairdresser_id int,
	hairdresser_first_name varchar(15),
	hairdresser_last_name varchar(20),
	type_of_hair_cut_id int,#the types of haircut this hairdresser specialises in
	
	CONSTRAINT pk_hairdresser PRIMARY KEY (hairdresser_id),
	CONSTRAINT fk_hairdresser FOREIGN KEY (type_of_hair_cut_id) REFERENCES type_of_hair_cut(type_of_hair_cut_id)
);

CREATE TABLE booking(
	booking_id int,
	date_time DATETIME,
	notes varchar (100),
	type_of_hair_cut_id int,
	booked boolean,
	
	CONSTRAINT pk_booking PRIMARY KEY (booking_id),
	CONSTRAINT fk_booking FOREIGN KEY (type_of_hair_cut_id) REFERENCES type_of_hair_cut(type_of_hair_cut_id)
);

CREATE TABLE client(
	client_id int,
	user_name varchar(15),
	user_password varchar(40),
	booking_id int,
	
	CONSTRAINT pk_user PRIMARY KEY (client_id),
	CONSTRAINT fk_user FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);
