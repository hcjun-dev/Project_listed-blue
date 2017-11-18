# Listed-Blue
        __    _      __           __      ____  __
       / /   (_)____/ /____  ____/ /     / __ )/ /_  _____
      / /   / / ___/ __/ _ \/ __  /_____/ __  / / / / / _ \
     / /___/ (__  ) /_/  __/ /_/ /_____/ /_/ / / /_/ /  __/
    /_____/_/____/\__/\___/\__,_/     /_____/_/\__,_/\___/

This is the another unofficial version of Craigslist.
Don't know who the heck Craig is, and this app won't change the way it is,
but it's fun to make things like this.

## Getting Started



### Prerequisites

What things you need to install the software and how to install them.

```
c9.io
Internet connection
```

### Installing
On the environment of C9,

#### Setting up rails server configuration
    
    curl -fsSL c9setup.saasbook.info | bash --login && rvm use 2.3.0 --default
    
#### Pulling from the github
    
    git clone git@github.com:hcjun94/listed-blue.git
    cd listed-blue
    
#### Bundle Installation
    
    bundle install --without production
    bundle exec rake db:setup
    
#### Running the actual server
    
    rails server -p $PORT -b $IP
    
##### compact version
```
curl -fsSL c9setup.saasbook.info | bash --login && rvm use 2.3.0 --default
git clone git@github.com:hcjun94/listed-blue.git
cd listed-blue
bundle install --without production
bundle exec rake db:setup

rails server -p $PORT -b $IP
```

## Built With

* [C9.io](http://c9.io/) - The web framework used
* [heroku](https://heroku.com/) - Dependency Management


## Versioning

We use [github](http://github.com/) for versioning.

## Authors

Levi VonBank,
Eric Jun,
Caleb Fox,
Bony Sany

## License

This project is licensed under the MIT License.

## Acknowledgments

* Special Thanks to Jonathan Hardwick, our professor of IT484 class.

## Known Bugs

* Shared C9 workspace with github does not show who did the commit.
* C9 still shows the color of the person did the work.
