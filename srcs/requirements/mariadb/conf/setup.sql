ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
CREATE DATABASE wordpress;
CREATE USER 'mballet'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO 'mballet'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;