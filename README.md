Objective:
Create a backend system that supports REST APIs for adding, updating, viewing and deleting text reviews and numerical ratings by users for products in an e-commerce store.

Tech Stack: Flask, PostgreSQL, SQLAlchemy, Docker

a. Setting up the codebase from scratch within a virtual environment

	Execute the following steps in bash shell (via termial):

	1. Install virtualenv module if not already installed:
		sudo pip3 install virtualenv
	2. Create a virtualenv using the command:virtualenv isi
		virtualenv <env_name>
	3. Activate the virtual environment
		source <env_name>/bin/activate
	This command will switch to the virtual environment
	4. Install the required packages (in the venv)
		pip install flask psycopg2-binary Flask-SQLAlchemy
	5. Gather the requirements to be used later create docker containers.
		pip freeze > requirements.txt

b. Build and run the container
		
	 Create network so that flask app and database can communicate:
		docker network create isi
		
	a. Build the database container:
		docker pull postgres
		docker run -d -p 5432:5432 -v $(pwd)/database:/data -e POSTGRES_PASSWORD=password --net isi --name database postgres
		docker exec -it database bash

	Once the container is running and you see the bash terminal, execute the following to create the tables and seed the data

		psql -U postgres -a -f /data/init.sql

		Example: 
		root@8254335c8597:/# psql -U postgres -a -f /data/init.sql
		root@8254335c8597:/# psql -U postgres -d isi		
		Verify tables are created:
		isi=# \dt
		Verify data is seeded:
		isi=# select * from users;
		isi=# select * from products;
		isi=# exit


	b. Building and running the flask app
		1. Navigate to app/
		2. Run the command: docker build -t isi_test .
		3. docker run  -p 5000:5000 --net isi -it isi_test deploy
		(deploy option will start the flask server)
		Navigate to the browser and type: http://127.0.0.1/user/3 



c. Run the test suite that tests all the APIs:
	
	Run the command: docker run  -p 5000:5000 --net isi -it isi_test test

d. Run the flask backend

	Run the command: docker run  -p 5000:5000 --net isi -it isi_test deploy

