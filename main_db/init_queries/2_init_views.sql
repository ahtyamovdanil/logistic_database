USE logistic;
CREATE VIEW full_invoice as 
SELECT  Invoice.invoice_id, Drivers.driver_name, Vehicles.type, Transportation.amount, Transportation.price
FROM Invoice
JOIN Drivers on Invoice.driver_id = Drivers.driver_id
JOIN Vehicles on Invoice.vehicle_id = Vehicles.vehicle_id
JOIN Transportation on Invoice.invoice_id = Transportation.invoice_id;
 
