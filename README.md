RStudio in a Docker Container
=============================

What is this?
-------------
This project is an example of running RStudio from within a Docker container.
In addition to the basic RStudio server, the container also has the knitr and
Rmarkdown libraries so it is easy to create nicely formatted output. There is 
also just enough of TeX to allow knitr to generate PDF output.

How to build 
------------

Build the container with the command
```
sudo docker build -t="r-studio" .
```

Run using the default password from the Dockerfile build script:
```
sudo docker run -d -p 0.0.0.0:8787:8787 -i -t r-studio
```

PROTIP: You will probably want to  something more secure than an account
named guest with the password guest, so you will probably want to edit the 
Dockerfile and fix that.

Since the build file points directly at quite a few R extensions in the CRAN 
repository, and since those extension are being updated, there is the distinct possibility
that the build file will complain about not being able fetch a specific library.
If this happens, look through the file list here: http://cran.r-project.org/src/contrib/
to find the new version of the library and update the Dockerfile.


How to run 
------------

To access the app, point your web browser at
    http://your.hostname.here:8787/


You will be prompted to login. Use the username 'guest' and the password 'guest'

