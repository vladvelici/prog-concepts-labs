let rec zip = function
        | (ela::a, elb::b) -> (ela, elb) :: (zip (a, b))
        | _ -> [];;

(* ([1;2;3], [7;8;9]) -> [(1,7); (2, 8); (3, 9)] *)

let rec unzip = function
        | [(a, b)] -> ([a], [b])
        | (a, b)::rest -> let (listA, listB) = (unzip rest) in (a::listA,
        b::listB)
        | _ -> ([], []);;

let toz = zip ([1;2;3], [7;8;9]);;

let unz = unzip toz;;
