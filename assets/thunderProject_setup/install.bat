cd /d %userprofile%/desktop/thunderProject_setup
tar -xf UwAmp.zip
timeout /t 10 /nobreak
move UwAmp C:\
timeout /t 3 /nobreak
git config --global --add safe.directory C:/UwAmp/www
timeout /t 1 /nobreak
tar -xf thunderproject.zip
timeout /t 2 /nobreak
move thunderproject\* C:\UwAmp\www
timeout /t 3 /nobreak
start C:\UwAmp\UwAmp.exe
cd C:\UwAmp\bin\database\mysql-5.7.11\bin

start mysql.exe --user=root --password=root --execute="create database thunderproject;"
timeout /t 5 /nobreak
start mysql.exe --user=root --password=root --database=thunderproject --execute="CREATE TABLE `bataille` (`id` int(11) NOT NULL,`resultat` int(3) NOT NULL DEFAULT '0',`RP` int(7) DEFAULT NULL,`SL` int(7) DEFAULT NULL,`tank` int(3) DEFAULT NULL,`avion` int(3) DEFAULT NULL,`assist` int(3) DEFAULT NULL);"
timeout /t 3 /nobreak
start mysql.exe --user=root --password=root --database=thunderproject --execute="ALTER TABLE `bataille` ADD PRIMARY KEY (`id`);"
timeout /t 3 /nobreak
start mysql.exe --user=root --password=root --database=thunderproject --execute="ALTER TABLE `bataille` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;"