let rec zip = function
        | (ela::a, elb::b) -> (ela, elb) :: (zip (a, b))
        | _ -> [];;

let (>>) f g x = g (f (x)) ;;

let mapZip f lst = (>>) zip (List.map f) lst ;;

let double (a, b) = (a * 2, b * 2) in
        mapZip double ([1;2], [8;9]);;
