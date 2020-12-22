CREATE TABLE IF NOT EXISTS logistic_logs.route_logs(
    `log_id` UInt64,
    `invoice_id` UInt64,
    `date` Date,
    `time` DateTime,
    `latitude` Float32,
    `longitude` Float32,
    `tire_pressure` Float32,
    `speed` Float32,
    `temperature` Float32,
    `fuel_level` Float32,
    `belts_status` UInt8
) ENGINE = MergeTree()
PRIMARY KEY log_id  
ORDER BY log_id;