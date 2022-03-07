# How to use

Run in linux (or git bash) command line:

For global aliases:
```shell
bash -c "$(curl https://raw.githubusercontent.com/Jgay6/setup_alias_git/master/setup.sh)" -s global
```

For system aliases:
```shell
bash -c "$(curl https://raw.githubusercontent.com/Jgay6/setup_alias_git/master/setup.sh)" -s system
```
For local aliases:
```shell
bash -c "$(curl https://raw.githubusercontent.com/Jgay6/setup_alias_git/master/setup.sh)" -s local
```

For setting the user and email
```shell
git config --global user.name "Name"
git config --global user.email "Email"
```
