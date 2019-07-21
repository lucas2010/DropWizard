USE lc_object_trace;

//Object
INSERT INTO lc_object (trace_number, created_at, created_by, product_code, product_desc, status,
	dest_address_1, dest_address_2, dest_address_pc, dest_name_1, dest_name_2,
	sender_address_1, sender_address_2, sender_name_1, sender_name_2)
VALUES ('RP1254879PT', '2019-07-16 11:44:00', 'lucas', 'ems24', 'ems 24 h', 'OK',
'Rua qualquer', null, '1600-389', 'Abilio', null,
'Rua Maestro Frederico de Freitas', '17, 8 esq', 'Luis Caselli', null);


//Event
INSERT INTO lc_object_event (obj_trace_number, date, eventid, event_type_code, event_type_desc, 
	operator_code, operator_name, geolocation, event_metadata)
VALUES ('RP1254879PT', '2019-07-16 11:44:00', now(), 'CREATE', 'Object created',
'lucas', 'Luis Caselli', 1458965326, {'station_code':'88596', 'clientid':'47859'});

