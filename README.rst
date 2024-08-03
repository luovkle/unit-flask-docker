Flaskr with NGINX Unit in Docker
======

This repository contains the Flaskr blog application from the official Flask `tutorial`_, adapted to run in a production environment using NGINX Unit and Docker. These modifications enable the Flaskr app to be deployed with NGINX Unit as the application server, providing a robust and scalable setup while keeping the codebase familiar to those following the tutorial.

.. _tutorial: https://flask.palletsprojects.com/tutorial/


Warning
-------

This project only adapts the Flaskr tutorial app to run with NGINX Unit. For a truly production-ready application, there are several important considerations:
    
- Use a production-grade relational database like PostgreSQL or MySQL instead of SQLite.
- The app’s `SECRET_KEY` is hardcoded as "dev," which is a security risk. Set a dynamic value for `SECRET_KEY` in your configuration.
    
These and other details are mentioned in the official Flask tutorial. The purpose of this repository is solely to demonstrate deploying the project with NGINX Unit, keeping the rest of the code familiar for those following the tutorial.


Install
-------

**Be sure to use the same version of the code as the version of the docs
you're reading.** You probably want the latest tagged version, but the
default Git version is the main branch. ::

    # clone the repository
    $ git clone https://github.com/pallets/flask
    $ cd flask
    # checkout the correct version
    $ git tag  # shows the tagged versions
    $ git checkout latest-tag-found-above
    $ cd examples/tutorial

Create a virtualenv and activate it::

    $ python3 -m venv .venv
    $ . .venv/bin/activate

Or on Windows cmd::

    $ py -3 -m venv .venv
    $ .venv\Scripts\activate.bat

Install Flaskr::

    $ pip install -e .

Or if you are using the main branch, install Flask from source before
installing Flaskr::

    $ pip install -e ../..
    $ pip install -e .


Run
---

.. code-block:: text

    $ flask --app flaskr init-db
    $ flask --app flaskr run --debug

Open http://127.0.0.1:5000 in a browser.


Test
----

::

    $ pip install '.[test]'
    $ pytest

Run with coverage report::

    $ coverage run -m pytest
    $ coverage report
    $ coverage html  # open htmlcov/index.html in a browser


NGINX Unit
----------

1. Build the Docker image::

    $ docker build -t unit-flask-docker .

2. Run the Docker container::

    $ docker run --rm -p 80:80 unit-flask-docker

Open http://127.0.0.1 in a browser.
