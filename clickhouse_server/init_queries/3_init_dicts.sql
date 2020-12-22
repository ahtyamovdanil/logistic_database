CREATE DICTIONARY logistic_logs.dict_users_id (
    invoice_id UInt64,
    distance Float32
)
PRIMARY KEY invoice_id
SOURCE(MYSQL(
    port 3306
    user 'ahtyamovdanil'
    password 'qwerty2481'
    replica(host 'main_db' priority 1)
    db 'logistic'
    table 'Invoice'
))
LAYOUT(HASHED())
LIFETIME(MIN 3600 MAX 5400);