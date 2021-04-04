# For `jupyter notebook`.
c.NotebookApp.browser = '/usr/bin/firefox -P notebook --new-window %s'

# Old approach:
# import webbrowser
# browser = webbrowser.Mozilla('firefox-notebook')
# webbrowser.register('firefox-notebook', None, browser)
# c.NotebookApp.browser = 'firefox-notebook'

# Content of /usr/local/bin/firefox-notebook:
# #!/bin/env sh
# firefox -P notebook --new-window $@
