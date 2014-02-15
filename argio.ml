if Array.length Sys.argv != 5 then
        raise (Invalid_argument "Invalid cmd arguments");; 

let input1 = (open_in (Array.get Sys.argv 1));;
let input2 = (open_in (Array.get Sys.argv 2));;
let output = (open_out (Array.get Sys.argv 3));;
let n = (int_of_string (Array.get Sys.argv 4));;

print_string ((string_of_int n) ^ "\n");;

let redir_lines inCh outCh times = for i=1 to times do
        let line = input_line inCh in
        output_string outCh line;
        output_string outCh "\n"
done;;

let ch1_done = ref false and ch2_done = ref false in
while (not !ch1_done) && (not !ch2_done) ; do
        if not !ch1_done then begin
            try
                    redir_lines input1 output n
            with End_of_file -> begin
                    ch1_done := true;
                    close_in input1; end;
        end;

        if not !ch2_done then begin
           try
                   redir_lines input2 output n
           with End_of_file -> begin
                   ch2_done := true;
                   close_in input2;
           end;
        end;
done;;

close_out output;;
