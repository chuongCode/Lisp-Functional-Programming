;pre-emptive check if list is null, then check if the given value X is equal to the head of the list, if not check if calling the 
;function on itself with a list of all the values except the head return true
(defun .member (X L)
    (cond
        ((null L) nil)
        ((equalp X (car L)) t)
        (t (.member X (cdr L)))
    )
)

;check if list is null, else check if x is equal to the head of the list. if so, call function on rest of list w/o head. however
;if not match, put X at head of list produced by calling the function on the REST of the list excluding the head
(defun .remove-all (X L)
    (cond
        ((null L) nil)
        ((equalp X (car L)) (.remove-all X (cdr L)))
        (t (cons (car L) (.remove-all X (cdr L))))
    )
)

;check if list is null, if so RETURN Z
;otherwise, call fold on itself with the list excluding the head, the original given function
(defun .foldl (L F Z)
    (cond
        ((null L) Z)
        (t (.foldl (cdr L) F (apply F (list Z (car L)))))
    )
)

(defun .sum (L)
    (cond
    ;return 0 if list is null, first off. otherwise, add the head of the list with the result of calling .sum on the rest of the list
        ((null L) 0)
        (t (+ (car L) (.sum(cdr L))))
    )
)

(defun .add-element (X list) 
    (cond
    ;check membership, return the list if true. if not, return the list with X at the head
        ((.member X list) list)
        (t (cons X list))
    )
)

(defun .intersection (S1 S2)
    (cond
    ;essentially check membership and if so, put that value at the head of the list and call the function on the rest of s1
        ((null S1) nil)
        ((.member (car S1) S2) (cons (car S1) (.intersection (cdr S1) S2)))
        (t (.intersection (cdr S1) S2))
    )
)

;first gotta check for if set 2 is empty, cus if it is, it'll always a superset
;check if head of set 2 is member of set 1, itll return null if it aint then escape then call superset on the rest of the list of set 2
(defun .supersetp (S1 S2)
    (cond
        ((null S2) t)
        ((.member (car S2) S1) (.supersetp S1 (cdr S2)))
        (t nil)
    )
)

(defun .cardinality (S) 
    (cond
    ;simple add 1 every time cardinality gets called through the list
        ((null S) 0)
        (t (+ 1 (.cardinality(cdr S))))
    )
)

;math functions

(defun .factorial (x)
    (cond 
        ((= x 0) 1)
        (t(* x (.factorial(- x 1))))
    )
)

(defun .mod (X Y)
    (cond
        ((< X Y) X)
        (t (.mod (- X Y) Y))
    )
)

(defun .gcd (X Y)
  (if (= Y 0)
      X
      (.gcd Y (mod X Y))
  )
)

(defun .pow (x y)
    (if (= y 0) 1
        (* x (.pow x (- y 1)))
    )
)

(defun .with-annual-interest (P R N)
    (cond
        ((= N 0) P)
        ((> N 0) (* P (.pow (+ 1 R) N)))
    )
)
