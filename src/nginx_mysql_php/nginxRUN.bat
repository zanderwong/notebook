 @echo off
 
 echo Starting PHP FastCGI...
 
 RunHiddenConsole C:/nginx/php/php-cgi.exe -b 127.0.0.1:9000 -c C:/nginx/php/php.ini
 
 echo Starting nginx...
 
 RunHiddenConsole c:/nginx/nginx.exe
 
 Exit