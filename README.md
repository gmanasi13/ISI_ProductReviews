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
	1. Create docker file for backend flask application as in under app/Dockerfile
	2. Create docker file for postgres database as in under database/Dockerfile. The init.sql file under database/ will insert the initial data into the tables.
	3. Use 'docker-compose up --build' to build and run the containers.	


c. Run the test suite that tests all the APIs
	1. Navigate to app/
	2. Run "python3 test_productreviews.py"

d. Run the flask backend
	1. Navigate to app/
	2. Run "flask run"
		OR
	   "python3 app.py"

Additional information:
to insert the initial data, run the following command 
psql -h localhost -d isi -w -f "init.sql"
