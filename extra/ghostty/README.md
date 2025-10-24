# Ghostty

> "[Ghostty](https://ghostty.org/) is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration." - Ghostty docs

👻 To use funkey in Ghostty, you need to update your Ghostty config file.

## Install guide

Simply copy the `funkey` file into your `themes/` directory.
If you don't have a `themes/` directory, create one next to your `config` file.

Your Ghostty config directory structure should look something like this:

```plaintext
- ghostty/
  - config
  - themes/
    - funkey
```

Then, in your `config` file, set `theme` to `funkey`:

```ini
theme = "funkey"
```

Reload your config and you should see the theme applied!

### Note

If you don't want to create a `themes/` directory, you can also use an absolute path:

```ini
theme = "../code/funkey.nvim/extra/ghostty/funkey" # or wherever your local funkey file is
```

## Need help?

See the [Ghostty docs](https://ghostty.org/docs/config/reference#theme) for details.
