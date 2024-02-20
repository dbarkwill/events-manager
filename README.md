# Event Manager Application
---
This web application is powered by Ruby on Rails and runs inside several docker containers, to make the application portable and easy to rebuild. 

Before attempting to use the application, Docker must be setup and running on the machine hosting the application. For help, look up a guide on how to setup docker on your chosen platform.

This application consists of several containers that are linked together in a Compose file. The basic architecture is as follows:

- **Web** - This container is the core of the application. It consists of the code and the engine to process / render the webpages. The application uses Ruby on Rails with Unicorn as its front-end.
- **DB** - This container hosts the database for the application. It utilizes Postgres as the database engine.
- **Proxy** - This container utilizes nginx to allow clients to communicate with the web front end. 
- **Redis** - This container provides caching capabilities to the application.
- **Management** - This container is to provide web-based management capabilities to be able to restart containers and look at their logs.

## Getting Started
---
Before you get started, make sure you have a functioning Docker setup on your host server. Additionally, it is helpful to have Git installed to be able to clone the repository to the server.

1. Clone or copy the contents of this repository to the host server by running `git clone https://github.com/dbarkwill/events-manager.git` or by downloading the ZIP file and extracting it to your preferred directory.
2. Run `setup.sh` to configure the passwords and secrets used by the application. It will prompt for the database password and the Portainer admin password. Running this script will also generate the secret token used to encrypt secrets by the application. All of this information will be added to the .env file, used by the containers to finish configuration. This step may take a few minutes while it builds the main application.
3. Run `docker compose up` (or `docker compose up -d` to launch in detached mode) to start the application. On the first boot, it will download the remaining containers, build the application again if necessary, and then start all containers. It will also create the initial database and set a few defaults for the settings.
4. Open a web browser and navigate to the application. It should be the servers IP address on port 80. Currently no SSL is configured, but it can be added in the NGINX configuration if needed.
5. After reading through the first time launch screen, you can login to the software and navigate to Admin -> Import Customers to import the list of customers that can attend the event. In that same admin portal, you can upload the registrations once that data has been received and create additional employee accounts if needed.
6. Under Admin -> Settings, an event name can be entered (just used for the check-in page), the total number of meals purchased (not just extras), and an instance name if you are running multiple copies of the application on different servers, for redundancy. 
7. Once the event is finished, you can navigate to Admin -> Export Attendance to get a CSV of the individuals who were checked into the event. 

For troubleshooting, you can launch the Portainer administrator interface (hosted on port 9000) and login with the credentials set during the setup script in step 2. If you forget the password, it is contained in the .env file for the application, in plain text.

To completely remove and recreate the application, you can run `docker compose down -v --rmi all` to remove all containers and the volumes. **This will remove the volume for the database as well, so all data will be lost**

## Troubleshooting

During an event itself, not much troubleshooting is required. If representitives are not receiving the push updates about meal counts and attendees, a refresh of the browser usually solves the issue. Additionally, all web transactions are logged to STDOUT in docker, so you can either look at the docker compose interface (`docker compose logs web -f`) or from within Portainer. 

If there are issues importing the customers or registrations, make sure that the file type is a standard CSV and only contains the headers listed on the import page. Also make sure to read the descriptions as to what is required and what is optional. 