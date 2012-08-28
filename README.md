Cowboy Hello World on Heroku
============================

Super simple Hello World Cowboy app suitable for running on Heroku:

```
heroku create my-cowboy-heroku-demo -s cedar
heroku config:add BUILDPACK_URL=http://github.com/heroku/heroku-buildpack-erlang.git
git push heroku master
```

See https://github.com/extend/cowboy for more on Cowboy.
