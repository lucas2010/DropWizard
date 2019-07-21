CREATE KEYSPACE lc_object_trace WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

use lc_object_trace;

// Entity table for a object
CREATE TABLE lc_object (
   trace_number varchar,
   product_code varchar,
   product_desc varchar,
   dest_name_1 varchar,
   dest_name_2 varchar,
   dest_address_1 varchar,
   dest_address_2 varchar,
   dest_address_pc varchar,
   sender_name_1 varchar,
   sender_name_2 varchar,
   sender_address_1 varchar,
   sender_address_2 varchar,
   status varchar,
   created_by varchar,
   created_at timestamp,
   last_modified_by varchar,
   last_modified_at timestamp,
   PRIMARY KEY (trace_number)
);

//  Entity table that will store many videos for a unique user
CREATE TABLE lc_object_event (
   obj_trace_number varchar,
   date timestamp,
   eventid uuid,
   event_type_code varchar,
   event_type_desc varchar,
   operator_code varchar,
   operator_name varchar,
   geolocation bigint,
   event_metadata map<varchar,varchar>,
   PRIMARY KEY (obj_trace_number, date, eventid)
);

CREATE INDEX event_metadata_idx ON lc_object_trace.lc_object_event (ENTRIES(event_metadata));
