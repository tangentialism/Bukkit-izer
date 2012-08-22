# Bukk.it.i.zer

A powerful bukk.it retrieval API crafted carefully to provide appropriate images for all situations, should Ethan Marcotte not be available for the task.

**If, and only if, Ethan Marcotte is not available to provide the right GIF for any occasion**, you can issue the HTTP requests listed below, all of which redirect, if possible, to a bukk.it URL. To see it in action, you can try http://bukkit.tangentialism.com/, but don't get your hopes up.

## Methods

### `GET /`

Returns a random image of any format.

### `GET /index.FORMAT`

Returns a random image of format _FORMAT_. So, `GET /index.jpg` would return a random JPG.

### `GET /MATCHABLE-WORD.FORMAT`

Returns a random image whose name includes _MATCHABLE-WORD_ of format _FORMAT_. So, `GET /cat.gif` would return a GIF of a cat.

### `GET /MATCHABLE-WORD`

Returns a random image whose name includes _MATCHABLE-WORD_, irrespective of its format. So, `GET /dog` would return a random image of a dog, without a guarantee that it will be an awesome animated GIF.

**There are currently no plans for `PUT`, `POST`, or `DELETE` calls. Be happy this exists, and just pray that Ethan is available.**

## About

[Bukk.it](http://bukk.it) is an exhaustive resource of appropriate images for all occasions, administered and searchable by the critically-acclaimed meme researcher and GIF archivist [Ethan Marcotte](http://ethanmarcotte.com). Bukk.it.i.zer is something [David Yee](http://tangentialism.com) put together in 20 minutes. Now you can make an informed decision about geniuses.

