
type 'a pointer =
        | Null
        | Pointer of 'a ref;;

let (^!) = function
        | Null -> invalid_arg "dereference null pointer err"
        | Pointer r -> !r;;

let (^:=) p v =
        match p with
        | Null -> invalid_arg "assign null pointer err"
        | Pointer r -> r:=v;;

let new_pointer x = Pointer (ref x);;


let np = new_pointer 3;;

np ^:= 4;;

Printf.Printf "%d\n" ^!np
