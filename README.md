# Flight Booker

This is a small website that mimics the flow of booking a one-way flight in the United States.

![picture of Flight Booker's main page](https://raw.githubusercontent.com/JoshDevHub/Flight-Booker/main/site_image.png)

## Getting Started / How to Use

You can visit the live site on [Heroku](https://cryptic-dawn-66962.herokuapp.com/). Note that because I'm on a free plan, the dyno hosting this site will regularly sleep. This can make the app slow to load on initial visits as the dyno may need to 'wake up'.

For running this app locally, you'll want to first have the following prerequisites:
```
Ruby >= 3.0.3
Rails >= 7.0.2
Bundler >= 2.2.32
PostgreSQL >= 12.9
```

You can then clone this repo, `cd` into the project's root directory, and enter the following commands to get set up:
```sh
bin/setup 
bin/rails db:seed
bin/dev
```
You can then visit http://localhost:3000/ in your browser to view the site locally.

## Current Features

- Ability for users to search for flights using departure airport, arrival airport, and the flight's date
- Ability for users to book a flight with up to 4 passengers for each booking
- Ability to search bookings via passenger email addresses
- Responsive styles using the Tailwind CSS framework.

## Reflections

This project was an opportunity to work with more complex forms and model relationships. With the way `Passengers` belong to `Bookings` with both objects needing to be created from the same form, I had to learn how to use nested attributes to have everything working smoothly.

This was also the first Rails project where I felt comfortable enough in the Rails environment to incorporate testing. I used RSpec for testing and FactoryBot to help with creating dummy data for my test scenarios. I TDD'd the `Flight` model's methods (the only model in this project that I felt needed methods), and I also systems tested the creation of a new `Booking` using Capybara.

In addition to testing, this was the first project where I used the [Tailwind](https://tailwindcss.com/) CSS framework. I really enjoyed working with it, and it'll probably be the way I style my own personal projects moving forward. The utility class workflow took some getting used to, but after some time, it felt natural to me. 

## Improvements

I could do a number of things to increase the verisimilitude of the project:
* Current flight durations are completely random, whereas I could seed the database in a way that maps the duration to how long it would actually take for a flight between the locations to occur in real life.
* I could add more columns onto the existing models to reflect some other identifying information these entities would have in real life. A few that occur to me: Airports having a "city name", Flights having a "flight number", and Bookings having a "confirmation number".
* Current flight dates will grow stale after 30 days, as this is how far into the future I've built the database seeds to handle. Having this data work for long periods of time won't work on small, free databases, but I could work out some way to keep this data regularly updated while cleaning up data on past-flights.
* I could allow passengers to cancel or update their bookings.

## Special Thanks

To [The Odin Project](https://theodinproject.com) :heart: