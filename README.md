# log4gd

Logger for Godot inspired by Log4J

Have you ever wondered why Godot doesn't have a class based logger? Well, I did. So I made one.

Using one of the `print*` statements to try remove a bug is a pain. You have to go through all your code and remove them again. With this logger you can just change the log level and all your debug statements will be ignored.

## Installation

Download the latest release and put it in your `addons` folder.

## Usage

```gdscript
var logger = Logger.new("MyClass")

func _ready():
    logger.info("Hello World")
```
