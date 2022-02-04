# rails-api

> A simple REST API

#### Project Setup

```
rails new rails-api --api -T
```

### Features
- `GET /api/v1/users` returns list of users
- `POST /api/v1/users` accepts a new user to be added
- `DELETE /api/v1/users/{id}` delete details of specific user
- implement test each api
- implement presenters patterns

#### Data Types
```json
{
	"id": 10,
	"username": "kai",
	"email": "kai@gmail.com"
}
```