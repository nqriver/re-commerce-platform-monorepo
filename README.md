## Running with Docker

The application is fully dockerized. For convenience orchestration is wrapped with Makefile


#### To begin with...
> I use windows and do not have `make` command installed. What the hell am I supposed to do?

* Install chocolatey from [choco](https://chocolatey.org/install#individual).
* Then, in your terminal execute `choco install make`.


#### Available commands:

- `make start [profile]`

  Builds and starts all nessery containers.

- `make stop [profile]`

  Stops containers created by start.

##### Available profiles

- `all` everything
- `services` services required by backend application
- `backend` backend application with all services
- `frontend` frontend application

##### Installation steps
1. Run `make start all`. This may take up to 10 minutes.
2. Populate test users and admins into accounting-ms database by running the following command `curl http://localhost:5000/admin/test_users`. 
This will create 10 users and 2 admins. Here is part of the actual code inserting test data, use the data to sign in:
```python
        user10 = User(username='testuser10', firstname='User10', lastname='User10', phone_number='111222333',
                     email='user10@example.com')
        user10.password = bcrypt.generate_password_hash('Haslo123').decode('utf-8')

        admin1 = Admin(username='admin1', firstname='Admin', lastname='One', phone_number='111111111',
                       email='admin@admin.com')

```
3. If 
If you are running services for the first time, it may be necessary to run migrations for flask applications (there are 2)


#### Resources

- network
  - `auctions-dev-environment`
- volumes
  - `scripts/local/var/*`

#### Misc
- All container data is persistent, if you want to remove database and object storage, remove folders located in `scripts/local/var`.

- With `make start` docker will try to build a container from scratch, so it's important that all Dockerfiles properly utilize cache.

- The main docker-compose file uses env vars loaded from the corresponding .env file. Running it directly may cause issues.

- We are loading environment variables to the session, so it's important to add prefixes to everything in case of potential conflicts.
