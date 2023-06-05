class_name LoggingExample extends Node2D

const __class_name = "LoggingExample"

# Changing LogLevel suppresses unneeded information
var logger = Log4Gd.get_logger(__class_name, Log4Gd.DEBUG)

func _ready():
	logger.debug("_ready.debug")
	logger.info("_ready.info")
	logger.warn("_ready.info")
	logger.error("_ready.error")

	logger.info("application/run/flush_stdout_on_print = %s " % [str(ProjectSettings.get_setting('application/run/flush_stdout_on_print'))])

	print("Getting info about loggers:\n\n", Log4Gd)


func _notification(what):
	logger.debug("_notification: %d" % [what])

func _exit_tree():
	# FIXME: these never prints (v4.0.3.stable.official [5222a99f5])
	push_warning(Log4GD)
	# Should print when application/run/flush_stdout_on_print == true
	printt("Never prints", Log4Gd)
