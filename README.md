# .config
This sets up this, my dotfiles, and my .local/bin directory as well as installing several required packages.

You should fork these repositories, set $USER to your github username and run
the following commands.

NOTE: You should add an ssh key to your github account - this script creates a
key if you don't have one and copies it to the clipboard.

```bash
curl https://raw.githubusercontent.com/$USER/.config/master/keysetup.sh | bash
```

Then you need to copy the key to your github account (and optionally your
bitbucket account). Once that is done you may run the following command which
will clone the repos for you.

```bash
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/$USER/.config/master/setup | bash
```

Finally you will probably want to install some basic tools as these are the
ones that these repos optimize.

```bash
~/.config/install.sh
```
