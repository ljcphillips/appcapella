# AppCapella

Our Final Project at Makers Academy! Our goal is to create a web application that allows the user to record multiple videos (up to four) with sound and be able to play them at the same time, layering the recordings to produce a unique acapella-like song in one combined video.

## Getting Started
To run the program, clone this repo into your local computer:
`git clone https://github.com/ljcphillips/appcapella.git`

This app uses the testing gems `rspec` for feature tests, `simplecov` for test coverage, and `rubocop` for code quality. The gem `shotgun` is used to run the web app on the browser, as well as other gems needed to create the webpages.

To install the required gems in the terminal:
```
bundle install
```
or
```
gem install bundler
```

You will also need to install FFMpeg in order to be able to view the videos. To install from terminal using Homebrew:
```
brew install ffmpeg
```

## Usage
To start the browser, in terminal:

run `ruby app.rb`

Navigate to `http://appcapella.herokuapp.com/`

## User Stories
```
As a user
So that I can listen & watch recordings
I want to be able to play the videos
```
```
As a user
So that I can see what the layered recordings would sound like
I want to be able to playback all videos at the same time
```
```
As a user
So that I can have all my recordings in one video
I want to be able to mix the videos together
```
```
As a user
So that I can see the mixed video
I want to be redirected to a page with my mixed video
```
```
As a user
So that I can show my friends my mixed video
I want to be able to share it on Facebook
```

## Built Using
* Ruby - language
* RSpec - for TDD and BDD
* Sinatra - rack-based web framework
* Capybara - for web app testing
* Heroku - deployment platform

## Authors
* Lorraine Phillips - [ljcphillips](https://github.com/ljcphillips)
* Daniel Tooke - [djtooke](https://github.com/djtooke)
* Mona Al-Haery - [Mona88](https://github.com/Mona88)
* Marwa Elali - [marwiz108](https://github.com/marwiz108)
