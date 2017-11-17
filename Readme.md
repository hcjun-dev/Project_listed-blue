    __    _      __           __      ____  __         
   / /   (_)____/ /____  ____/ /     / __ )/ /_  _____ 
  / /   / / ___/ __/ _ \/ __  /_____/ __  / / / / / _ \
 / /___/ (__  ) /_/  __/ /_/ /_____/ /_/ / / /_/ /  __/
/_____/_/____/\__/\___/\__,_/     /_____/_/\__,_/\___/ 
                                                       

Hello world!

    This is the another unofficial version of Craigslist.
    Don't know who the heck Craig is, and this app won't change the way it is,
    but it's fun to make things like this.

Authors:
    Levi VonBank,
    Eric Jun,
    Caleb Fox,
    Bony Sany

Installation (Cloud 9)

    curl -fsSL c9setup.saasbook.info | bash --login && rvm use 2.3.0 --default
    git clone git@github.com:hcjun94/listed-blue.git
    cd listed-blue
    bundle install --without production
    bundle exec rake db:setup

    rails server -p $PORT -b $IP