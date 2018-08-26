#!/bin/bash

echo "   WAITING POSTGRES  "
sleep 10
echo "   NOW RUNNING  "
if [ -f "/myproject/myproject/migrationactived" ]
then
  echo 'file migrationactived exist'
  echo "admin user $DJUSER with pass $DJPASS and email $DJEMAIL"
else
  echo 'file migrationactived NOT exist'
  touch /myproject/myproject/migrationactived
  echo 'migrationactived created'
  python manage.py migrate
  python manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('$DJUSER', '$DJEMAIL', '$DJPASS')"
  echo "user $DJUSER created with pass $DJPASS and email $DJEMAIL"
fi

python manage.py runserver 0.0.0.0:$DJPORT
