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

## Resources

### Project

- [Sample repo](https://github.com/brainlid/pwa-bookit-sample/)
  - 2 branches
- [Commit adding TailwindCSS and Alpine.js](https://github.com/brainlid/pwa-bookit-sample/commit/07bc228338d66a4ac96c80975baa4a8cfd13a82d)
- [Podcast: #021 Tailwind CSS, Alpine.js and LiveView with Patrick Thompson](https://thinkingelixir.com/podcast-episodes/021-tailwind-css-alpine-js-and-liveview-with-patrick-thompson/) - Show notes has lots of great Tailwind and Alpine resources.

### PWA Resources

- [Video](https://www.youtube.com/watch?v=KzvK809rl3Q)
- [Blog post](https://samselikoff.com/blog/8-tips-to-make-your-website-feel-like-an-ios-app)
- [MDN env(safe-area-inset-*)](https://developer.mozilla.org/en-US/docs/Web/CSS/env())
- [Google's Progressive Web Apps guide](https://web.dev/progressive-web-apps/)

### Understanding the State of the Art

Deals with platform differences and things like Push Notifications.

- [The state of PWA support on mobile and desktop in 2020](https://simplabs.com/blog/2020/06/10/the-state-of-pwa-support-on-mobile-and-desktop-in-2020/)
- [Progressive Web Apps: Core Features, Architecture, Pros and Cons](https://www.altexsoft.com/blog/engineering/progressive-web-apps/)
- [What are Progressive Web Application Push Notifications?](https://love2dev.com/pwa/push-notifications/)