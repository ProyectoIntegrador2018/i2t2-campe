# i2t2-campe Program: Deployment
## Table of contents

* [Preconditions](#Preconditions)
* [Clone or update repository](#Clone-or-update-repository)
* [Deploying to Heroku](#Deploying-to-Heroku)

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
There are two options, either to deploy to the current heroku project that is hosting the website ([I2T2 Capital Humano](https://i2t2-capital-humano.herokuapp.com)) or create a new project to host the app.

Make sure you are logged in to Heroku on your terminal session.

#### Set current project
If you're deploying to the current project run the following command:
```bash
$ heroku git:remote -a i2t2-capital-humano
```

#### Set new project
Run the following command to setup your environment with Heroku:
```bash
$ heroku create
```
#### Deploy
To push deploy the current master branch to Heroku, run:
```bash
$ git push heroku master
```
If it's the first time deploying the project you'll need to create the database, run:
```bash
$ heroku run rails db:create
```

Finally, run the database migrations on your Heroku application:
```bash
$ heroku run rails db:migrate
```
