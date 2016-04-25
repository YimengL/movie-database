### Movie Database

-- Techflex Rails Homework

* 
* URL: [techflex-hw-yimengli.herokuapp.com](techflex-hw-yimengli.herokuapp.com)

#### Data Scheme

* Users(User_ID, User_Name, Email, Password, isAdmin)
* 

#### Tips
* Run the server on c9 ide
```Bash
$ rails server -b $IP -p $PORT
```  
* Run Minitest
```Bash
$ bundle exec rake test
```

* Database Migrate
```Bash
$ bundle exec rake db:migrate
```
* Rollback Migrate
```Bash
$ bundle exec rake db:rollback
```
* Run on Heroku
```Bash
$ bundle exec rake test
$ git push heroku
$ heroku run rake db:migrate
```