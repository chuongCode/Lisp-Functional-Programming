# Lisp-Functional-Programming
A project based on Alan Turing’s formalization of “computable functions” using Turing machines. This project is meant to be an introduction to the original functional programming language: Lisp. It contains a handful of simple functions built with Lisp's syntax. I have comments for each function pretty much explaining my thought process on how it operates in layman's terms.

Just to note: Power function does not handle negative values:

Ex. pow 2 -2 produces an error. 

List Functions:

(.member XL): Return true (non-nil) if X is a member of list L (test with equalp), otherwise nil.

  (.member 3 '(13xa)) => T
  (.member 4 '(13xa)) => NIL

(.remove-all XL): Return a new list which contains all the elements of L that are not X (test using equalp).

  (.remove-all 'a' '(bacaada)) => (BCD)

(.foldl LFZ): Fold-left: for list L, binary function F, and initial value Z: If the list is empty, the result is the initial value Z. If not, fold the tail of the list L using as a new initial value the result of applying F to the old initial value Z and the first element of L.

  (.foldl '(12345) '+ 0) => 15
  (.foldl '(132) '- 10) => 4
  (.foldl '(123) 'cons nil) => (((NIL . 1) . 2) . 3)
  
  Note: This is simulating the method provided by Java Standard Library, java.util.stream.reduce. In Python, it is the built-in function reduce.

(.sum L): Sum of the (numeric) elements in a list.

  (.sum '(1234)) => 10
  (.sum nil) => 0
  
Set Functions:

(.add-elementXL): Return the set resulting from adding element X to set L

  (.add-element 'a' (bcd)) => (ABCD)
  (.add-element 'a' (abcd)) => (ABCD)

(.intersection S1 S2): Return the set that is the intersection of sets S1 and S2 (that is: S1 ∩ S2)

  (.intersection '(abc)' '(acd)') => (AC)

(.supersetp S1 S2): Return true (non-nil) if set S1 is a superset of or equal to S2, otherwise return nil (that is: if S1 ⊇ S2)

  (.supersetp '(abcd)' '(ab)') => T
  (.supersetp '(ab)' '(ab)') => T
  (.supersetp '()' '(ab)') => NIL

(.cardinality S): Return the cardinality (number of elements in) set S

  (cardinality '()) => 0
  (cardinality '(abc)) => 3

Math Functions:

(.factorial N): Return the factorial (N!) of the given non-negative integer

  (.factorial 5) => 120

(.gcd XY): Return the greatest common divisor (GCD) of the two given positive integers (the GCD is the largest integer that divides both integers)

  (.gcd 8 12) => 4

(.pow XY): Return the value of X to the power Y (that is: x^y; you may assume that Y is an integer)

  (.pow 2 8) => 256
  (.pow 2 0) => 1
  (.pow 2 -2) => 1/4

(.with-annual-interest PRN): Return value V of the principal amount P plus interest at a rate r compounded annually for n years: V = P(1 + r)^n

  (.with-annual-interest 1000 0.101) => 1100.0
  (.with-annual-interest 1000 0.0510) => 162.8894
