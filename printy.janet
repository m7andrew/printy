
(def- colors
  {:black 30 :red 31 :green 32 :yellow 33 
   :blue 34 :purple 35 :cyan 36 :white 37
   :blackbg 40 :redbg 41 :greenbg 42 :yellowbg 43 
   :bluebg 44 :purplebg 45 :cyanbg 46 :whitebg 47})

(def- effects
  {:bold 1 :dim 2 :italic 3 :underline 4 :blink 5 
   :inverse 7 :hidden 8})

(defn style [str color &opt effect]
  (string "\e[" (get effects effect 0) ";" (colors color) "m" str "\e[0m"))

(defn- reducer [acc item &opt depth]
  (default depth 0)
  (def indent (string/repeat "  " depth))

  (defn list [acc x]
    (reducer (string acc "\n" indent "- ") x (+ depth 1)))

  (defn dict [acc [k v]]
    (def k (style k :green))
    (reducer (string acc "\n" indent k ": ") v (+ depth 1)))

  (cond (dictionary? item) (reduce dict acc (pairs item))
        (indexed? item) (reduce list acc item)
        (string acc item)))

(defn pcoll [ds]
  (print (string/triml (reducer "" ds))))
