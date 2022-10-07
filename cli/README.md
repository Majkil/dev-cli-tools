# Dev Cli Tools
[![The MIT License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square)](LICENSE)

A command line tool to generate boilerplate applications to save time

---
# Installation
Clone the Repo
Navigate to the directory and add the tool to dart global

```sh
$ dart pub global activate --source path .
```

This will allow you use the tool from anywhere in a termninal
---
# Usage 

## Python
### Flask boilerplate app
```
dart pub global run cli --create --python --name <appname>
```
or
```
dart pub global run cli -c -p -n <appname>
```