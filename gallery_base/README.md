# gallery_base

Implementation Notes

Setup
```
run Flutter pub get
```

Deployment

This application has been tested and developed on both web and android phone, where web would emulate larger screen devices and resizability of the ui.

To Run Web
```
run ./run-web.sh #note the default renderer on web is canvas, the script uses html which is default on devices too. Not using this option on web will make the images not load within the view
```

To Run Android
run Flutter run -d device_id

Testing

```
- Service tests run ./run-test-integration.sh
- Integration tests run ./run-test-services.sh
```

Permissions

- Internet prermission xml has been added to AndroidManifest for production builds

Networking

- https://jsonplaceholder.typicode.com/albums/1
exists, however the size of the data being loaded into the client was negliable, there would be no need to use this url in the current application

Error handling

- Network errors on list and grid pages have error message to allow you to ensure you have an internet connection then tap to refresh
- A generic error is also given

Testing Coverage

- I have put in unit tests where it practically makes sense, and have left out tests for tests that already cover testing the functionality.
- I have also given an integration test suite to ensure that the data comes back as expected
- The tests cover the gateway (network) layer and the services within the app

Future Improvments

Unfortunately with limited time to create the project at late notice here are the following that would have been added
- Better styled UI instead of the default
- Left to right slide over view transitions
- Media query to render more friendly views for larger devices then rendering at set view ports
- A UI test suite
- Dependency injection (services / gateway (providers))
- Better Hero implementation to animate on first load of detail view image (currently only does so after the image has already been loaded into memory and you are tapping on the thumbnail again)