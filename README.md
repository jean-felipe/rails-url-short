# Rails Url Short

* To Run this project:
- Install ruby 3.1.2 using rvm or what you prefer.
- Having installed postgres

- Run the command `rails db:create db:migrate` in order to have the database setup
- RUn the command `bundle install` in order to install all dependencies
- Run the command `rails s` in order to start the server

*** Requests
- Create the short url:
```json
POST http://localhost:3000/short_urls
body:
{
   "short_url": {
       "original_url": "http://facebook.com"
   }
}
```

Response:
```json
{
    "id": 4,
    "original_url": "http://facebook.com",
    "shorted_url": "e",
    "title": "Facebook – entre ou cadastre-se",
    "redirects": 0,
    "created_at": "2022-12-23T14:36:59.979Z",
    "updated_at": "2022-12-23T14:37:00.005Z"
}
```

GET short URL:
```json
GET http://localhost:3000/e

Response:
{
    "redirects": 1,
    "id": 4,
    "original_url": "http://facebook.com",
    "shorted_url": "e",
    "title": "Facebook – entre ou cadastre-se",
    "created_at": "2022-12-23T14:36:59.979Z",
    "updated_at": "2022-12-23T14:41:07.865Z"
}
```

## Additional
In order to execute the unit tests run: `rspec`
