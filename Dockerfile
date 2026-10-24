FROM mediawiki:1.43.11

COPY logo.svg /var/www/html/resources/assets/rdlogo.svg
COPY LocalSettings.php /var/www/html/LocalSettings.php