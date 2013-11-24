fun is_older(x: int * int * int, y: int * int * int) =
    if (#1 x) < (#1 y) 
    then true
    else false

fun number_in_month(date: (int*int*int) list, month:  int) =
    if null date
    then 0
    else if #2(hd date) = month
    then number_in_month(tl date, month) + 1
    else number_in_month(tl date, month)

fun number_in_months(date: (int*int*int) list, month: int list)=
    if null date
    then 0
    else number_in_month(date, hd month) + number_in_months(date, tl month)

fun dates_in_month(dates: (int*int*int) list, month: int)=
    if null dates
    then []
    else if #2(hd dates) = month
    then hd dates::dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

fun dates_in_months(dates: (int*int*int) list, months: int list) =
    if null dates orelse null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(nth: string list, num: int) =
   
    let 
	fun cut(sentence: string list, count: int)=
	    if count = 1
	    then   hd sentence
	    else cut(tl sentence, count - 1)

    in
	cut(nth, num)

    end

(*7*)

type date = int * int * int
fun year(d: date) = #1 d
fun month(d: date) = #2 d
fun day (d: date) = #3 d

fun date_to_string(d: date) =

    let
	val ms = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"] 

	    
    in
	get_nth(ms,month (d)) ^ " " ^ Int.toString(day d) ^ ", " ^ Int.toString(year d)
    end
