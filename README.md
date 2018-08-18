# django

To run correctly django with postgres I's necessary clone git repository
and execute docker-compose up
Now the environment variables of django are customitzables, not the postgres because in settings.py file Django waits this values.

```yaml
version: "2" 
services: 
  postgres:
    container_name: postgres
    image: postgres 
    environment:
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_USER=postgres
      - POSTGRES_DB=postgres
      - PGDATA=/var/lib/postgresql/data/pgdata
    volumes:
      - ./db-data:/var/lib/postgresql/data/pgdata
    ports:
      - "5433:5432"
  django: 
    container_name: django_server 
    image: albertalvarezbruned/django 
    stdin_open: true 
    tty: true 
    volumes: 
      - ./myproject:/myproject/myproject #only if you clone repo 
    ports: 
      - "8000:8000" 
    depends_on: 
      - postgres 
    environment: 
      - DJUSER=admin 
      - DJPASS=passadmin 
      - DJEMAIL="admin@admin.com" 
      - DJPORT=8000 
```
