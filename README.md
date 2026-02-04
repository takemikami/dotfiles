dotfiles
---

## deploy

clone repository

```sh
cd ~/ && git clone git@github.com:takemikami/dotfiles.git
```

deploy ssh

```sh
test ! -e ~/.ssh/config && ln -s ~/dotfiles/.ssh/config ~/.ssh/config
test ! -e ~/.ssh/conf.d && ln -s ~/dotfiles/.ssh/conf.d ~/.ssh/conf.d
```

deploy others

```sh
ls -a ~/dotfiles/ | grep '^\.[^.]' | grep -v ^\\.git$ | grep -v ^\\.ssh$ | xargs -I{} sh -c 'test ! -e ~/{} && ln -s ~/dotfiles/{} ~/{}'
```

deploy scripts

```sh
ls -a ~/dotfiles/scripts/bin | grep -v '^\.' | xargs -I{} sh -c 'test ! -e ~/.local/bin/{} && ln -s ~/dotfiles/scripts/bin/{} ~/.local/bin/{}'
```
