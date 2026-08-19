# Reddit Web Unblock

A Firefox extension that unblocks the [Reddit] mobile website.

## Installation

Add the extension to Firefox for Android from [Firefox Add-ons].

## Development

This project uses [Devbox] to manage the development environment. See how to
install it [here].

With Devbox installed, start a new shell:

```sh
devbox shell
```

On your Android device:

- Install [Firefox].
- Enable USB debugging. The steps may vary depending on the device, but
  [this tutorial] is a good starting point.
- Connect it to your computer with a USB cable. When prompted, allow USB
  debugging for the connection.
- In the Firefox settings, enable "Remote debugging via USB".

Back to your computer, create an environment file from the template:

```sh
cp .env.example .env
```

Set the environment variables in the `.env` file, following the instructions in
the comments.

## License

This project is licensed under the [MIT License].

[reddit]: https://www.reddit.com
[firefox add-ons]: https://addons.mozilla.org/en-US/firefox
[devbox]: https://www.jetify.com/docs/devbox
[here]: https://www.jetify.com/docs/devbox/installing-devbox
[firefox]: https://play.google.com/store/apps/details?id=org.mozilla.firefox
[this tutorial]: https://developer.android.com/studio/debug/dev-options
[mit license]: LICENSE.md
