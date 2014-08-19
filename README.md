# Imgur.com capture

Capture sequential camera frames, combine as an animated gif and upload the
result to imgur.com for the world to see.

I'd call this more of a mash-up than an original work. Thanks to:

* https://github.com/mattgrill/dotfiles - the capture sequence
* https://github.com/Ceryn/img - the upload

# Installation

Clone this repository somewhere logical.

Then, use http://brew.sh/ or something similar to install dependencies:

````
brew install imagemagick imagesnap
````

If you want this file to always be included so you can capture any moment, add
the following to  your .bash_profile:

````
source ~/Projects/imgur-cap/cap.sh
````

# Usage

````
# See an error message!
camtoimgur
# Upload 5 sequential frames to imgur.
camtoimgur 5
````
