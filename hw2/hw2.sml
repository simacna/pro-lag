fun same_string(s1: string, s2: string) =
    s1 = s2 

(*1 a*)
fun all_except_option(s: string, b:string list) = 
    case b of
	[] => NONE
     | x::x' => if same_string(s,x)
		then SOME  x'
		else 
		    case all_except_option(s, x') of
			NONE=>NONE
		     | SOME y => SOME (x::y) 
		   
		 
(* 1 b *)
fun get_subs(s: string, lst: string list list) =

    case lst of
	[] =>[]
     | x::xs' => case all_except_option(s,x) of
		     NONE => get_subs(s,xs')
		  | SOME y => y @ get_subs(s, xs')


(* 1c *)

fun get_sub2(s: string, lst: string list list) = 
    let fun aux(s, fst,snd) =
	    case fst of
	    [] =>fst
	    | x::xs' => case all_except_option(s,x) of
			    NONE => aux(s,xs',snd)
			    | SOME y => aux(s,xs',y@snd)
	     

    in
	aux(s,lst, [])
    end
