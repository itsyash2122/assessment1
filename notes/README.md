**Set up your environment:**

Install Node.js: Download and install Node.js from the official website: https://nodejs.org/
Install MySQL: Download and install MySQL from the official website: https://dev.mysql.com/downloads/installer/
Create a new directory for your project and navigate to it in your terminal.
**
Install dependencies:**
Install the required Node.js packages for the backend:

"npm install express mysql body-parser"


**Set up the MySQL database:**

Create a MySQL database and a table for the notes items. You can use a tool like phpMyAdmin or run SQL commands directly in your MySQL command-line interface.

CREATE DATABASE notes_app;
USE notes_app;

CREATE TABLE notes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT
);



**Change the backend MySQL conf:**
Replace 'your_mysql_username' and 'your_mysql_password' with your MySQL username and password.

**For the frontend:**
Install nginx on your ec2 machine.

"apt-get install nginx"
"systemctl enable nginx"

Create and nginx file in notes.conf in /etc/ngin/sites-enabled
and then test the nginx conf

"nginx -t"
"systemctl start nginx"


Start your application:
Run the following command to start your Node.js application:

**For testing purpose:**

"node server.js"
Your Notes application should now be running on http://localhost:3000. Open a web browser and go to that URL to access your simple Notes application.

Now to deploy it in background

Install pm2 using "npm instal pm2 -g"

"pm2 start server.js"

Your application is now up....




