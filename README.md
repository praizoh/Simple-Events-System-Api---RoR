# SIMPLE EVENTS SYSTEM API

Simple events system api is a backend application built with ruby on rails for an managing an event. Users can create events and create tickets for these events on the fly

**Features Implemented**
1. User signup
2. User Login
3. Create Event
4. Get All Events
5. Get Events Created By A User
6. Get Event By Id
7. Update an Event
8. Create Ticket For An Event
9. Fetch all tickets for an event

_____

## Technologies Used
* [Ruby on Rails](https://guides.rubyonrails.org/v6.1/) - Rails is a web application framework running on the Ruby  programming language.
* [JWT](https://jwt.io/introduction) - JSON Web Token (JWT) is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object.
_____

## API Information
The API endpoints are hosted on Heroku - [Simple Events System Api](https://shrouded-mountain-31182.herokuapp.com/)
The GitHub Repo: https://github.com/praizoh/Simple-Events-System-Api---RoR

____
## The Endpoints can be accessed remotely or locally.


#### Accessing the endpoints remotely via POSTMAN
You will need to have [POSTMAN](https://www.postman.com/) app installed on your computer.

### Documentation Link
https://documenter.getpostman.com/view/8738160/2s83zdvR8N

##### Example 
###### Sign In
1. Launch POSTMAN
2. Click the dropdown menu to the left of the URL bar and select POST as a method.
3. To access the Sign In endpoint, at the end of Quick Credit's URL attach the sign in endpoint to it as seen in step 4
4. https://shrouded-mountain-31182.herokuapp.com/api/v1/auth/login
5. Then paste the full URL in the URL bar.
6. Click 'Body' tab below the URL, then select raw radio button, JSON format.
7. Fill in the required fields correctly.
8. Click the blue Send button to the right of the URL bar.
9. And wait for a response below.

#### Accessing the endpoints locally via POSTMAN

1. On the terminal of your computer, navigate into the cloned repo's folder
2. Type `rails -v` to be sure you have rails installed on your pc, if not `gem install rails`
3. Clone simple events api repo https://github.com/praizoh/Simple-Events-System-Api---RoR` on your local machine.
4. Run `bundle install` to install All of the dependencies.
5. Run `rails s` to power up the server.
6. The procedure for using POSTMAN here is the same as when accessing the endpoint remotely except that you make use of http://localhost:3000/api/v1 as the full URL's prefix in place of the app's URL on heroku
e.g To access Sign In endpoint you will have a full URL like http://localhost:3000/api/v1/login


## Author
### AKANDE OREMEI CHAMUKE(PRAISE)

