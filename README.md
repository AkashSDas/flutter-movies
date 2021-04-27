# flutter-movies

Beautiful flutter app where you can search movies. The app uses [OMDb API](http://www.omdbapi.com/) service to for movies data.

The splash screen has Rive(Flare) animation is displayed which can be found [here](https://flare.rive.app/a/AkashSDas/files/flare/flutter-movies-app-splash-screen-animation/preview). The app uses `Provider` for the movies data to be shared among widgets.

![](./docs/demo.gif)

## Getting Started

**Clone the repo**

```bash
git clone https://github.com/AkashSDas/flutter-movies
```

**Get inside the project dir and install dependencies**

```bash
cd flutter-movies
flutter pub get
```

**Open a simulator or connect a device and after that execute the below command to run the flutter app**

```bash
flutter run
```

## Security

To make `http requests` for fetching the movies data we have to add to fields in `android/` and `ios/` (this is already added in this project). If not done then you will get an error of

```bash
Bad state: Insecure HTTP is not allowed by platform: <api-url>
```

To avoid this error, follow the [stackoverflow post](https://stackoverflow.com/questions/64197752/bad-state-insecure-http-is-not-allowed-by-platform).

## License

[MIT](./LICENSE)
