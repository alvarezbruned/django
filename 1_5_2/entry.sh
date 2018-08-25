#!/bin/bash

echo "   WAITING POSTGRES  "
sleep 10
echo "   NOW RUNNING  "
if [ -f "/myproject/myproject/migrationactived" ]
then
  echo 'file migrationactived exist'
else
  echo 'file migrationactived NOT exist'
#  touch /myproject/myproject/migrationactived
#  echo 'migrationactived created'
#  python manage.py migrate
  python manage.py syncdb --noinput
 ## python manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('$DJUSER', '$DJEMAIL', '$DJPASS')"
  echo "from django.contrib.auth.models import User; User.objects.create_superuser('$DJUSER', '$DJEMAIL', '$DJPASS')" | ./manage.py shell
fi

python manage.py runserver 0.0.0.0:$DJPORT
