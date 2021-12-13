from ranger.api.commands import *

class empty(Command):
    """:empty

    Empties the trash directories.
    """

    def execute(self):
        self.fm.run("trash-empty")

class exif(Command):
    """:exif

    Shows EXIF information.
    """

    def execute(self):
        self.fm.run("exiftool /data/photos/best\ of/035\ Église.jpg")
        self.fm.notify("hello \n all")
