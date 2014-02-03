type tTree =
        | Empty
        | BoolNode of bool * tTree * tTree * tTree
        | IntNode of int * tTree * tTree * tTree;;

let rec sumTern = function
        | Empty -> 0
        | BoolNode (false, a, b, c) -> 0
        | BoolNode (true, a, b, c) -> (sumTern a) + (sumTern b) + (sumTern c)
        | IntNode (nr, a, b, c) -> nr + (sumTern a) + (sumTern b) + (sumTern
        c);;


let tTtr =
        BoolNode (
                true,
                IntNode (3,
                        Empty,
                        Empty,
                        BoolNode (false,
                                IntNode (3, Empty, Empty, Empty),
                                Empty,
                                Empty
                        )
                ),
                BoolNode (false,
                        IntNode (2, Empty, Empty, Empty),
                        Empty,
                        Empty
                ),
                IntNode (1, Empty, Empty, IntNode (1, Empty, Empty, Empty))
        
        );;


sumTern tTtr;;


(*let tT = BoolNode (true, Empty, Empty, Empty);;*)

