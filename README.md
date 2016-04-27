### Movie Database

-- Techflex Rails Homework

* 
* URL: [http://techflex-hw-yimengli.herokuapp.com/](http://techflex-hw-yimengli.herokuapp.com/)

#### Data Scheme

* Users(User_ID, User_Name, Email, Password, isAdmin)
* Movies(id, content, User_ID, )

#### Tips
* Run the server on c9 ide
```Bash
$ rails server -b $IP -p $PORT
```  
* Run Minitest
```Bash
$ bundle exec rake test
```
* Reset the database
```Bash
$ bundle exec rake db:migrate:reset
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
* Heroku console
```Bash
heroku run console --sandbox
```

*****
#### Requirements:
- [x] Your website should be in the Ruby on Rails Framework.
- [x] Your example must run on Heroku, and your code must be on GitHub.
- [ ] You should have an administrative interface to add in new movies.
- [ ] The moives should have a picture field, to upload a DVD cover, or movie poster cover.
- [ ] The movie should have a description of the movie; a synopsis.
- [ ] Your homepage should consist of a searchable list of movies, including an average review score from users.
- [ ] Users should not be able to review the same movie twice.
- [ ] Reviews should consist of a score and a comment
- [ ] Put your best foot forward; make sure the front-end looks as nice as possible


#### Optional:

- [ ] The URL for the movies should be friendly. Instead of showing [/movies/7], make it say something such as [/movies/Iron_Man] or [/movies/iron_man] for your query string. 
- 
- [x] Send an email to new users thanking them for signing up.