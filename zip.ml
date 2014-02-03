let rec zip = function
        | (ela::a, elb::b) -> (ela, elb) :: (zip (a, b))
        | (_,[]) -> [];;

zip ([1;2;], [3;4;]);;


