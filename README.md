# Databases-NTUA

Web app for a hotel that uses RFID bracelets to track client accesses to different areas of its premises for the purpose of developing an efficient course
of action in case of a viral outbreak.

This web app was developed for the purposes of the Databases course at [ECE NTUA](https://www.ece.ntua.gr/en) 2020-2021

## Hotel RFID web app
<h4 align="center">Prerequisites</h4>
<p align="center">
  <a href="https://dev.mysql.com/downloads/mysql/">
        <img src="https://img.shields.io/badge/MySQL-8.0.25-yellow" /></a>
  <a href="https://httpd.apache.org/download.cgi">
        <img src="https://img.shields.io/badge/Apache%20Server-2.4.52-blueviolet" /></a>
  <a href="https://angular.io/">
        <img src="https://img.shields.io/badge/Angular-10.1.2-blue" /></a>
  <a href="https://www.php.net/">
        <img src="https://img.shields.io/badge/PHP-7.4.16-red" /></a>
  <a href="https://www.phpmyadmin.net/">
        <img src="https://img.shields.io/badge/phpmyadmin-5.1.0-success" /></a>
  </p>

## Installation
1. Create a database in Phpmyadmin.
2. Use *hoteldb* as a name.
3. Import **hoteldb.sql** from the project folder.
4. Copy build to apache. (/var/www/html for Linux)
5. Go to [http:/localhost](http:/localhost)
## Troubleshooting
### Error while importing db to phpmyadmin:
Uncheck *Enable Foreign Key Check* and try again.
### Localhost doesn't work:
Give permission to apache to read files:
```
sudo chown -R www-data /var/www/html
```
## Credentials
|Username|Password|
|:---:   |:---:   |
|root    |root    |

To change credentials:
1. Navigate to build/api
2. Edit common-functions.php
3. Change line
```
$conn = mysqli_connect('127.0.0.1', 'root', 'root', 'hoteldb');
```
to
```
$conn = mysqli_connect('127.0.0.1', 'myusername', 'mypassword', 'hoteldb');
```
where *myusername* and *mypassword* are your credentials.
## Team
- [Lagos Anastasios](https://github.com/gosutek)
- [Konstantinos Vasilakis](https://github.com/vskostas)
