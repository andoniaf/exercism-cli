# exercism-cli
[![Build Status](https://travis-ci.org/andoniaf/exercism-cli.svg?branch=master)](https://travis-ci.org/andoniaf/exercism-cli)

Dockerized version of https://github.com/exercism/cli

Image size: 16.3MB

# How to use
1. Create the `config.json` from the template:
```json
{
  "apibaseurl": "https://api.exercism.io/v1",
  "token": "<YOUR_EXERCISM_TOKEN>",
  "workspace": "/Exercism"
}
```
*Find your token on https://exercism.io/my/settings*

2. Create the folder where do you want Exercism store the exercises:
```bash
mkdir my_exercism_dir
chmod 777 my_exercism_dir
```

3. Run the container mounting as volume the config and the folder:
```bash
docker run --rm --name exercism-cli -v $PWD/config.json:/home/exercism/.config/exercism/user.json -v $PWD/exercism:/Exercism andoniaf/exercism-cli <EXERCISM_CLI_COMMANDS>
```

### Examples
- Download the `word-count` of the `Ruby` track:
```bash
docker run --rm --name exercism-cli -v $PWD/config.json:/home/exercism/.config/exercism/user.json -v $PWD/exercism:/Exercism andoniaf/exercism-cli download --exercise=word-count --track=ruby
```

