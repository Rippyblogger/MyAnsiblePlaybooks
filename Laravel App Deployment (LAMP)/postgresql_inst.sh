#!/bin/bash

echo "Installing postgresql"

PACKAGES="postgresql postgresql-contrib"

for pkg in $PACKAGES; do
    if [ `dpkg-query -W $pkg | awk {'print $1'}` = $pkg ]; then
        echo -e "$pkg is already installed"
    else
        sudo apt -y install $pkg

        sudo systemctl status postgresql
        
        echo "Successfully installed $pkg"
        
    fi
done

echo "Creating database and granting permissions"

sudo -u postgres psql <<END_OF_SCRIPT

CREATE DATABASE examprojectdb WITH OWNER = postgres ENCODING = 'UTF8' TABLESPACE = pg_default LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8' CONNECTION LIMIT = -1;

GRANT ALL PRIVILEGES ON DATABASE "examprojectdb" to postgres;

END_OF_SCRIPT

echo "Postgresql database set up"

