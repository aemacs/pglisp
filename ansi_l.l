;; backup is in ~/emacs-backups && talkgen gitlab account
;; *chapter 1*
;; //check out errata of book on completing the book
;; //check out books on functional programming
;; //check out books on lambda calculus

;;sum of nums less than n
(defun sum (n)
  (let ((s 0))
  (dotimes (i n s)
    (incf s i))))
(sum 5)
(+ 1 2 3 4)
(defun addn (n)
  #'(lambda (x)
      (+ x n)))
(funcall (addn 3.14) 7)
;; *chapter 2*
; not all operators in lisp are function calls, but MOST ARE
;; all function calls follow evaluation rule
;; let us term operators that do not follow eval rule as special operators
'(+ 4 3)
;;integer
3
;;a
;;char unquoted is errored as it becomes undefined variable

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
;;(nil)
;; this is a mistake why? nil is evaled as a function,so...
;; note list itself should not be called as bracket 
;;(list ('I 'am (+ 18 3) 'years 'old))
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
;;(twentieth '(a b c d))
;;error
;; only till tenth
t
;;f 
;; only t is bound , f is unbound
;; falsity is returned as nil
;; true false functions are called predicates
;; listp is one such predicate, predicates often have names ending in *p
;; atom is also a predicate
(listp '(a b c))
(listp (cons "hello" "world"))
(listp '("anoop" "gr"))
;;(list ("anoop" "gr")) 
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
;;cond is another elegant alternative to if

;;logical operators:
(and t t)
;;(& t t)
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
(or nil (/ 0 0)) ;;
;;and & or are implemented as macros
;;macros can break eval rule, they are special operators like '

;;functions
(defun foo ())
(list 'x)
'(x)
(third '(a b c d))
(cdr '(a b c d))
(defun our-third (x)
  (car(cdr(cdr x))))
(our-third '(a b c d))

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
;;(sum-greater (1 4 3))
;;unnessary bracketing
;;recursion - a function calling itself
(eql 1 1)

(defun our-member (obj lst)
  (if (null lst)
  nil
  (if (eql (car lst) obj)
      lst
      (our-member obj (cdr lst)))))
(defun our-member (obj lst)
  (cond ((null lst) nil)
	((eql obj (car lst)) lst)
	(t (our-member obj (cdr lst)))))
(our-member 'a '(a n o o p))
(our-member 'p '(a n o o p))
(our-member 'o '(a n o o p))


;;//need to learn sublime text like multiple cursors

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

(defun askname (string)
  (format t "~&~A" string)
  (let ((name (read)))
    (format t "~&your name is ~A" name)))
(askname "Hi, what is your name?")

;;variables
;;let defines local variables
(let ((x 1) (y 3))
     (+ x y))
;;let command needs extra bracketing
;; not actually extra if you think logically as to min
;;  no. of brackets needed for assigning multiple variables
;;   at once
;;(let (x 2) (y 3))
(let ((x 2) (y 3)))
(let (x y))
;;(let x 1)
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

;;is a variable name bound as global check with boundp
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
;; unlike let setf doesnt require bracketing, just even no. of args
;;(setf (a 1 b 2 c 3))
(setf a 1 b 2 c 9)
(+ a b c)
;;functional prog, avoiding side-effects
(setf lst '(c a r a t))
(remove 'a lst)
lst
;;non functional way, avoid
(setf lst (remove 'a lst) )
lst
;;iteration;;

(defun show-squares (start end)
  (do ((i start (+ i 1)))
      ;;double brackets so that multiple i j k etc possibility
      ((> i end) 'done)
  (format t "~A ~A ~%" i (* i i))))
(show-squares 1 5)

(do ((i 1 (+ i 1))) ;varlist
    ((eql i 5) 'donewithloop) ;endlist
  ;body:
  (format t "aaammm ~% "))

(do ((i 1 (+ i 1)))
    ((eql i 5) i)
  ;;endlist contains what to return after end of iteration
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

;;progn, returns value of last expression
(progn
  (format t "~%~%takes any no. of expressions~%")
  (format t "evaluates in order, returns value of last exp")
  'progn_ends)
;;prog1, returns value of 1st exp

;;iterate elements of a list
(defun our-length (lst)
  (let ((len 0))
    (dolist (obj lst)
      ;; obj carries the temp item from lst each loop
      (setf len (+ len 1)))
    len))
;;if do was used above, setf could have been avoided
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
;; apply cant handle if last arg is not a list:
;;(apply #'+ 2 3 4)
;; funcall does not need arg to be packed in list
;;  but funcall cant handle list
(funcall #'+ 2 3 4)
;;(funcall #'+ 2 3 '(4))
;; lambda: used to call a function literally
(lambda (x y); notice x y are bracketed
  (+ x y))

((lambda (x y); notice x y are bracketed
   (+ x y)) 68 1)

((lambda (x) (+ x 100)) 1)

(funcall #'(lambda (x) (+ x 100))
	 3)
;; this allows using functions w/o naming them

;;types: davids book has a nice tree diagram of various types

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;chapter 3 starts: Lists
(consp nil)
(consp ())
(consp 'a)
(consp '(a))
(consp (cons 'a nil))
;; any list can be considered as car + cdr
(defun our-listp (x)
  (or (null x) (consp x)))
(listp nil)
(atom nil)
(typep nil 'atom)
(typep nil 'list)
(setf *a* 8)
(type-of *a*)
(consp nil)
(defun our-atom(x)
  (not (consp x)))
;;equality
(cons 'a nil)
(eql (cons 'a nil) (cons 'a nil))
(equal (cons 'a nil) (cons 'a nil))
(setf x (cons 'a nil))
x
(eql x x)
(eql x (cons 'a nil))
;; eql vs equal
;; eql for lists means same list and same cons cells???
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
(boundp 'a)
(atom a)
(cons 'a '(b))
(consp '(a g))
(defun our-copy-list (lst)
  (if (atom lst)
      lst
      (cons (car lst) (our-copylist (cdr lst)))))
;;unlike our-copy-tree we only recurse operate on cdrs

(setf x '(a b c d)
      y (our-copy-list x))
y
(eql x y)
;; append
;;(append 'a 'n 'o 'o 'p)
;;(append 'a '(n o o p))
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
(append '(a a a) '(c d))
;; lets try compress uncompress my own one more time
;;Sat Aug 29 22:27:42 IST 2015
(defun ncons2 (lst)
  (let ((base nil))
    (do ((i 1 (+ i 1)))
	((> i (car lst)))
      (setf base (cons (second lst) base))
      )
    base))
(ncons2 '(3 a))
(defun uncompress (clst)
  (if (consp clst)
      (if (consp (car clst))
	  (append (ncons2 (car clst)) (uncompress (cdr clst)))
	  (cons (car clst) (uncompress (cdr clst)))
	  )
      clst))
(uncompress '((2 a) b))

;; back to textbook
(nth 1 '(a n o o p))
(nthcdr 1 '(a n o o p))
;; so cdr=nthcdr 1
;; in lisp data structures are zero indexed, ie numbering  starts with 0 1 2 3 etc

;;Thu Sep  3 15:54:04 IST 2015
;; 3.6 Access
(nthcdr 3 '(a n o o p))
(nth 0 '(a n o o p))
;; nth is like nthcar misnomer
;; define nthcdr
(defun our-nthcdr (n lst)
  (if (> n 0)
      (our-nthcdr (- n 1) (cdr lst))
      lst))
(our-nthcdr 2 '(a n o p))
(our-nthcdr 0 '(a n o p))
(our-nthcdr 6 '(a n o p))

(zerop 0)

;; return last cons in a list:
(last '(a n o o p))
;; return last element of a list:
(car (last '(a n o o p)))

;; first, second, ... tenth:
;;   they are not zero indexed
(tenth '(1 2 3 4 5 6 7 8 9 10))
(fifth '(1 2 3 4 5 6 7 8 9 10))

(apply #'+ '(1 2 3))

(format t "pay the price | ")
;; end: Thu Sep  3 16:20:32 IST 2015

;; start: Thu Sep  3 17:35:44 IST 2015
;; mapping functions, calling on each and every member of a list
;; this is different from applying in bulk together on all members using apply:
(apply #'+ '(1 1 1))
(apply #'(lambda (x) (+ x 10)) '(1))
(mapcar #'(lambda (x) (+ x 10)) '(1 2 3))
(mapcar #'(lambda (x) x) '(1 2 3))

(list 'a 'b 'c)
(list '(a b c) '(1 2 3))
;; as the name suggests mapcar -> map the cars
;; mapcar 1 or more lists, returns result of applying function
;; to elements taken from each list until some list runs out
(mapcar #'list '(a b c) '(1 2 3))

;; maplist -> map successive cdrs
(maplist #'(lambda (x) x) '(1 2 3))

;; mapc, mapcan - we will study later

;; cons analogy to binary trees
;;  car=left branch, cdr=right branch, mistake in book??

;; copy tree copies a tree and returns a copy of it
(let ((tr '(a (b c) d)))
  (copy-tree tr))

(defun our-copy-tree(tr)
  (if (atom tr)
      tr
      (cons (our-copy-tree (car tr))
	    (our-copy-tree (cdr tr)))))
;;(dtrace our-copy-tree)
;; above recurses down both car and cdr
;;  such functions are called doubly recursive
;;  this is how most operations on lists are defined

(let ((tr '(a (b c) (d e))))
  (our-copy-tree tr))
(our-copy-tree 'b)
(our-copy-tree '(b))
(our-copy-tree '((a)))
(cons 'a '(b))

;; how is above different from our-copy-list??
;;say list= (a (b c) d)

;;copy-list:
(cons 'A
      (cons '(b c)
	    (cons 'D
		  'nil)))
(our-copy-tree 'a)
;;copy-tr:
(cons 'a
      (cons (cons 'b
		  (cons 'c
			'())
		  )
	    (cons 'd
		  '())
	    )
      )

;; start: Fri Sep  4 15:45:33 IST 2015
;; copy-tree is more useful than copy-list
;; copy-tree helps operate on a list and all lists within that list
;;eg: how to substitute y for x in below line
(and (integerp x) (zerop (mod x 2)))

(substitute '- 'o '(a n o o p))
(substitute '- 'o '(a n o o (o o p)))

;;start: Sat Sep  5 12:13:20 IST 2015
(substitute 'y 'x '(and (integerp x) (zerop (mod x 2))))

;;Sun Sep  6 17:29:20 IST 2015
;; unlike substitute subst is a tree operation
(subst 'y 'x '(and (integerp x) (zerop (mod x 2))))
(subst '- 'o '(a n o o (o o p)))
(car (car (nthcdr 2 '(and (integerp x) (zerop (mod x 2))))))
(defun our-subst (new old tree)
  (if (equal tree old)
      new
      (if (atom tree)
	  tree
	  (cons (our-subst new old (car tree))
		(our-subst new old (cdr tree))))))

(defun our-subst (old new tr)
  (cond ((null tr) nil)
	((eql tr old) new)
	((atom tr) tr)
	(t (cons (our-subst old new (car tr))
		 (our-subst old new (cdr tr))))))

(defun our-substitute (new old tree)
  (if (equal old tree)
      new
      (if (atom tree)
	  tree
	  (cons (if (equal (car tree) old)
		     new
		     (car tree))
		(our-substitute new old (cdr tree))))))
(defun our-substitute (old new tr)
  (cond ((null tr) nil)
	((eql tr old) new)
	((atom tr) tr)
	(t (cons (if (eql (car tr) old)
		     new
		   (car tr))
		 (our-subst old new (cdr tr))))))
(our-subst 'x 'y '(y (y y)))
(subst 'x 'y '(y (y y)))
(substitute 'x 'y '(y (y y)))
(our-substitute 'x 'y '(y (y y)))

;;start Fri Sep 11 18:51:12 IST 2015
;;3.10 sets
(member 'p '(a n o o p))
(member (car (cons 'p nil)) '(a n o o p))
(eql 'p 'p)
;;keyword, specific to the function there are keywords
;; eg: for func 'member': 1.test 2.key
;; check available keywords using C-c C-d d
(member 'p '(a n o o p) :test #'equal)
(eql '(p) '(p))
(member '(p) '((p) (p) (p)))
(member '(p) '((p) (p) (p)) :test #'equal)
(member 'p '((p) (p) (p)) :key #'car)
(member 'p '((p) (p) (p)) :key #'car :test #'equal)
(member '(p) '(((p)) ((p)) ((p))) :key #'car :test #'equal)
;; order of keywords doesnt matter
(member-if #'oddp '(2 3 4))
(defun our-member-if (fn list)
  (and (consp list)
       (if (funcall fn (car list))
	   list
	   (our-member-if fn (cdr list)))))

(our-member-if #'oddp '(2 3 4))
(funcall #'oddp 3)

;;adjoin union set-difference intersection
;;adjoin is like conditional cons
;;sets by definition contain no repeat elements
;; hence set operations with repeat elements exhibit
;;  wierd unpredictable results
(adjoin 'z '(c d e))
(union '(a n o) '(o p))
(intersection '(a b c) '(b c d))
(set-difference '(a b c d) '(c d))

;;3.11 lists ~ squences
(length '(a n o o p))
;;subsequence ~ subseq
(subseq '(a n o o p) 0 2)
(subseq '(a n o o p) 1)
;;reverse
(reverse '(a n o o p))
;;palindrome
(let ((x '(m a d a m)))
  (equal x (reverse x)))

(sort '(3 8 9 2 4) #'<)
(defun nthmost (list n)
  (nth (- n 1)
       (copy-list (sort list #'<))))
(nthmost '(1 2 3 4 8 0) 3)

(every #'oddp '(1 3 5))
(some #'evenp '(3 4 5))
(every #'> '(2 3 4) '(1 2 2 9))
;; end 19:46
;;start Fri Sep 11 21:04:55 IST 2015
;;3.12 stacks
(setf lst '(b))
(push 'a lst)
lst
(pop lst)
lst
(defun our-pop (list)
  (let ((f (car list)))
    (setf list (cdr list))
    f))
(our-pop '(a b))

(setf x '(b))
(push 'a x)
x
(setf y x)
(pop x)
x
y

(defun our-reverse (lst)
  (let ((base nil))
    (dolist (obj lst)
      (push obj base))
    base))
(our-reverse '(a n o o p))
;;pushnew
(setf lst '(a b))
(pushnew 'a lst)
(pushnew 'e lst)
;;note that the following gives error
;;(push 'a '(b))
;;(pushnew 'a '(a b))

;;3.13 dotted list
;;end Fri Sep 11 21:37:04 IST 2015

;;start Sat Sep 12 13:16:02 IST 2015
;;3.13 dotted list
(defun proper-list? (lst)
  (or (null lst)
      (and (consp lst)
	   (proper-list? (cdr lst)))))
(proper-list? '(a . b))
(setf lst (cons 'a 'b))
(nthcdr 1 lst)
(nthcdr 2 lst)
(equal lst '(a . b))
'(a. (b. (c. nil)))
'(a . (b . (c . nil)))
(cons 'a (cons 'b (cons 'c 'd)))
;;3.14 Assoc-list or alist ~ a list of conses
(setf translate '((+ . "add") (- . "subtract")))
(assoc '+ translate)
(assoc '- translate)
(assoc '* translate)
;; assoc has keywords, and also assoc-if
(defun our-assoc (item alist)
  (car (member item alist :key #'car)))
(our-assoc '+ translate)

(defun our-assoc (item alist)
  (and (consp alist)
       (let ((first (car alist)))
	 (if (equal item (car first))
	     first
	     (our-assoc item (cdr alist))))))
;; end Sat Sep 12 14:04:12 IST 2015

;; start Sat Sep 12 17:45:18 IST 2015
;;3.15 shortest path
(setf min '((a b c) (b c) (c d)))
(cdr (assoc 'a min))

;;shortest path eg , still have not understood fully??
(defun new-paths (path node net)
  (mapcar #'(lambda (n)
	      (cons n path))
	  (cdr (assoc node net))))

(defun bfs (end queue net)
  (if (null queue)
      nil
      (let ((path (car queue)))
	(let ((node (car path)))
	  (if (eql node end)
	      (reverse path)
	      (bfs end
		   (append (cdr queue)
			   (new-paths path node net))
		   net))))))

(defun shortest-path (start end net)
  (bfs end (list (list start)) net))
(shortest-path 'a 'd min) 

(cdr (assoc 'a min))
(append nil '(b c))
(new-paths '(a) 'a min)

(bfs 'd '((a)) min)
(bfs 'd '((b a) (c a)) min)

;; 3.16 garbage
(setf lst (list 'a 'b 'c))
(setf lst nil)
;; ?? page 54 footnote
*
**
***
;; objects that at a point have no way of reaching
;; are garbage, the garbage collector reclaims them from heap

;;garbage collection in lisp is also termed consing
;; consing may be expensive

;;pg style
;; write initial version in purely functional style wo
;;  worrying about consing etc, later on use non functional
;;   style in critical consing bottlenecks in next versions
;;     see section 13.4

;;exercise ch 3
;; start Sat Sep 12 21:53:56 IST 2015
;;2
(union '(a a b) '(c d a))
(defun new-union (l1 l2)
  (let ((base nil))
    (dolist (obj l1)
      (if (member obj base)
	  nil
	  (setf base (cons obj base))))
    (dolist (obj l2)
      (if (member obj base)
	  nil
	  (setf base (cons obj base))))
    (reverse base)))
(new-union '(a a b) '(c d a))
(new-union '(a b c) '(b a d))

;; wierd behaviour in union, because repeat element
;;  sequences are not sets
(union '(a a b) '(b b b))
(union '(a a b) '(c d a))
(new-union '(a a) '(b b b))
(union '(a a) '(b b b))

;; Basically, UNION only works predictably if the arguments are "sets", not arbitrary lists.
;; Sets, by definition, don't contain duplicates.
;; This is true for all the functions that treat lists as sets.

;; exercises
(defun occur-car (lst)
  (let ((first (car lst)) (n 0))
    (dolist (obj lst)
      (if (eql first obj)
	  (setf n (+ n 1))))
    n))
(occur-car '(a b a a))

(defun occurences (lst)
  (let ((alist nil))
    (do ((1st (car lst) (car lst)))
	((null lst))
      (setf alist
	    (cons (cons 1st (occur-car lst))
		  alist))
      (setf lst (remove 1st lst)))
    (sort alist #'> :key #'cdr)))

(occurences '(a b a a))
(setf lst '(a b a a) 1st 1)
(append '(a b) '(c))
(cons (cons '(a . 1) 'nil) (cons 'b 2))

(setf temp (occurences lst))
(cdr (assoc 'a temp))
(cdr '(a . 3))
(defun pos+ (lst)
  (dolist (obj lst)
    (setf obj (+ obj 1))
    lst))
(pos+ '(1 2 3))
(setf lst '(1 2 3) base nil)

(dolist (obj lst)
  (setf base (cons (+ obj 1) base)))
base
;;recursion
(defun pos+ (lst n)
  (if (null lst)
      nil
      (cons (+ (car lst) n) (pos+ (cdr lst) (+ n 1)))))

(pos+ '(7 5 1 4) 0)

;;iteration
(defun pos+ (lst)
  (let ((n -1) (base nil))
    (dolist (obj lst)
      (setf n (+ n 1))
      (setf base
	    (cons (+ obj n) base)))
    (reverse base)))

;;much better iteration, notice that they dont use let
(defun pos+ (ls)
  (do ((ls1 ls (cdr ls1))
       (i 0 (+ i 1))
       (acc nil (cons (+ i (car ls1)) acc)))
      ((not ls1) (reverse acc))))


(pos+ '(7 5 1 4))

;;mapcar
(defun pos+ (ls)
  (let ((n -1))
    (mapcar #'(lambda (x)
		(setf n (+ n 1))
		(+ x n))
	    ls)))
(pos+ '(7 5 1 4))

(cons 'a '(b))
(defun cons1 (x y)
  (let ((ls '(nil . nil)))
    (setf (car ls) y
	  (cdr ls) x)
    ls))
(cons1 'a '(b))
(cons1 'c nil)

(list 'a 'b 'c)

;; q ch3 q6  ??? skip for now
(defun sd (lst)
  (if (null lst)
      (format t "NIL")
      (progn
	(format t "(~A . " (car lst))
	(sd (cdr lst)))))

(defun showdots (lst)
  (sd lst)
  (let ((len (length lst)))
    (do ((i len (- i 1)))
	((< i 1))
      (format t ")"))))
(sd '(a b c))
(showdots '(a b c))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;chapter4 specialized data structures
;;arrays, structures, hash tables
(setf arr
      (make-array '(2 3) :initial-element nil))
arr
;;aref- array ref
(aref arr 0 0)
(setf (aref arr 0 0) 'b)
(setf vec
      (make-array '4 :initial-element 'a))
(vector 'a "b" 8 'whatever)
#(a "b" 8 whatever)
;;svref- simple vector ref
(svref vec 0)
;;eg: binary search for sorted vector2
(defun bin-search (obj vec)
  (let ((len (length vec)))
    (and (not (zerop len))
	 (finder obj vec 0 (- len 1)))))

(defun finder (obj vec start end)
  (format t "~&~A" (subseq vec start (+ end 1)))
  (let ((range (- end start)))
    (cond ((zerop range)
	   (if (eql obj (svref vec start))
	       obj
	       nil))
	  (t (let* ((mid (+ start (round (/ range 2))))
		    (obj2 (svref vec mid)))
	       (cond ((< obj obj2) (finder obj vec start (- mid 1)))
		     ((> obj obj2) (finder obj vec (+ mid 1) end))
;;		     ((eql obj obj2) obj)
		     (t (finder obj vec mid mid))))))))
(setf vectest (make-array '9 :initial-contents '(1 2 3 4 5 6 7 8 9)))
vectest
(bin-search 4 vectest)
(bin-search 8 vectest)
(dtrace bin-search finder)
(duntrace)
(finder 8 vectest 5 8)
;;;; heading
;;; describe what a fun does
;; describe line below
; same line as code comment
#|block
   comment|#
;;;;4.3 strings and chars
#\a
;;strings are vectors of characters
(sort "elbow" #'char<)
(sort "elbow" #'char>)
(aref "abc" 1)
(reverse "abcd")
;;aref-array, svref-simple vector, char-string
(char "abc" 1)
(equal "pony" "PoNy")
;;ignore case
(string-equal "pony" "PoNy")
;;string join using format
(format nil "~A or ~A" "truth" "dare!")
(concatenate 'string "hello" " world")
(concatenate 'list '(a c) '(d f))
;;general access, elt -> works for any sequence: array or vector or string
(elt "anoop" 1)
(elt '(a n o o p) 1)
(setf arr2
      (make-array '5 :initial-contents '(a n o o p)))
arr2
(elt arr2 1)
;; sharp backslash = character
(position #\a "anoop")
(position #\a "fantasia-be" :start 3 :end 6)
;;:from-end calculates indexes in usual from start way
(position #\a "fantasia-be" :from-end t)
;;position of elt whose car is 'a
(position 'a '((g r a n) (o o p) (a third)) :key #'car)
(position '(a) '((c) (a) (b)) :test #'equal)
(position 9 '(2 8 7 3 11 8 7) :test #'<)
(defun second-word (str)
  (let* ((gap1 (position #\  str))
	(gap2 (position #\  str :start (+ gap1 1))))
    (subseq str (+ gap1 1) gap2)))
(second-word "take the pill")
(second-word "form always must follow function")
(position-if #'oddp '(2 3 4))
(member-if #'oddp '(2 3 4))
(find #\a "anoop")
(find-if #'characterp "33an")
;;unlike member find and find-if only return the char, not complete remaining string
;;find-if can almost always be neater written using find and :key
(setf *lst* '((a h o o) (n)))
(find-if #'(lambda (x)
	     (eql (car x) 'a))
	 *lst*)
(find 'a *lst* :key #'car)
;;retain only last occurence
(remove-duplicates "anoopa")
(reduce #'fn '(a b c d))
(eval '(fn 'a 'b 'c 'd))
(eval '(fn (fn (fn 'a 'b) 'c) 'd))
(defun fn (&rest args )
  args)
(reduce #'intersection '((b r a d 's) (b a d) (c a t)))
;;4.5 parsing dates
;;input 16 aug 1980
;;output 16 8 1980
(defun tokens (str test start)
  (let* ((p1 (position-if test str :start start))
	 (p2 (position-if #'(lambda (c)
			      (not (funcall test c)))
			  str :start p1)))
    (cons (subseq str p1 p2)
	  (if p2
	      (tokens str test p2)
	      nil))))
(defun constituent (c)
  (and (graphic-char-p c)
       (not (char= c #\ ))))
(tokens "ab12 3cde.f" #'alpha-char-p 0)
(tokens "ab12 3cde.f" #'constituent 0)
(setf month-names
  #("jan" "feb" "mar" "apr" "may" "jun" "jul" "aug" "sep" "oct" "nov" "dec"))
(arrayp month-names)
(defun parse-date (str)
  (let ((toks (tokens str #'constituent 0)))
    (list (parse-integer (first toks))
	  (parse-month (second toks))
	  (parse-integer (third toks)))))
(defun parse-month (str)
  (let ((p (position str month-names :test #'string-equal)))
    ;;string-equal because it is NOT case sensitive
    (if p
	(+ p 1)
	nil)))
(parse-integer "03244")
(parse-month "sep")
(parse-date "12    aug   1980")
(dtrace parse-date tokens)
(duntrace)
(dtrace parse-month)
;;parsing string number into integer
(digit-char-p #\8)
;;so can build your own parse-integer instead of using built in

(defun parse-integer2 (str)
  (do* ((loop-count 0 (+ loop-count 1))
	(top (char str 0) (char str
				(- loop-count 1)))
	(result 0 (+ (* result 10)
		     (digit-char-p top))))
       ((equal (length str)
	       loop-count) result)))
(parse-integer2 "839977")
(char "anoop" 8)

;;structures
(defstruct point
  x
  y)
;;funs auto defined: make-point point-p copy-point point-x point-y
(setf test (make-point))
(setf (point-x test) 2
      (point-y test) 8)
test
(setf test (make-point :x 3 :y 9))
(type-of test)
(defstruct programmer
  (type (progn
	  (format t "What language programmer is he?")
	  (read)))
  (effect nil))
(make-programmer)
(defstruct (point (:conc-name p)
		  (:print-function print-point))
  (x 0)
  (y 0))
;;conc-name = concatenate 'p' in front of field names to make   up the access functions
;;by default the conc-name = name of structure-
;; it is bad manners to change like we have done
(defun print-point (p stream depth)
  (format stream "#<~A, ~A>" (px p) (py p)))
(setf test (make-point))
(print-point test t nil)
;;d, depth = ignore for now

;;eg: binary search tree
;;elt , right-r, left-l
(defstruct (node (:print-function
		  (lambda (n s d)
		    (format s "#<~A>" (node-elt n)))))
  elt
  (l nil)
  (r nil))
;;bst insert anoop using cond
(defun bst-insert (obj bst <)
  (cond ((null bst)
	 (make-node :elt obj))
	((null obj) bst)
	(t
	 (let ((elt (node-elt bst)))
	   (cond ((eql obj elt) bst)
		 ((funcall < obj elt)
		  (make-node :elt elt
			     :l (bst-insert obj (node-l bst) <)
			     :r (node-r bst)))
		 ((not (funcall < obj elt))
		  (make-node :elt elt
			     :l (node-l bst)
			     :r (bst-insert obj (node-r bst) <))))))))

(setf nums3 nil)
(dolist (x '(5 8 4 2 1 9 6 7 3))
  (setf nums3 (bst-insert x nums3 #'<)))
(dtrace bst-insert)
;;bst insert pg using if
(defun bst-insert (obj bst <)
  (if (null bst)
      (make-node :elt obj)
      (let ((elt (node-elt bst)))
	(if (eql obj elt)
	    bst
	    (if (funcall < obj elt)
		(make-node
		 :elt elt
		 :l (bst-insert obj (node-l bst) <)
		 :r (node-r bst))
		(make-node
		 :elt elt
		 :l (node-l bst)
		 :r (bst-insert obj (node-r bst) <)))))))
(dtrace bst-insert)
(dolist (x '(5 8 4 2 1 9 6 7 3))
  (setf nums (bst-insert x nums #'<)))

#| this defn gives when elt is not in bst, need to debug?
(defun bst-find (obj bst <)
  (let ((elt (node-elt bst)))
    (cond ((null bst) nil)
	  ((eql obj elt) bst)
	  ((funcall < obj elt) (bst-find obj (node-l bst) <))
	  (t (bst-find obj (node-r bst) <)))))
|#
(defun bst-find (obj bst <)
  (if (null bst)
      nil
      (let ((elt (node-elt bst)))
	(if (eql obj elt)
	    bst
	    (if (funcall < obj elt)
		(bst-find obj (node-l bst) <)
		(bst-find obj (node-r bst) <))))))
(defun bst-min (bst)
  (and bst
       (or (bst-min (node-l bst))
	   bst)))
(defun bst-max (bst)
  (and bst
       (or (bst-max (node-r bst))
	   bst)))

(setf nums nil)
(dolist (x '(5 8 4 2 1 9 6 7 3))
	(setf nums (bst-insert x nums #'<)))
(dtrace bsd-insert)
(bst-min nums)
(bst-max nums)
(bst-find 4 nums #'<)

(defun bst-remove (obj bst <)
  (if (null bst)
      nil
      (let ((elt (node-elt bst)))
	(if (eql obj elt)
	    (percolate bst)
	    (if (funcall < obj elt)
		(make-node
		 :elt elt
		 :l (bst-remove obj (node-l bst) <)
		 :r (node-r bst))
		(make-node
		 :elt elt
		 :l (node-l bst)
		 :r (bst-remove obj (node-r bst) <)))))))
(defun percolate (bst)
  (cond ((null (node-l bst))
	 (if (null (node-r bst))
	     nil
	     (rperc bst)))
	((null (node-r bst))
	 (lperc bst))
	(t (if (zerop (random 2))
	       (lperc bst)
	       (rperc bst)))))
(defun rperc (bst)
  (make-node :elt (node-elt (node-r bst))
	     :l (node-l bst)
	     :r (percolate (node-r bst))))
(defun lperc (bst)
  (make-node :elt (node-elt (node-l bst))
	     :l (percolate (node-l bst))
	     :r (node-r bst)))
(bst-find 2 nums #'<)
(setf nums (bst-remove 2 nums #'<))
;;princ just prints a single object and returns the object
(princ 'anoop)
(defun bst-traverse (fn bst)
  (when bst
    (bst-traverse fn (node-l bst))
    (funcall fn (node-elt bst))
    (bst-traverse fn (node-r bst))))
(bst-traverse #'princ nums)

;;hash tables, faster assoc lists
(setf ht (make-hash-table))
;;(gethast key hashtable)
(gethash 'color ht)
(setf (gethash 'color ht) 'red)
(gethash 'color ht)
(setf bugs (make-hash-table))
;;instead of setf can use push as well
(push "doesnt take keyword args"
      (gethash #'our-member bugs))
(gethash #'our-member bugs)
;;large sets are faster as hash-tables than as list-sequences
(setf fruit (make-hash-table))
(setf (gethash 'apricot fruit) 'yes-itsAfruit)
(gethash 'apricot fruit)
(remhash 'apricot fruit)
(gethash 'apricot fruit)
;;traverse hash table
(setf (gethash 'shape ht) 'spherical
      (gethash 'size ht) 'giant)
(maphash #'(lambda (k v) ;k-key v-value
	     (format t "~&~A = ~A" k v))
	 ht)
;;exercises chapter4
(defun 90rotate (arr)
  (let* ((dim (array-dimension arr 0))
	 (dim-lst (list dim dim)))
    (make-array dim-lst :initial-contents (ans-conser arr 3))))
(90rotate arr)
(ans-conser arr 3)
(array-dimension arr 0)
(setf arr (make-array '(3 3) :initial-contents '((1 2 3)
						 (4 5 6)
						 (7 8 9))))
(ans-conser arr 3)
(append '(a) nil)
(defun ans-conser (arr1 dim1)
  (do ((j 0 (+ j 1))
       (ans1 nil (append ans1
			 (list (reverse-column arr1 j)))))
      ((eql j dim1) ans1)
    (;;empty body
     )))
(ans-conser ans 3)
(defun reverse-column (arr1 j)
  (reverse (extract-column arr1 j)))

(defun extract-column (arr1 j)
  ;;i-rows j-columns
  (do ((i 0 (+ i 1))
       (result nil (append result (list(aref arr1 i j)))))
      ((eql i
	    (array-dimension arr1 0)) result)))

(setf ans (make-array '(2 3) :initial-contents '((a b c)
						 (e f g))))
(extract-column ans 2)
(dtrace extract-columns)
(aref ans 1 1)
(array-dimension ans 0)

;;2
(reduce #'+ '(1 2 3))

(defun copy-lst (lst)
  (reduce #'cons lst
	  :from-end t :initial-value nil))
(defun rev-lst (lst)
  (reduce #'(lambda (x y) (cons y x)) lst
	  :initial-value nil))
;;3
(defstruct trt
  elt
  (left nil)
  (middle nil)
  (right nil))
(setf trt1 (make-trt
	    :elt 3
	    :left (make-trt :elt 2)
	    :middle (make-trt :elt 4)
	    :right (make-trt :elt 5)))
(setf trt2 (make-trt :elt 3 :left 2))
trt1
(trt-p trt1)
(defun copy-trt (trt0)
  (cond ((trt-p trt0)
	 (make-trt :elt (trt-elt trt0)
		   :left (if (null (trt-left trt0))
			     nil
			     (copy-trt (trt-left trt0)))
		   :middle (if (null (trt-middle trt0))
			       nil
			       (copy-trt (trt-middle trt0)))
		   :left (if (null (trt-right trt0))
			     nil
			     (copy-trt (trt-right trt0)))))))

(dtrace copy-trt)
(copy-trt trt1)
;;3.b
(defun find-trt (trt0 obj)
  (if (trt-p trt0)
      (or (eql (trt-elt trt0) obj)
	  (find-trt (trt-left trt0) obj)
	  (find-trt (trt-middle trt0) obj)
	  (find-trt (trt-right trt0) obj))))
trt1
(dtrace find-trt)
(find-trt trt1 4)
;;4
(defun collector (bst)
  (if (node-p bst)
      (concatenate 'list
		   (list (node-elt bst))
		   (collector (node-l bst))
		   (collector (node-r bst)))))
(dtrace collector)
(collector nums3)
(defun collect&sort (bst)
  (sort (collector bst)
	#'>))
(collect&sort nums3)
;;5 errata our bst-insert was bst-adjoin
;;6
(setf assoclst '((color . red)
	     (shape . spherical)
	     (size . giant)))
(assoc 'color alst)
(setf ht (make-hash-table))
(setf (gethash 'color ht) 'red
      (gethash 'shape ht) 'spherical
      (gethash 'size ht) 'giant)
(maphash #'(lambda (k v) ;k-key v-value
	     (format t "~&~A = ~A" k v))
	 ht)
;;6.a
(defun assoc2ht (assoclst0)
  (let ((output-ht (make-hash-table)))
    (mapcar #'(lambda (dotted-lst)
		(setf (gethash (car dotted-lst) output-ht) (cdr dotted-lst)))
	    assoclst0)
    output-ht))
(assoc2ht assoclst)
;;6.b
(defun ht2alst (ht0)
  (let ((base nil))
	  (maphash #'(lambda (k v)
		       (push (cons k v) base))
		   ht0)
    base))
(ht2alst ht)
;;end of chapter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;chapter5: Control
(progn (format t "~&a")
       (format t "noop")
       (+ 20 1))
;;block is like a progn with a name and an emergency exit
(block head
  (format t "here we go...")
  (return-from head 'emergency-exit)
  (format t "this not evaled"))
;;(return 'emergency-exit) is a macro for (return-from nil 'emergency-exit)
(block nil
  (format t "~&this is evaled")
  (return 'emergency-exit-baby)
  (format t "not evaled"))
;;body of defun is a block with fun name
(defun foo()
  (format t "~&hello foo")
  (return-from foo 69)
  (format t "not evaled"))
(foo)
;;cases
(defun month-length (mon)
  (case mon
    ((jan mar may jul aug oct dec) 31)
    ((apr jun sept nov) 30)
    (feb (if (leap-year) 29 28))
    (otherwise "unknown month")))
(month-length 'jan)
;;iteration
(defun show-squares (start end)
  (do ((i start (+ i 1)))
      ((> i end) 'done)
    (format t "~&~A" (* i i))))
(show-squares 2 8)
;;do do*
(let ((x 'a))
  (do ((x 1 (+ x 1))
       (y x x))
      ((> x 5) 'endit)
    (format t "~&(x y) = (~A ~A)" x y)))
(let ((x 'a))
  (do* ((x 1 (+ x 1))
       (y x x))
      ((> x 5) 'endit)
    (format t "~&(x y) = (~A ~A)" x y)))

(dolist (x '(a n o o p))
  (format t "~&alphabet - ~A" x))
(dotimes (i 8 'ended)
  (format t "~&*****"))
;;mapcar and mapc to traverse list
(mapcar #'(lambda (x) (+ x 10))
	'(1 2 3))
;;with side-effects
(mapc #'(lambda (x y)
	  (format t "~&~A-~A" x y))
      '(adam d charlie anoop)
      '(eve angelo cheever gr))
;;multiple values
(setf ht (make-hash-table))
(setf (gethash 'empty ht) nil)
(gethash 'empty ht)
(gethash 'truely-void ht)

(multiple-value-bind (x y z) (values 1 0 69)
  (list x y z))
(multiple-value-bind (sec min hour) (get-decoded-time)
  (format nil "~S:~S:~S" hour min sec))
(multiple-value-call #'+ (values 1 0 69))
(multiple-value-list (values 'a 'n 'o))









