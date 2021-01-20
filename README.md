# Pwa

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Resources

  * PWA Tips: https://www.youtube.com/watch?v=KzvK809rl3Q

## Project Notes

Created the project using:

```
mix phx.new pwa --live --no-ecto
```

Generated LiveView resource pages

```
mix phx.gen.live Books Book books title:string author:string
```

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

## Fix Header

Can't control the iOS time display. It will show as white. So we need our header to be darker so the white shows up well.

Challenge: Apple's "notch"

Add custom "standalone" media query so we can adjust based on being in a full browser versus our standalone mode.

Update `tailwind.config.js`. When adding standalone, must also add the defaults. Otherwise they are overridden and lost. [Defaults](https://tailwindcss.com/docs/theme)

Now our scrolling experience is improved.

