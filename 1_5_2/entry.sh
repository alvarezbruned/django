#!/bin/bash

echo "   WAITING POSTGRES  "
sleep 10
echo "   NOW RUNNING  "
if [ -f "/myproject/myproject/syncdbactived" ]
then
  echo 'file syncdbactived exist'
  echo "admin user $DJUSER with pass $DJPASS and email $DJEMAIL"
else
  echo 'file syncdbactived NOT exist'
  python manage.py syncdb --noinput
  touch /myproject/myproject/syncdbactived
  echo 'syncdbactived created'
  echo "from django.contrib.auth.models import User; User.objects.create_superuser('$DJUSER', '$DJEMAIL', '$DJPASS')" | ./manage.py shell
  echo "user $DJUSER created with pass $DJPASS and email $DJEMAIL"
fi

python manage.py runserver 0.0.0.0:$DJPORT
