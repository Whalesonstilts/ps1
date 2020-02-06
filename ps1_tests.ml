(*
                         CS 51 Problem Set 1
                Core Functional Programming -- Testing
*)                           

open Ps1 ;;

(* unit_test test msg -- Returns unit, with side effect of printing a
   report identified by msg on whether the unit test passed (returned
   true) or failed (returned false) *)
let unit_test (condition : bool) (msg : string) : unit =  
  if condition then
    Printf.printf "%s passed\n" msg
  else
    Printf.printf "%s FAILED\n" msg ;;

(* unit_test_within tolerance value1 value2 msg -- Tests that value1
   is within tolerance of value2. Identifies test using msg. *)
let unit_test_within (tolerance : float)
                     (value1 : float)
                     (value2 : float)
                     (msg : string)
                   : unit =
  unit_test (abs_float (value1 -. value2) < tolerance) msg ;;
  
let nonincreasing_test () =
  unit_test (nonincreasing [])
            "rev empty";
  unit_test (nonincreasing [7])
            "rev single";
  unit_test (nonincreasing [4;4;4])
            "rev repeat";
  unit_test (not (nonincreasing [2;1;2]))
            "rev inc at start";
  unit_test (nonincreasing [2;2;1])
            "rev dups";
  unit_test (nonincreasing [9;8;7;6;5;5;5;4;4;-2])
            "rev long with neg";
  unit_test (not (nonincreasing [9;8;7;6;7;5;5;5;5;4;3]))
            "rev long inc at mid" ;;
  
let test_all () =
  nonincreasing_test () ;;

let _ = test_all () ;;
