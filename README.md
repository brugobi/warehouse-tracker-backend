## Wharehouse Tracker API

This is a Workout Tracker RESTFUL API built with Ruby on Rails. It uses JWT to implement Authentication & Authorization. This project is part of my Full Stack web application that can help users to keep track to keep track the quantity of material stored.

### Live Link

- [API Home](https://warehouse-api-backend.herokuapp.com/api/v1/)
- [Client App](https://brugobi.github.io/warehouse-tracker-frontend/)


### Built With

- Ruby v2.6.5
- Ruby on Rails v5.2.6
- Current API Endpoints

### The API will expose the following RESTful endpoints.

| Endpoint | Functionality  |
| :---:   | :-: | 
| POST/api/v1/authenticate |Login
| POST/api/v1/register |Signup
| GET/api/v1/items | List all Items
| POST/api/v1/items | Add new item
| DELETE/api/v1/items/:id | Delete a Item
| PUT/api/v1/items/:id | Edit a Item |

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

 - Ruby: v2.6.5 Rails: v5.2.6 Postgres: '>= 0.18', '< 2.0'

 - To get started open the directory where you will save this repo by typing on your terminal:

```
$ cd <directory>
```

- Clone the repo typing:

```
$ git clone git@github.com:brugobi/warehouse-tracker-backend.git
```
- Install dependencies:

```
$ bundle install
```

- Setup database with:

make sure you have postgress sql installed and running on your system

```
 $ rails db:create
```

```
 $ rails db:migrate
```

### Usage

- After set up the environment, run:

```
$ npm start
```
- Open in the Browser:

```
http://localhost:3001/
```

### Deploy to a live server

 - Deploying to a live server like Heroku is easy, make sure you have the necessary credentials setup on your local machine

```
$ heroku create
```
```
$ heroku rename app-new-name
```
```
$ git push heroku $BRANCH_NAME:master 
```
- if you are already in master branch no need to add $BRANCH_NAME, just use git push heroku master

```
$ heroku run rails db:migrate
```
```
$ heroku open
```

- Enjoy your newly deployed rails API

## Author

👤 **Bruna Gobi**

- Github: [@brugobi](https://github.com/brugobi)
- Twitter: [@BrunaGobi2](https://twitter.com/BrunaGobi2)
- Linkedin: [bruna-gobi](https://www.linkedin.com/in/bruna-gobi/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!
Feel free to check the [issues page](issues/).

## Acknowledgments

- Project requested by [Microverse Program](https://www.microverse.org/).
- The image was taken from THAM YUAN YUAN by [Pixabay](https://pixabay.com/pt/).

## 📝 License

This project is [MIT](lic.url) licensed.