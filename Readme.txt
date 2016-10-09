Friend Finder 

HTML,Bootstrap,JSP,Tomcat,MySQL


I have tried to replicate Facebook.
Functionalities of my website :-
Registration
Fill in your details
Login
Searching

Below are the steps to run it :-
SQL Database
1. Create a schema named website
2. In the schema, create a table named users
3. The users table has following columns:
	a. userid, PK amd NN
	b. fname, NN, varchar(20)
	c. lname, NN, varchar(45)
	d. email, NN, varchar(45)
	e. password, NN, varchar(45)
	f. univ, NN, varchar(45)
	g. batch, NN, varchar(45)
	h. major, NN, varchar(45)
4. Create the columns in the order mentioned above

Running the Website:

Without IDE

1. Copy the entire FriendFinder Folder into webapps of TOMCAT
2. To the classpath (in Environment Variables), add the mysql connector present in WEB-INF/lib folder
3. Start TOMCAT server by running startup.bat from cmd window in the TOMCAT/bin folder
3. Run the project from the browser by typing http://localhost:......./FriendFinder/index.html

With IDE (Eclipse)
1. Create New Dynamic Web Project
2. Add any server while creating the new project
3. A file directory structure is created 
4. To the /Web Content/WEB-INF/lib folder drag and drop the mysql connector
5. Right click on the Project and select Properties->Java Build Path->Libraries->Add External JARs
   and add the mysql connector
6. Copy all the .html and .jsp files to /Web Content folder and not to WEB-INF
7. Press the run button