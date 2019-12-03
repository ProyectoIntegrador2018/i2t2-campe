# i2t2-campe Program: Deployment

The I2T2 Campe repository is currently set-up to automatically deploy any changes made to the master branch onto the staging environment: [Heroku Staging](https://radiant-bayou-47421.herokuapp.com/), and subsequently to production after approval. This instructions are tailored specifically for anyone interested in deploying the application into a new Heroku instance.

## Table of contents

* [Preconditions](#Preconditions)
* [Clone or update repository](#Clone-or-update-repository)
* [Deploying to Heroku](#Deploying-to-Heroku)
* [Additional references](#Additional-references)

### Preconditions
Having the following tools installed and configured:
- Git ([Instrucciones](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git))
- Heroku CLI ([Instrucciones](https://devcenter.heroku.com/articles/heroku-cli#download-and-install))

### Clone or update repository
If you don't have a copy of the repository, you will have to clone it first:
```bash
$ git clone git@github.com:ProyectoIntegrador2018/i2t2-campe.git
```

Run the following command to make sure everything is up to date:
```bash
$ git status
```

You should see the following message:
```
On branch master
Your branch is up-to-date with 'origin/master'.
```

If not, make sure your working directory is clean and that the local branch is up to date:
```bash
$ git pull origin master
```

### Deploying to Heroku

Make sure you are logged in to Heroku on your terminal session. Run the following command to setup your environment with Heroku:
```bash
$ heroku create
```

To push deploy the current master branch to Heroku, run:
```bash
$ git push heroku master
```
To push deploy the current master branch to Heroku, run:
```bash
$ heroku run rails db:create
```

Finally, run the database migrations on your Heroku application:
```bash
$ heroku run rails db:migrate
```
