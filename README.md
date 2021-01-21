# PWA 

LiveView configured as a Progressive Web Application.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

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

- [8 Tips to Make Your Website Feel Like an iOS App - YouTube video](https://www.youtube.com/watch?v=KzvK809rl3Q)
- [8 Tips to Make Your Website Feel Like an iOS App - Blog form](https://samselikoff.com/blog/8-tips-to-make-your-website-feel-like-an-ios-app)
- [MDN env(safe-area-inset-*)](https://developer.mozilla.org/en-US/docs/Web/CSS/env())
- [Google's Progressive Web Apps guide](https://web.dev/progressive-web-apps/)

### Understanding the State of the Art

Deals with platform differences and things like Push Notifications.

- [The state of PWA support on mobile and desktop in 2020](https://simplabs.com/blog/2020/06/10/the-state-of-pwa-support-on-mobile-and-desktop-in-2020/)
- [Progressive Web Apps: Core Features, Architecture, Pros and Cons](https://www.altexsoft.com/blog/engineering/progressive-web-apps/)
- [What are Progressive Web Application Push Notifications?](https://love2dev.com/pwa/push-notifications/)


## Generate Icon and Splash

Using [pwa-asset-generator](https://github.com/onderceylan/pwa-asset-generator)

```
npm install --global pwa-asset-generator
```

```
npx pwa-asset-generator book-solid.svg ./assets/static/images -m ./assets/static/site.webmanifest --padding "calc(50vh - 25%) calc(50vw - 25%)" -b "linear-gradient(135deg, #2fb9e4, #FF0098)" -q 100 -i ./pwa-generator-index.html --favicon
```

Don't let it update your "EEx" template. It runs an HTML formatter on the file but doesn't understand `<%= %>` and breaks it. I created a placeholder index page that it could operate on then I copy out the changes.

Sample generated header data:

```html
<link rel="icon" type="image/png" sizes="196x196" href="assets/static/images/favicon-196.png">

<link rel="apple-touch-icon" href="assets/static/images/apple-icon-180.png">

<meta name="apple-mobile-web-app-capable" content="yes">

<link rel="apple-touch-startup-image" href="assets/static/images/apple-splash-2048-2732.jpg" media="(device-width: 1024px) and (device-height: 1366px) and (-webkit-device-pixel-ratio: 2) and (orientation: portrait)">
<link rel="apple-touch-startup-image" href="assets/static/images/apple-splash-2732-2048.jpg" media="(device-width: 1024px) and (device-height: 1366px) and (-webkit-device-pixel-ratio: 2) and (orientation: landscape)">
```

Update in the following ways:

- Change the `href` from `href="assets/static/images/favicon-196.png"` to `href="<%= Routes.static_path(@conn, "/images/favicon-196.png") %>"`
- Change the ending from `">` to `" />`

```html
<link rel="icon" type="image/png" sizes="196x196" href="<%= Routes.static_path(@conn, "/images/favicon-196.png") %>" />
```
