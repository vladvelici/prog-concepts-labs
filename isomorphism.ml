type ('a ,'b) sum = L of 'a | R of 'b ;; 
type ('a, 'b, 'c) tT = 'a * ('b , 'c) sum ;; 
type ('a, 'b, 'c) tU = ('a * 'b , 'a * 'c) sum ;;


let tT_to_tU (t:('a, 'b, 'c) tT) : ('a, 'b, 'c) tU =
        match t with 
                | (x, y) -> (match y with
                        | L k -> L (x, k)
                        | R k -> R (x, k)
                );;

let tU_to_tT (t:('a, 'b, 'c) tU) : ('a, 'b, 'c) tT =
        match t with
                | L (x, y) -> (x, L y)
                | R (x, y) -> (x, R y);;

let sm:(float, int) sum = R 3;;
let test:(string, float, int) tT = "hello", sm;;

print_string "here it comes";;

tU_to_tT (tT_to_tU test);;

let sm2:(string, bool) sum = R false;;
let test2 = (sm, sm2);;

let prodToSums (prod:(('a, 'b) sum * ('c, 'd) sum)) = 
        match prod with
                | (left, right) -> (match right with
                                | L k -> tT_to_tU ((left, k):('x, 'y, 'z) tT)
                                | R k -> tT_to_tU ((left, k):('x, 'y, 'z) tT)
                );;


