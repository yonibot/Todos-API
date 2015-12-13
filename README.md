# Todos API

This is the Rails API server for the React Native Tutorial (upcoming).

The API server can be accessed via curl/Postman/etc at [https://todosapi-rails.herokuapp.com/items](https://todosapi-rails.herokuapp.com/items).

## Usage

##### Create a New User
Send a POST request to api_url/users:
```
  {user: {"email": "joe@example.com", password: "donkeybrains"}}
```
The api will return a user object containing a token. The token will need to be sent with all todo item requests.

##### Login
Send a POST request to api_url/login:
```
  {user: {"email": "joe@example.com", password: "donkeybrains"}}
```

##### New Todo Item
Send a POST request to api_url/items:
```
  // header: AUTH-TOKEN: XXX-XXX-XXX-XXX
  {item: {"content": "joe@example.com", completed: false, user_id: 1}}
```

* [@yoniweisbrod](https://twitter.com/yoniweisbrod)
* [http://www.yoniweisbrod.com](http://www.yoniweisbrod.com)
