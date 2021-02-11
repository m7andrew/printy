
# Printy

When [pretty print](https://janetdocs.com/pp) is not enough. Printy is a small [Janet](https://janet-lang.org/) library for styling terminal output and printing data structures.

## Install

```
jpm install https://github.com/m7andrew/printy
```

## Examples

Style text with `style`:

```clojure
(use printy)

(print (string "This is a " (style "Test" :red :bold) " message."))
```

Print collections with `pcoll`:

```clojure
(use printy)

(def movie
  {:title "Star Wars: A New Hope"
   :rated "PG"
   :runtime 121
   :genres ["Action" "Adventure" "Fantasy" "Sci-Fi"]
   :actors ["Mark Hamill" "Harrison Ford" "Carrie Fisher"]})

(pcoll movie)
```
```
actors:
  - Mark Hamill
  - Harrison Ford
  - Carrie Fisher
rated: PG
title: Star Wars: A New Hope
runtime: 121
genres:
  - Action
  - Adventure
  - Fantasy
  - Sci-Fi
```

## Functions

#### Style

```clojure
(style str color &opt effect)
```

Styles a string `str` for terminal output. `color` can be a **color** or a **background color**. 
Optionally, `effect` can be one of the **effects**. Returns a new styled string.

Color    | Background Color | Effects
---------|------------------|---------
`:black` | `:blackbg`       | `:bold`
`:red`   | `:redbg`         | `:dim`
`:green` | `:greenbg`       | `:italic`
`:yellow`| `:yellowbg`      | `:underline`
`:blue`  | `:bluebg`        | `:blink`
`:purple`| `:purplebg`      | `:inverse`
`:cyan`  | `:cyanbg`        | `:hidden`
`:white` | `:whitebg`       |

#### Print Collection

```clojure
(pcoll ds)
```

Prints a data structure `ds` in a YAML style format.