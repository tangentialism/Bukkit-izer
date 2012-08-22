# Bukk.it.i.zer

A powerful bukk.it retrieval API crafted carefully to provide appropriate images for all situations, should Ethan Marcotte not be available for the task.

**If, and only if, Ethan Marcotte is not available to provide the right GIF for any occasion**, you can issue the following HTTP requests, all of which redirect, if possible, to a bukk.it URL:

## `GET /`

Returns a random image of any format.

## `GET /index.FORMAT`

Returns a random image of format _FORMAT_. So, `GET /index.jpg` would return a random JPG

## `GET /MATCHABLE-WORD.FORMAT`

Returns an image whose name includes _MATCHABLE-WORD_ of format _FORMAT_. So, `GET /cat.gif` would return a GIF of a cat.

---

There are currently no plans for `PUT`, `POST`, or `DELETE` calls. Be happy this exists, and just pray that Ethan is available.