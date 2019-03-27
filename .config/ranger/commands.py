from ranger.api.commands import *

class empty(Command):
    """:empty

    Empties the trash directory ~/.trash
    """

    def execute(self):
        self.fm.run("rm -rf ~/.local/share/Trash/files/{*,.[^.]*}")
        self.fm.run("rm -rf ~/.local/share/Trash/info/{*,.[^.]*}")
        self.fm.run("rm -rf ~/.local/share/Trash/expunged{*,.[^.]*}")

class exif(Command):
    """:exif

    Shows EXIF information.
    """

    def execute(self):
        self.fm.run("exiftool /data/photos/best\ of/035\ Église.jpg")
        self.fm.notify("hello \n all")
