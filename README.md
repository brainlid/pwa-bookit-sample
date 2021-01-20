# Pwa

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Project Notes

Created the project using:

```
mix phx.new pwa --live --no-ecto
```

Generated LiveView resource pages

```
mix phx.gen.live Books Book books title:string author:string
```



## Hosting

Used [Wojtek Mach's Phoenix Example](https://github.com/wojtekmach/phoenix_example) for one-click deployments. Configured for Heroku.

Deployed the master branch and the pwa branch to Heroku as separate apps for easier side-by-side comparisons.

Added the buildpacks manually in the Heroku interface.