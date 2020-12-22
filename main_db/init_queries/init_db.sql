USE logistic;
CREATE TABLE Drivers
(
  driver_id   INT      NOT NULL AUTO_INCREMENT,
  driver_name char(18) NULL    ,
  PRIMARY KEY (driver_id)
);

CREATE TABLE Freight
(
  freight_id      INT         NOT NULL AUTO_INCREMENT,
  freight_type_id INT         NOT NULL,
  name            varchar(20) NULL    ,
  fragility       bit         NOT NULL,
  PRIMARY KEY (freight_id)
);

CREATE TABLE Freight_types
(
  type_id   INT         NOT NULL AUTO_INCREMENT,
  type_name varchar(20) NULL    ,
  PRIMARY KEY (type_id)
);

CREATE TABLE Invoice
(
  invoice_id           INT  NOT NULL AUTO_INCREMENT,
  driver_id            INT  NOT NULL,
  vehicle_id           INT  NULL    ,
  destination_point_id INT  NOT NULL,
  departure_point_id   INT NULL    ,
  distance             FLOAT  NULL    ,
  delivery_date        date NULL    ,
  PRIMARY KEY (invoice_id)
);

CREATE TABLE Points
(
  point_id   INT         NOT NULL AUTO_INCREMENT,
  name       varchar(20) NULL    ,
  longitude  FLOAT       NULL    ,
  altitude   FLOAT       NULL    ,
  point_type BOOL        NULL    ,
  PRIMARY KEY (point_id)
);

CREATE TABLE Route_logs
(
  invoice_id    INT      NULL    ,
  date          DATE     NULL    ,
  time          DATETIME NULL    ,
  latitude      FLOAT    NULL    ,
  longitude     FLOAT    NULL    ,
  tire_pressure FLOAT    NULL    ,
  speed         FLOAT    NULL    ,
  temperature   FLOAT    NULL    ,
  fuel_level    FLOAT    NULL    ,
  belts_status  BOOL     NULL    
);

CREATE TABLE Transportation
(
  transportation_id INT NOT NULL AUTO_INCREMENT,
  freight_id        INT NOT NULL,
  invoice_id        INT NOT NULL,
  amount            int NULL    ,
  price             int NULL    ,
  PRIMARY KEY (transportation_id)
);

CREATE TABLE Vehicles
(
  vehicle_id INT         NOT NULL AUTO_INCREMENT,
  vin        INT         NULL    ,
  type       VARCHAR(20) NULL    ,
  PRIMARY KEY (vehicle_id)
);

ALTER TABLE Invoice
  ADD CONSTRAINT FK_Points_TO_Invoice1
    FOREIGN KEY (destination_point_id)
    REFERENCES Points (point_id);

ALTER TABLE Freight
  ADD CONSTRAINT FK_Freight_types_TO_Freight
    FOREIGN KEY (freight_type_id)
    REFERENCES Freight_types (type_id);

ALTER TABLE Transportation
  ADD CONSTRAINT FK_Freight_TO_Transportation
    FOREIGN KEY (freight_id)
    REFERENCES Freight (freight_id);

ALTER TABLE Transportation
  ADD CONSTRAINT FK_Invoice_TO_Transportation
    FOREIGN KEY (invoice_id)
    REFERENCES Invoice (invoice_id);

ALTER TABLE Invoice
  ADD CONSTRAINT FK_Drivers_TO_Invoice
    FOREIGN KEY (driver_id)
    REFERENCES Drivers (driver_id);

ALTER TABLE Invoice
  ADD CONSTRAINT FK_Vehicles_TO_Invoice
    FOREIGN KEY (vehicle_id)
    REFERENCES Vehicles (vehicle_id);

ALTER TABLE Invoice
  ADD CONSTRAINT FK_Points_TO_Invoice2
    FOREIGN KEY (departure_point_id)
    REFERENCES Points (point_id);


      