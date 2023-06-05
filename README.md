# log4gd

> We have [10+ loggers](https://github.com/search?q=godot%20logger&type=repositories) for Godot so why another one? It was in the works :-/

Logger for Godot inspired by Log4J.

Have you ever wondered why Godot doesn't have a class based logger? Well, I did. So I made one.

Using one of the `print*` statements to try remove a bug is a pain. You have to go through all your code and remove them again. With this logger you can just change the log level and all your debug statements will be ignored.

## Installation

Download the latest release and put it in your `addons` folder.

## Autoload

Add the addon to your autoload. Make sure its name is `Log4Gd` and not its class name `Log4GD`

## Usage

### Get a logger

```gdscript
# Ask the autoloaded object for a new logger
var logger = Log4Gd.get_logger(__class_name, Log4GD.LogLevel.DEBUG)
```

### Use a logger

```
func _ready():
	logger.info("Hello World")
```

### Print all defined loggers

```
print(Log4Gd)
```
