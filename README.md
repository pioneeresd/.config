# .config
This sets up this, my dotfiles, and my .local/bin directory as well as installing several required packages.

You should fork these repositories, set $USER to your github username and run
this.

NOTE: You should add an ssh key to your github account - this script creates a
key if you don't have one and copies it to the clipboard so you may need to run
it twice - once to copy the key and paste it into your github account, then
again to actually make the changes.

```bash
curl https://raw.githubusercontent.com/$USER/.config/master/setup | bash
```
