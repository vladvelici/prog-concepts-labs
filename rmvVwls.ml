let file = read_line ();;

let is_vowel = function
        | 'a' | 'e' | 'i' | 'o' | 'u' | 'y'  -> true
        | _ -> false;;

let input = open_in file and
output = open_out (String.concat "" [file; ".vwl"]) in

try
        while true; do
                let c = input_char input in
                if (is_vowel c) == false then output_char output c
                
        done; 

with End_of_file ->
        close_in input;
        close_out output;;
