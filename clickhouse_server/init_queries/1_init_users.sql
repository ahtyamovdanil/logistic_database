CREATE DATABASE IF NOT EXISTS logistic_logs;
CREATE user IF NOT EXISTS  ahtyamovdanil IDENTIFIED WITH plaintext_password BY 'qwerty';
GRANT ALL ON logistic_logs.* TO ahtyamovdanil WITH GRANT OPTION;