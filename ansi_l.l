;; backup is in ~/emacs-backups && talkgen gitlab account
;; *chapter 1*
;; //check out errata of book on completing the book
;; //check out books on functional programming
;; //check out books on lambda calculus


(defun sum (n)
  (let ((s 0))
  (dotimes (i n s)
    (incf s i))))
(sum 5)

(defun addn (n)
  #'(lambda (x)
      (+ x n)))

;; *chapter 2*
; not all operators in lisp are function calls, but MOST ARE
;; all function calls follow evaluation rule
;; let us term operators that do not follow eval rule as special operators
'(+ 4 3)
;;integer
3
;;there is no char
a
;;string:
"hello"
;;symbol:
;;symbols are words; usually automatically capitalised on evaluation
;;symbols do not evaluate to words,
;;hence to call them quote is always used
'artichoke
;; ' protects symbol from evaluation
;;lists
;;lists are one or more expressions in () protected by '

;;list can be built by 'list' command
;;expressions means integer/symbol/or any other data type?
;;lisp programs are expressed as lists, hence macroable
'(my 3 "sons") ;; my is a symbol
'(the list (a b c) has 3 elements)
;; notice that one ' protects all elements from evaluatio
;; // write a lisp program that tracks your 10,000 hrs progress as a countdown
'(hello 1)
'(I am (+ 18 3) years old)
;; list command used to evaluate expressions in a list
;; if quoted list evaluation returns list 
;; if unquoted list is considered as code
(list 'I 'am (+ 18 3) 'years 'old)
(list 'I 'am '(+ 18 3) 'years 'old)
()
nil 
(nil)
;; this is a mistake why? nil is evaled as a function,so...
;; note list itself should not be called as bracket 
(list ('I 'am (+ 18 3) 'years 'old))
;; the mistake is the un-nessesary bracketing? yes
;;cons builds lists, adds first argument at the beginning
(cons 'a '(b c d))
(cons "hello" "world")
;;why the dot on evaluation?
(cons ('a cons('b cons('c cons('d nil)))))
;; error is that there un-nessesary bracketing? yes improper bracketing as well
(cons 'b (cons 'a nil))
(cons 'b '(a))
(cons 'b 'a)
(cons 'd (cons 'c (cons 'b (cons 'a nil))))
(list 'a 'b 'c 'd)
;; list is a more convenient way of consing items onto a nil
'(a b c)
(car '(a b c))
(cdr '(a b c))
(cdr (cdr '(a b c)))
'(a b c d)
(third '(a b c d))
(fourth '(a b c d))
(fifth '(a b c d))
(twentieth '(a b c d))
t
f 
;; only t is bound , f is unbound
;; falsity is returned as nil
;; true false functions are called predicates
;; listp is one such predicate, predicates often have names ending in *p
;; atom is also a predicate
(listp '(a b c))
(listp(cons "hello" "world"))
(listp '("anoop" "gr"))
(list ("anoop" "gr")) 
;; the problem was un-nesessary bracketing
(list "anoop" "gr")
(listp 'anoop)
(listp 33)
;; falsity is returned as nil
nil
;; also empty list is returned as nil
()
;; nil plays 2 roles
;; null returns true if empty
(null nil)
;;in above nil represents empty list
(not nil)
;;above here nil represents falsity

;;conditionals:
;if:
(if t
    (+ 0 1)
    (+ 0 0))

(if (listp '(she has an MBA))
    '(not my type)
    '(she is interesting)
    )

(if (listp "she is not an MBA")
    "not my type"
    "she is interesting")

(if t
    1
    0)

(if nil
    1
    0)

(if nil
    1)
;; second argument defaults to nil
(if t
    1)

(if 69
    "everything except nil is evaled as true")

;;only first statement is evaluated if true, evidence:
(if t
    "only first is evaled"
    (/ 2 0))

;;logical operators:
(and t t)
(& t t)
;; doesnt work
(and t nil)
(and t 69)
(and nil t)
(and t (+ 60 9))
;; only first arg is false, second is not evaled
(and nil (/ 2 0))
(and t (/ 2 0))
;;or
(or t nil)
(or nil ())
;; if first arg is true, second is not evaled
(or t (/ 0 0))
(or nil (/ 0 0)) ;; talkgen
;;and & or are implemented as macros
;;macros can break eval rule, they are special operators like '

;;functions
(defun foo ())
(list 'x)
(x)
'(x)
(third '(a b c d))
(cdr '(a b c d))
(defun our-third (x)
  (car(cdr(cdr x))))
(our-third '(a b c d))
;; in above defun (x) is a list. how?

;; //"Object-Oriented Programming in Common Lisp: A Programmer's Guide to CLOS" by Sonya E. Keene, is the best book on CLOS.


(defun our-fourth (x)
  (car(cdr(cdr(cdr x)))))
;; x is a variable
;;x here is a parameter of fun our-fourth
(our-fourth '(1 2 3 7))

;; unquoted list is treated as code
;; unquoted symbol is treated as variable
'x
x
;;function is a generalised version of lisp expression
(> (+ 1 4) 3)
(defun sum-greater(x y z)
  (> (+ x y) z))
(sum-greater 1 4 3)
(sum-greater (1 4 3))
;;unnessary bracketing
;;recursion - a function calling itself
(eql 1 1)
(== 2 2)

(defun our-member (obj lst)
  (if (null lst)
  nil
  (if (eql (car lst) obj)
      lst
      (our-member obj (cdr lst)))))
(our-member 'a '(a n o o p))
(our-member 'p '(a n o o p))
(our-member 'o '(a n o o p))


;;need to learn sublime text like multiple cursors

;;input output
;;output -> format function
(format t "~A plus ~A equals ~A.~%" 2 3 (+ 2 3))
(format t "hello world")
;;input -> read function
;; read also parses the input into the appropriate data type
(read)
(defun askem(string)
  (format t "~A ~%" string)
  (read))
(askem "one billion equals ? millions")

;;variables
;;let defines local variables
(let ((x 1) (y 3))
     (+ x y))
;;let command needs extra bracketing
;; not actually extra if you think logically as to min
;;  no. of brackets needed for assigning multiple variables
;;   at once
(let (x 2) (y 3))
(let ((x 2) (y 3)))
(let (x y))
(let x 1)
(let ((x 1))
  (+ 0 x))

(let ((x 1) (y 3))
  (+ x y))

(defun ask-number()
  (format t "enter a number baby:")
  (let ((val (read)))
    (if (numberp val)
	val
	(ask-number))))
;;global variable
;;later we will learn to define
;;  global variables implicitly using setf, i. e. setfield

;; defparameter is explicit manner
(defparameter *glob* 69)
(numberp *glob*)
;; ** naming convention
;;global constant
(defconstant anoop 69)
(numberp anoop)
(defconstant gr(+ *glob* 1))
(listp gr)
(format t "~A" gr)
;;recall that returning 70 is a side effect,
;; NIL is the return value, without side effects there is
;;  no point in writing multiple expressions in a single defun

;;is a variable name bound as global
;;  notice that variable name is a symbol, hence needs to be
;;    quoted as we learnt earlier
(boundp '*glob*)
(boundp 'anoop)
(boundp 'pg)

;;general assign:
;; setf name comes from set field
(setf n 3)
(format t "earlier defined n is ~% in fact global n=~A" n)
;; setf is global unless already locally defined
;; setf is implicit global assignment
(let ((x 3))
  (setf x 8))
;;in above x locally existing, so non global x=8
(setf myname '(a n o o p))
(setf x (list 'a 'b 'c))
x
;; first arg of setf can be an expression
(setf (car x) 'n)
x
;; this flexibility of setf, we will term as settable
(setf a 1
      b 2
      c 3)
(+ a b c)
;; unlike let setf doesnt require bracketing
(setf (a 1 b 2 c 3))
(setf a 1 b 2 c 9)
(+ a b c)
;;functional prog, avoiding side-effects
(setf lst '(c a r a t))
(remove 'a lst)
lst
;;non functional way, avoid
(setf newlst (remove 'a lst) )
newlst
;;iteration;;

(defun show-squares (start end)
  (do ((i start (+ i 1)))
      ;;double brackets so that multiple i j k etc possibility
      ((> i end) 'done)
  (format t "~A ~A ~%" i (* i i))))
(show-squares 1 5)

(do ((i 1 (+ i 1))) ;varlist
    ((eql i 5) 'donewithloop) ;endlist
  (format t "aaammm ~% "))

;;doubt - debug below programme ????
;; ????????????????????
;;  trouble is that do syntax includes a first argument that
;;   tests weather to reloop, no if needed there
(do ((i 1 (+ i 1)))
;;    (if (eql i 5)  ;; mistake here
	;;(format t "end loop")
	;;'done
  	;;(format t "~A;;;" i)
    ;;'done
3
    )

(do ((i 1 (+ i 1)))
    ((eql i 5) i) ;;endlist contains what to do after loopend   condition is true (()) <- min braces in endlist is 2
  ;; returning something will stop a loop? no!!
  (format t "hello  "))

(defun show-cubes (start end)
 (do ((i start (+ i 1)))
      ((> i end) 'done)
      (format t "~A ~A~%" i (* i i i))))
(show-cubes 1 5)

;; above using recursion
(defun show-cb (start end)
  (format t "~A ~A ~%" start (* start start start))
 (if (< start end)
     (show-cb (+ start 1) end)
     'done))
(show-cb 1 5)

;;progn
(progn
  (format t "~%~%takes any no. of expressions~%")
  (format t "evaluates in order, returns value of last exp")
  'progn_ends)

;;iterate elements of a list
(defun our-length (lst)
  (let ((len 0))
    (dolist (obj lst) ; obj carries the temp item from lst each loop
      (setf len (+ len 1)))
    len))
(our-length '(a n o o p gr))

;;above using recursion, good eg of recursion
(defun our-length (lst)
  (if (null lst)
      0
      (+ (our-length (cdr lst)) 1)))

;;functions as objects
(function +)
;; abbreviated as sharp quote #'
#'+
;;like quote function is a special operator
;; so we dont have to quote function argument ???

;; sharp quoted function is an object that we can feed
;;   other functions
(apply #'+ '(2 3 4))
(+ 2 3 4)
;; apply needs last arg as a list
(apply #'+ 2 3 '(4))
;; apply cant handle if last arg is not a list
(apply #'+ 2 3 4)
;; funcall does not need arg to be packed in list
;;  but funcall cant handle list
(funcall #'+ 2 3 4)
(funcall #'+ 2 3 '(4))
;; lambda: used to call a function literally
(lambda (x y); notice x y are bracketed
   (+ x y))

((lambda (x y); notice x y are bracketed
   (+ x y)) 68 1)

;; doubt ????:
;;   (lambda (x y); notice x y are bracketed
;;       (+ x y))
;;   (funcall #'(lambda (x y)) '2 '3)
;;   (progn
;;     (setf g ((lambda (x) (y)) 2 3))
;;     (format t "~A" g)
;;     'prognends)

((lambda (x) (+ x 100)) 1)

(funcall #'(lambda (x) (+ x 100))
	 3)
;; this allows using functions w/o naming them

;;types:

;; checking object's type
(typep 69 'fixnum)
(typep 69 'integer)
(typep 69 'rational)
(typep 69 'real)
(typep 69 'atom)
(typep 69 't)

(typep + 'real)
(typep + 'atom)


;; chap 2 exercise:
(list 1 (+ 2 3))
(list nil 3)
(cons 'a '(b c))
(cons 'a (cons 'b (cons 'c nil)))
(cons 'a (cons 'b '(c)))

(defun our-fourth (lst)
  (car(cdr (cdr (cdr lst)))))
(our-fourth '(1 2 3 9))

(defun greater (x y)
  (if (> x y)
      x
      y))
(greater 33 9)
'(nil a)
(null (car '(nil a)))

(defun enigma (x)
  (and (not (null x))
       (or (null (car x))
	   (enigma (cdr x)))))
(enigma '(a b c))
(enigma '(a b nil))
(enigma '())
(enigma '(nil a b))

x=a
y=(n o o p a)

mys a (n o o p a)
if nil
    nil
    if eql n a
       0

       let z=mys a (o o p a)
       z+1

car
or
(apply #'list 1 nil)

(defun element-list (lst)
  (let ((element "false"))
  (dolist (obj lst)
    (if (listp obj)
	(setf element "true")))
  element))

(defun element-list (lst)
  (let ((element 'false))
  (dolist (obj lst)
    (if (listp obj)
	(setf element 'true)))
  element))

(element-list '('(n o op) g r '(t r u e)))
(element-list '(a n o o p))
(listp '(anoop))
(listp 'a)
(let ((element 'false)))
element

(defun dot-print (num)
  (format t ".")
  (setf num (- num 1))
    (if (> num 0)
      (dot-print num))
  'end)
(dot-print 9)

(defun dot-print (num)
  (do ((i num (- i 1)))
      ((eql i 0) 'done)
    (format t ".")))
(dot-print 89)

(defun occur-count (test lst)
  (let ((count 0))
    (dolist (obj lst)
    (if (eql test obj)
	(setf count (+ count 1))))
count))

(occur-count 'o '(a n o o p))
(occur-count 'a '(a n o o p))

;;recursive
(setf count 0)
(defun occur-count (test lst)

    (if (eql test (car lst))
	(progn(setf count (+ count 1))))
    (if (null (car lst))
	count
	(occur-count test (cdr lst))))

;; better recursive
(defun occur-count (test lst)
    (if (null (car lst))
	0
	(+     (if (eql test (car lst))
		   1
		   0)
	       (occur-count test (cdr lst)))))
(defun summit (lst)
  (remove nil lst)
  (apply #'+ lst))
(summit '(1 1 1 3 3))
(summit '(1 1 1 nil 3))

(remove nil '( 1 1 1 nil 3))

(defun summit (lst)
  (apply #'+(remove nil lst)))

(defun summit (lst)
  (let ((x (car lst)))
    (if (null x)
	(if (eql nil (cdr lst))
	    0
	    (summit (cdr lst)))
	(+ x (summit (cdr lst))))))

;;chapter 3 starts
consp nil
consp ()
(consp 'a)
(consp '(a))
(consp(cons 'a nil))
;; any list can be considered as car + cdr
(defun our-listp(x)
  (or (null x) (consp x)))
(listp nil)
(atom nil)
(typep nil 'atom)
(typep nil 'list)
(consp nil)
(defun our-atom(x)
  (not (consp x)))
;;equality
(cons 'a nil)
(eql (cons 'a nil) (cons 'a nil))
(setf x (cons 'a nil))
x
(eql x x)
(eql x (cons 'a nil))
;; eql vs equal
;; eql for lists means same list and same cons
;; equal for lists means same print outputs
(equal x (cons 'a nil))

(defun our-equal-forLists (x y)
  (or (eql x y)
      (and (consp x)
	   (consp y)
	   (our-equal (car x) (car y))
	   (our-equal (cdr x) (cdr y)))))

;; no pointers
(setf x '(a b c))
;; same element and same conses
(setf y x)
(eql x y)
(setf (car y) 'e)
x
(setf y (copy-list x))
(setf (car y) 'f)
x
y
;;3.4 building lists
;; same elements but new conses
(setf x '(a b c)
      y (copy-list x))
(eql x y)
y
(setf z '(a b c))
(setf (car z) 'e)
z
y
(atom 'a)
(atom a)
(cons 'a '(b))
(consp '(a g))
(defun our-copylist (lst)
  (if (atom lst)
      lst
      (cons (car lst) (our-copylist (cdr lst)))))

(setf x '(a b c)
      y (our-copylist x))
y
(eql x y)
;; append
(append 'a 'n 'o 'o 'p)
(append 'a '(n o o p))
;; all should be lists
(append '(a n) '(o o) '(p))

;; 3.5 compression, run length encoding
(list 3 'a)

(defun n-elts (n elt)
  (if (> n 1)
      (list n elt)
      elt))
(defun compr (n elt lst)
  (if (null lst)
      (list (n-elts n elt))
      (let ((next (car lst)))
	(if (eql next elt)
	    (compr (+ n 1) elt (cdr lst))
	    (cons (n-elts n elt)
		  (compr 1 next (cdr lst)))))))
(defun compress (x)
  (if (consp x)
      (compr 1 (car x) (cdr x))
      x))
(compress 'a)
(compress '(a a a c f d d d))


;; my akward implementation
(defun recur-check (lst count)
  (let ((next (car lst)))
    (if (null lst)
	(list(build count now))
	(if (eql next now)
	    (recur-check (cdr lst) (+ count 1) now)
	    (build count now)))))
(recur-check '(a n o o p) 1 'a)

(defun build (n atom)
  (if (> n 1)
      (list n atom)
      atom))
(build 1 'd)
(build 3 's)

(defun compr (lst count)
  (let ((next (car (cdr lst))))
    (if (null next)
	(list (build count (car lst)))
	(if (eql (car lst) next)
	    (compr (cdr lst) (+ count 1))
	    (cons (build count (car lst)) (compr (cdr lst) 1))))))

(compr '(a a a c d) 1)
(compr '(a a a c c d d d) 1)
(compr '(a) 1)
(compr 'a) ;; bug
(defun compress (lst)
  compr (lst 1))
(consp '(a))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; retry run length compression
(defun build (n atom)
  (if (> n 1)
      (list n atom)
      atom))
(build 2 'a)
(build 1 'a)

(defun compr (lst count)
  (let ((first (car lst)) (second (car (cdr lst))))
    (if (null second)
	(list (build count first))
	(if (eql first second)
	    (compr (cdr lst) (+ count 1))
	    (progn (format t "~A ~%" lst)
		   (cons (build count first) (compr (cdr lst) 1))))))
  (format t "~%but here list remains unaltered, i e functional approach ~A" lst))
(compr '(a a a b c d d) 1)
(cons 'a '(b))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; textbook style copycat

(defun n-elts (elt n)
  (if (> n 1)
      (list n elt)
      elt))
(defun compr (elt n lst)
  (if (null lst)
      (list (n-elts elt n))
      (let ((next (car lst)))
	(if (eql next elt)
	    (compr elt (+ n 1) (cdr lst))
	    (cons (n-elts elt n)
		  (compr next 1 (cdr lst)))))))
(defun compress (x)
  (if (consp x)
      (compr (car x) 1 (cdr x))
      x))
(compress 'a)
(compress '(a a a c f d d d))

;; uncompress
(atom (car (compress '(a a a c f d d d))))
(atom 'd)

;; uncompress anoop version, its not purely functional
;;  as base is getting modified??
(defun ncons (times atom)
  (let ((base nil))
    (do ((i 1 (+ i 1)))
	((> i times))
;;      (format t "~Ahello " i)
      (setf base (cons atom base)))
    base))
 
(ncons 4 'a)

(defun uncompress (clst)
  (do ((first (car clst)))
      ((null first) 'donebaby)
    (if (atom (car clst))
	(setf base (cons first (uncompress (cdr clst))))
	)))


(defun uncompress (clst)
  (setf first (car clst))
  (if (null first) base)
  (setf base (cons first (uncompress (cdr clst)))))
  ;;return appro)
(uncompress '(a e))

(format t "hello anoop~%")
;;Fri Aug 28 16:11:43 IST 2015
;; back to textbook, page 38


























