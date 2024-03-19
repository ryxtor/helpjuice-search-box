# Helpjuice Search box

> The goal of this project is to create a web application that revolves around a compilation of articles. The main emphasis is on establishing a powerful search feature. This feature will not only enable users to find articles with ease but also ensure that search queries are meticulously captured and cleaned for further analysis purposes.

## Key Features
 - Efficient Search: Users can quickly find articles by titles through an optimized search feature, ensuring relevant results are always at the forefront.

 - Trending Insights: Stay updated with the most popular searches, as the application highlights trending queries, reflecting the collective interest of the user base.

 - Personalized Search History: Each user's search history is meticulously recorded, allowing for easy revisitation of previously explored topics.

 - Query Sanitization and Analysis: The application goes beyond mere search logging; it systematically sanitizes and stores search queries, paving the way for in-depth analytical studies on user search behavior and preferences.

## Built With


- Ruby 3.2.2 <img align="left" alt="Ruby" width="26px" src="https://github.com/get-icon/geticon/raw/master/icons/ruby.svg" />
  
- Ruby on Rails 7.1.2 <img align="left" alt="Rails" width="26px" src="https://github.com/get-icon/geticon/raw/master/icons/rails.svg" />
  
- PostgreSQL <img align="left" alt="Postgresql" width="26px" src="https://github.com/get-icon/geticon/raw/master/icons/postgresql.svg" />
  
- Tailwind <img align="left" alt="Tailwind" width="26px" src="https://github.com/get-icon/geticon/raw/master/icons/tailwindcss-icon.svg" />


## Getting Started

### Live demo

[Helpjuice Search Box](https://helpjuice-search-box.onrender.com//)


### Prerequisites

- Ruby
- Postgres server

### Setup

Clone this repo and enter the directory.

```sh
git clone git@github.com:ryxtor/helpjuice-search-box
cd helpjuice-search-box
```

### Install

Run the following command to install all the dependencies.

```sh
bundle install
```

### Usage

Run the following commands to start the server, then go to http://localhost:3000

```sh
rails db:create # create database
rails db:migrate # migrate tables
rails db:seed # load all data in database from seed.rb

bin/dev # necessary to start the app for the first time
---- or ----
rails s # can be used after starting the app at least once
```

## Author

|    👤    | **Lucas Bonnefon**                                             |
| ------------ | ----------------------------------------------------        |
| **GitHub**   | [@ryxtor](https://github.com/ryxtor)                |
| **LinkedIn** | [Lucas Bonnefon](https://www.linkedin.com/in/lucasbonnefon/)|

## Show your support

Give a ⭐️ if you like this project!
