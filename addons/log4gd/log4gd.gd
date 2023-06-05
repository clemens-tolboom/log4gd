## Logging utility inspired by Log4J.
##
## You can instantiate a logger using
## [code]
## const logger = Log4GD.get_logger(get_class())
## [/code]
##
## or
##
## [code]
## class_name MyClass extends Node
##
## const __class_name = "MyClass"
## const logger = Log4GD.get_logger(get_class())
## [/code]
##
## and use it like
## [code]
## logger.warn(msg)
## [/code]
class_name Log4GD extends Node

## As we use autoload make sure it's name does not collide
##
## Our class_name is with upper case GD Log4GD
## but the autoload singleton is Log4Gd
const __class_name = "Log4Gd"

## List of known loggers
##
## NOTE: this does not have log4j hierarchy implements
var loggers = {}

## Log levels for fine tuning the logging needs
enum LogLevel {
	DEBUG,  ## Log every log requests.
	INFO,  ## Filter DEBUG log requests.
	WARN,  ## Filter out DEBUG and INFO requests.
	ERROR,  ## Filter all of the above.
}
const DEBUG = 0
const INFO = 1
const WARN = 2
const ERROR = 3

const enum_string: Array[StringName] = [&"DEBUG", &"INFO", &"WARN", &"ERROR"]

var logger = get_logger(__class_name, LogLevel.INFO)


## Make list of the current configured loggers.
func _to_string() -> String:
	var result: String = "%s has loggers:\n" % [__class_name]

	var dict: Dictionary = {}
	for l in loggers:
		var logger: Logger = loggers[l]
		if not dict.has(logger._level):
			dict[logger._level] = []
		dict[logger._level].push_back(logger._name)

	var by_level = dict.keys()
	by_level.sort()
	for log_level in by_level:
		dict[log_level].sort()
		result += "- %s: \n  - %s\n" % [enum_string[log_level], "\n  - ".join(dict[log_level])]
	return result


## Configures and return the requested logger.
func get_logger(log_name: StringName, log_level: LogLevel = LogLevel.WARN):
	if not loggers.has(log_name):
		if logger:
			logger.info("New logger '%s'" % log_name)
		loggers[log_name] = DefaultLogger.new(log_name, log_level)
	return loggers[log_name]


class Logger:
	pass


## The logger class implementing the LogLevel methods.
class DefaultLogger:
	extends Logger
	## Logger name used to make them unique
	##
	## NOTE: this needs the use of [code]class_name[/code]
	var _name: StringName

	## Level indicating what to log.
	var _level: LogLevel

	func get_level():
		return enum_string[_level]

	## Logger constructor
	func _init(name, level):
		_name = name
		_level = level
		info("Logger %s has level %s" % [name, enum_string[level]])

	## Helper to ease the logging.
	func _log(log_level: LogLevel, msg):
		if _level <= log_level:
			printt(enum_string[log_level], _name, msg)

	func debug(msg):
		_log(LogLevel.DEBUG, msg)

	func info(msg):
		_log(LogLevel.INFO, msg)

	func warn(msg):
		_log(LogLevel.WARN, msg)

	func error(msg):
		_log(LogLevel.ERROR, msg)

	func _to_string() -> String:
		return _name + " " + enum_string[_level]

## WIP: Log to a file
class FileLogger:
	extends DefaultLogger
	var file_name = "user://log4gd.log"

	func set_config(config: Dictionary):
		pass
