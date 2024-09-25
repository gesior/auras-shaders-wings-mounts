function onUpdateDatabase()
	print("> Updating database to version 37 (Aura, Shader and Wings)")
	db.query("ALTER TABLE `players` ADD `lookaura` INT(10) NOT NULL DEFAULT '0' AFTER `lookaddons`")
	db.query("ALTER TABLE `players` ADD `lookshader` INT(10) NOT NULL DEFAULT '0' AFTER `lookaura`")
	db.query("ALTER TABLE `players` ADD `lookwings` INT(10) NOT NULL DEFAULT '0' AFTER `lookshader`")
	return true
end
