all:
	ocamllex lexer.mll
	ocamlyacc parser.mly
	ocamlc -c parser.mli
	ocamlc -c lexer.ml
	ocamlc -c parser.ml
	ocamlc -c calc.ml
	ocamlc -o calc lexer.cmo parser.cmo calc.cmo

clean:
	rm calc *.cmo lexer.ml parser.ml parser.mli *.cmi
