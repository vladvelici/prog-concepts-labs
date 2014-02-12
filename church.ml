let ch_true (x:'a) (y:'a) = x;;
let ch_false (x:'a) (y:'a) = y;;

let ch_and (m:('a->'a->'a)) (n:('a->'a->'a)) (x:'a) (y:'a) = m (n x y) y;;

ch_and ch_true ch_false 1 2;;
