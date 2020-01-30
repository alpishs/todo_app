Todo App:

Write a Rails application for managing projects weekly to-do list.
In an organization project manager generally work with multiple projects, multiple teams, team
member.
Often it happens, he misses out some of the minute details like who is working on what at current point
of time.
Also sometimes it may happen,in a day, some team members are too busy but some are free.
You have to build a system which will help the project manager in creating a to-do list for project and
help to show status of system at any given point of time.
1. System should have well defined authentication system (Use any gem like Devise)
2. System should have well defined authorization system (You can use gem like 'cancan' or just
build your own way of handling it)
3. System has only two roles
1. admin(Project Manager)
2. developer
4. As admin,
3. He/She should be able to create a project
4. He/She should be able to create a todo for project (e.g "Design database for feature X")
5. He/She should be able to assign a todo to developer
6. He/She should be able to add developer to project (Note: Project can have many
developers and developer can have many projects)
5. As developer,
1. He/She should be able to see a todo list for him.
2. He/She should be able to mark is 'in progress' or 'Done'.
3. He/She should not be able to access other options like creating projects, list of
developers etc. (i.e. he/she should be able to perform above 2 actions only)
6. On admin's dashboard (After login page),
1. At any given point of time he will see a list of all developer list with todo in following
format.
2. Show the same view as above, but instead of developer it should show data
project-wise.
3. Also show graph using google chart api (https://developers.google.com/chart/)
Show project-wise pie chart for todo's status like, 5 is in Done state, 10 is in new State and 4 is in
progress


Sample Data

Admin Login Credentials:
email: test_projectmanager@test.com
password: password


Developers
vikas@promobitech.com - test1234
hajel@promobitech.com - test1234
alpish@promobitech.com - test1234


The Application has been deployed on Heroku and can be seen via this URL: https://polar-atoll-34989.herokuapp.com/

Steps for setup the application to your local machine
Clone it from GitHub
cd "proj_name"
bundle
rake db:create
rake db:migrate
rake db:seed
rails s
Open browser and open http://localhost:3000 url
