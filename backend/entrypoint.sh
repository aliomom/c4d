php bin/console doctrine:database:create --if-not-exists
php bin/console make:migration
php bin/console doctrine:migration:migrate
apachectl -D FOREGROUND

