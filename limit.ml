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

let limit n f = 
        let np = new_pointer n in
        fun x -> 
             if (^!)np == 0 then
                 raise (Failure "screwed up.")
              else
                  (^:=) np ((^!)np - 1); 
                  (f x);;
              
             

let stlimited = limit 3 print_string;;

stlimited "first\n";;
stlimited "second\n";;
stlimited "third\n";;
stlimited "fourth\n";;

