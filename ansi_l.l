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
;; notice that one ' protects all elements from evaluation
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
;; the mistake is the un-nessesary bracketing
;;cons builds lists, adds first argument at the beginning
(cons 'a '(b c d))
(cons "hello" "world")
;;why the dot on evaluation?, because-read scroll below
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
(atom 'a)
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
    '(she is interesting))

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
;;second arg is returned
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

;;Is a variable name bound as global check with boundp
;;  notice that variable name is a symbol, hence needs to be
;;    quoted as we learnt earlier
(boundp '*glob*)
(boundp 'anoop)
(boundp 'pg)

;;general assign:
;; setf name comes from set field
(setf n 3)
(format t "~&earlier defined n is ~% in fact global n=~A" n)
;; setf is global unless already locally defined
;; setf is implicit global assignment
(let ((x 3))
  (setf x 8))
;;in above x locally existing, so non global x=8
(setf myname '(a n o o p))
(setf x (list 'a 'b 'c))
x
(boundp 'x)
;; first arg of setf can be an expression
(setf (car x) 'n)
x
;; this flexibility of setf, we will term as settable
(setf a 1
      b 2
      c 3)
(+ a b c)
(/ a (* b c))
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
(delete 'a lst)
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
  (format t "~&aaammm"))

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
(our-length '(a n o o p gr))
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
	 1)
;; this allows using functions w/o naming them

;;types: davids book has a nice tree diagram of various types

;; checking object's type
(typep 69 'fixnum)
(typep 69 'integer)
;;or
(integerp 69)
(typep 69 'rational)
(typep 69 'real)
(typep 69 'atom)
;;or
(atom 69)
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
;; eql for lists means same list and same cons cells
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
      (cons (car lst) (our-copy-list (cdr lst)))))
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

;; uncompress
(atom (car (compress '(a a a c f d d d))))
(atom 'd)
;;clst looks like '((3 A) C F (3 D))
(defun list-of (n elt)
  (if (zerop n)
      nil
      (cons elt (list-of (- n 1) elt))))
(list-of 3 'a)
(defun uncompress (clst)
  (let ((elt (car clst)))
    (cond ((null elt) nil)
	  ((atom elt) (cons elt
			      (uncompress (cdr clst))))
	  ((consp elt) (append (apply #'list-of elt)
				 (uncompress (cdr clst)))))))
(uncompress '((3 A) C F (3 D)))
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

;;enter a shell command in text:
;;; C-u M-! date <return>
;;; C-u M-! uptime <return>
;;etc

;; start: Thu Sep  3 17:35:44 IST 2015
;; mapping functions-calling on each and every member of a list
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
(mapcar #'list '(a b c d) '(1 2 3))

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
(dtrace our-copy-tree)
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
(our-substitute 'x 'y '(y (y y)))

;;start Fri Sep 11 18:51:12 IST 2015
;;3.10 sets
(member 'p '(a n o o p))
(eql 'p 'p)
;;keyword, specific to the function there are keywords
;; eg: for func 'member': 1.test 2.key
;; check available keywords using C-c C-d d
(member 'p '(a n o o p) :test #'equal)
(eql '(p) '(p))
(member '(p) '((p) (p) (p)))
(member '(p) '((p) (p) (p)) :test #'equal)
(member '(p) '((p) (p) (p) q) :test-not #'equal)
(member 'p '((p) (p) (p)) :key #'car)
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
(union '(a n) '(o p))
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
;;sort is destructive
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
;;3.14 Assoc-list or alist ~ a list of conses as elements
(setf translate '((+ . "add") (- . "subtract")))
(setf translate '((+ "add") (- "subtract")))
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
;;to do in 2nd iteration, chapter 5 question 9 on shortest path
(setf min '((a b c) (b c) (c d)))
(cdr (assoc 'a min))

;;shortest path eg , still have not understood fully??
;;anoop here
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
;;destructuring bind ~ let for tree to tree
(destructuring-bind (a (b c) . d) '(1 (2 3) . q)
  (list a b c d))
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
  (format t "~&*****~A" i))
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
;;a fun that receives mutiple values from another:
(multiple-value-bind (x y z) (values 1 0 69)
  (list x y z))
(multiple-value-bind (sec min hour) (get-decoded-time)
  (format nil "~S:~S:~S" hour min sec))
(multiple-value-call #'+ (values 1 0 69))
(multiple-value-list (values 'a 'n 'o))
;;;;aborts
;;catch and throw
(defun super ()
  (catch 'aborte
    (sub)
    (format t "we will never see this")))
(defun sub ()
  (throw 'aborte 999))
(super)
;;error
(progn
  (error "oops!")
  (format t "after the error."))
(setf x 1)
(catch 'abort
  (unwind-protect
       (throw 'abort 99)
    (setf x 8)))
x
;;date-arithmetic
(setf mon '(31 28 31 30 31 30 31 31 30 31 30 31))
(reduce #'+ mon)
(setf nom (reverse mon))
(maplist (lambda (x)
	   (apply #'+ x)) nom)
(defconstant month
      #(31 59 90 120 151 181 212 243 273 304 334 365))
(defconstant yzero 2000)
(defun leap? (y)
  (and (zerop (mod y 4))
       (or (zerop (mod y 400))
	   (not (zerop (mod y 100))))))
(leap? 2015)
(defun date->num (d m y)
  (+ (- d 1) (month->num m y) (year->num y)))
(defun month->num (m y)
  (+ (svref month (- m 1))
     (if (and (> m 2)
	      (leap? y))
	 1
	 0)))
(defun year->num (y)
  (let ((d 0))
    (if (>= y yzero)
	(dotimes (i (- y yzero) d)
	  (incf d (year-days (+ yzero i))))
	(dotimes (i (- yzero y) (- d))
	  (incf d (year-days (+ y i)))))))
(defun year-days (y)
  (if (leap? y)
      366
      365))
(defun num->date (n)
  (multiple-value-bind (y left) (num-year n)
    (multiple-value-bind (m d) (num-month left y)
      (values d m y))))
(defun num-year (n)
  (if (< n 0)
      (do* ((y (- yzero 1) (- y 1))
	    (d (- (year-days y)) (- d (year-days y))))
	   ((<= d n) (values y (- n d))))
      (do* ((y yzero (+ y 1))
	    (prev 0 d)
	    (d (year-days y) (+ d (year-days y))))
	   ((> d n) (values y (- n prev))))))
(defun num-month (n y)
  (if (leap? y)
      (cond ((= n 59) (values 2 29))
	    ((> n 59) (nmon (- n 1)))
	    (t (nmon n)))
      (nmon n)))
(defun nmon (n)
  (let ((m (position n month :test #'<)))
    (values m (+ 1 (- n (svref month (- m 1)))))))
(defun date+ (d m y n)
  (num->date (+ (date->num d m y) n)))
;;exercises
;;1
(setf y '(y))
((lambda (x)
   (cons x x)) (car y))
(setf x '(1)
      z 2)
((lambda (w)
   ((lambda (y)
     (cons w y)) (+ w z))) (car x))
;;2
(defun mystery (x y)
  (cond ((null y) nil)
	((eql (car y) x) 0)
	(t (let ((z (mystery x (cdr y))))
	     (and z (+ z 1))))))
(dtrace mystery)
(mystery 'a '(n o o a a p))
;;3
(defun cond-sq (n)
  (cond ((and (< 0 n 6)
	      (integerp n)) n)
	(t (* n n))))
;;4
;;case

'(0 31 59 90 120 151 181 212 243 273 304 334)
(mapcar #'(lambda (x y) (cons x (list y)))
	 '(1 2 3 4 5 6 7 8 9 10 11 12)
	 '(31 59 90 120 151 181 212 243 273 304 334 365))

(defun mon->num (m y)
  (+ (if (and (> m 2)
	      (leap? y)) 1 0)
     (case m
       (1 0) (2 31) (3 59) (4 90) (5 120) (6 151) (7 181) (8 212) (9 243) (10 273) (11 304) (12 334) (otherwise 0))))

;;5
(find #\a "anoop")
(car "anoop")
(position #\a "anoopa" :start 3)
(char "anoopa" 5)
(dtrace precedes-helper)
(precedes-helper #\a "eanoop" 0)
(char "anoop" 8)
(defun collect-positions (x v start)
  (if (< start (length v))
      (cons (position x v :start start)
	    (collect-positions x v (+ start 1)))
      '(end)))
(dtrace collect-positions)
(collect-positions #\a "panap" 0)
(defun clean-positions (x v start)
  (remove 0
	  (remove 'end
		  (remove nil
			  (remove-duplicates
			   (collect-positions x
					      v
					      start))))))
(clean-positions #\a "panamaca" 0)
(defun positions (x v start)
  (mapcar #'(lambda (x) (- x 1))
	  (clean-positions x v start)))
(defun precedes (x v)
  (remove-duplicates
   (mapcar #'(lambda (p)
	       (char v p))
	   (positions x v 0))))
(precedes #\a "abracadabra")
;;5.iterative
(cons #\b (cons #\a nil))
(defun precedes (x v)
  (do* ((p (position x v :start 0)
	   (position x v :start (+ p 1)))
	(ans nil))
       ((null p) (remove-duplicates ans))
    (if (> p 0)
	(push (char v (- p 1))
	      ans))))
(precedes #\a "abracadabra")
;;5.recursive.version2
(defun precedes (x v)
  (if (> (length v) 1)
      (let* ((first (char v 0))
	     (rest (subseq v 1))
	     (chars (precedes x rest)))
;;	(format t "~&let* body starts.........")
	(and (eql (aref v 1) x)
	     (not (member first chars))
	     (push first chars))
	(sort chars #'char<))
      nil))
(dtrace precedes)
(precedes #\a "abrac")
;;6.recursive
(defun intersperse-helper (obj lst)
  (if lst
      (append (intersperse-helper obj (cdr lst))
	      (cons obj
		    (list (car lst))))))
(defun intersperse (obj lst)
  (reverse (cdr (intersperse-helper obj lst))))
(intersperse '- '(a b c d e))
;;6.iterative
(defun intersperse (obj lst)
  (do* ((lst1 lst (cdr lst1))
	(first (car lst1) (car lst1))
	(ans-helper (list (car lst1))
		    (append (cons first (list obj))
			      ans-helper)))
       ((null lst1) (reverse (cdr (cdr ans-helper))))
    ()))
;;7.recursive(a)
(defun diff1 (lst)
  (if (> (length lst) 1)
      (and (eql (- (second lst)
		   (first lst))
		1)
	   (diff1 (cdr lst)))
      t))
(dtrace diff1)
(diff1 '(1 2 3 4 5))
;;7.do(b)
(defun diff1 (lst)
  (do* ((lst1 lst (cdr lst1))
	(first (first lst1) (first lst1))
	(second (second lst1) (second lst1))
	(ans t (and ans
		    (eql (- second first) 1))))
       ((eql (length lst1) 2) ans)
    ()))
;;7.mapc return
(defun diff1 (lst)
  (block nil
    (let ((first (car lst)))
      (mapc #'(lambda (x)
		(if (= (abs (- x first))
		       1)
		    (setf first x)
		    (return-from nil 'falsed)))
	    (cdr lst)))
    t))
(diff1 '(1 2 3 8))

;;8
;;i used &optional
(defun foo (a &optional b)
  (format t "~A and *** ~A" a b))
(foo 8)
;;
(defun max&min (v &optional max min)
  "v is a simple vector"
  (cond ((zerop (length v)) (values max min))
	(t (if (or (null min)
		   (< (svref v 0) min))
	       (setf min (svref v 0))
	       (if (or (null max)
		       (> (svref v 0) max))
		   (setf max (svref v 0))))
	   (max&min (subseq v 1) max min))))
(dtrace max&min)
(max&min #(1 2 3 8 -33))
(vectorp #(1 2 3))
(length #())
;;9
;;will do in second iteration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;chapter6 functions
(defun foo()
  8)
(foo)
(fboundp 'foo)
(symbol-function 'foo)
(setf (symbol-function 'add2)
      #'(lambda (x) (+ x 2)))
(add2 8)
(defun add2 (x)
  (+ x 2))

(setf lst0 '(a b c))
;;the below TOGETHER make a synonym for car called primo
(defun primo (lst) (car lst))
(primo2 lst0)
(defun (setf primo) (val lst)
  (setf (car lst) val))
;;test
(let ((x (list 'a 'b 'c)))
  (setf (primo x) 480)
  x)

;;labels ~ kind of let(()) for defining local funs
(labels ((add10 (x) (+ x 10))
	 (consa (x) (cons 'a x)))
  (consa (add10 8)))
;;labels is kind of closer to let*
(labels ((len (lst)
	   (if (null lst)
	       0
	       (+ (len (cdr lst)) 1))))
  (len '(a b c d)))
;;6.3parameter lists
(defun our-funcall (fn &rest args)
  (apply fn args))
(our-funcall #'+ 1 1 8)
(defun name (first &optional last)
  (format t "~&hello ~A ~A" first last))
(name 'anoop)
;;default value for optional args
(defun philosophy (thing &optional (property 'fun))
  (list thing 'is property))
(philosophy 'death 'bad)
(philosophy 'death)
;;keyword parameter ~ flexible optional parameter
(defun keylist2 (a &key x y (z 69))
  (list a x y z))
(keylist2 1 :x 2 :z 4 :y 3)
(keylist2 8)
;;keyword collection using &rest and passing them to another   function
(adjoin 'a '(a b c))
(adjoin '(a) '((a) (b)))
(adjoin '(a) '((a) (b)) :test #'equal)
(defun our-adjoin (obj lst &rest args)
  (if (apply #'member obj lst args)
      lst
      (cons obj lst)))
;;above args work on the condition that that both our-adjoin &  member take same keywords
(dtrace our-adjoin)
(our-adjoin '(a) '((a) (b)))
(our-adjoin '(a) '((a) (b)) :test #'equal)
;;6.4 utilities
(defun single? (lst)
  (and (consp lst)
       (null (cdr lst))))
(single? '(a))
(defun append1 (lst obj)
  (append lst (list obj)))
(append1 '(a b c) 'd)
(defun map-int (fn n)
  (let ((acc nil))
    (dotimes (i n)
      (push (funcall fn i) acc))
    (nreverse acc)))
(map-int #'identity 10)
(map-int #'(lambda (x) (random 100)) 10)
(defun filter (fn lst)
  (let ((acc nil))
    (dolist (x lst)
      (let ((val (funcall fn x)))
	(if val (push val acc))))
    (nreverse acc)))
(filter #'(lambda (x) (and (evenp x) (+ x 10)))
	'(1 2 3 4 5 6 7 8 9))
(defun most (fn lst)
  (if (null lst)
      (values nil nil)
      (let* ((wins (car lst))
	     (max (funcall fn wins)))
	(dolist (obj (cdr lst))
	  (let ((score (funcall fn obj)))
	    (if (> score max)
		(setf wins obj
		      max score))))
	(values wins max))))
(most #'length '((a b c) (a b c d) (a a)))
;;6.5closures
;;returning a function, eg: combiner
(defun combiner (x)
  (typecase x
    (number #'+)
    (list #'append)
    (t #'list)))
(defun combine (&rest args)
  (apply (combiner (car args))
	 args))
(combine 'a 'b 'c)
(combine 8 9 3)
;;lexical varible = var available only in its context
;;free-lexical-variable = fun refers to variable defined outside it
(setf fn (let ((i 3))
	   #'(lambda (x) (+ x i))))
(funcall fn 8)
;;closure = a function that refers to a free lexical variable
(defun add-to-member (num lst)
  (mapcar #'(lambda (x)
	      (+ x num))
	  lst))
(add-to-member 1 '(1 2 3))f
;;in above, a closure is passed to mapcar

;;explicit eg for closure:
(defun make-adder (n)
  #'(lambda (x)
      (+ x n)))
(setf add10 (make-adder 10))
(funcall add10 8)

(let ((counter 0))
  (defun reset1()
    (setf counter 0))
  (defun stamp1()
    (setf counter (+ counter 1))))
;;the defuns are valid outside let, but counter variable is     is local to let and can only be accessed by reset1 or stamp1
(list (stamp1) (stamp1) (reset1) (stamp1))
;;eg:complemet using closures
(funcall (complement #'oddp) 8)
(defun our-complement (f)
  #'(lambda (&rest args)
      (not (apply f args))))
;;notice in above f is free-lexical-variable

;;6.6 eg:function builders, dylan inspired
'(1 . (3))
;;below , free variable are 'rest and 'fn1
(defun compose (&rest fns)
  (let ((fn1 (car (reverse fns)))
	(rest (cdr (reverse fns))))
    #'(lambda (&rest args)
	(reduce #'(lambda (v f) (funcall f v))
		rest
		:initial-value (apply fn1 args)))))
;;better looking with destructuring bind
(defun compose (&rest fns)
  (destructuring-bind (fn1 . rest) (reverse fns)
    #'(lambda (&rest args)
	(reduce #'(lambda (v f) (funcall f v))
		rest
		:initial-value (apply fn1 args)))))
(mapcar (compose #'list #'round #'sqrt)
	'(4 9 16 24))
;;free variable below: 'disj, 'fn
(defun disjoin (fn &rest fns)
  (if (null fns)
      fn
      (let ((disj (apply #'disjoin fns)))
	#'(lambda (&rest args)
	    (or (apply fn args)
		(apply disj args))))))
;;or
(defun disjoin (fn &rest fns)
  (if (null fns)
      fn
      #'(lambda (&rest args)
	  (or (apply fn args)
	      (apply (apply #'disjoin fns) args)))))
(trace disjoin)
(mapcar (disjoin #'integerp #'symbolp)
	'(a "a" 3 8))
(dtrace disjoin)
;;free variable below: 'fn, 'conj
(defun conjoin (fn &rest fns)
  (if (null fns)
      fn
      (let ((conj (apply #'conjoin fns)))
	#'(lambda (&rest args)
	    (and (apply fn args)
		 (apply conj args))))))
(mapcar (conjoin #'integerp #'oddp)
	'(a "a" 3 8))
(defun curry (fn &rest args)
  #'(lambda (&rest args2)
      (apply fn (append args args2))))
;;right curry
(defun rcurry (fn &rest args)
  #'(lambda (&rest args2)
      (apply fn (append args2 args))))
(funcall (curry #'- 8) 9)
(funcall (rcurry #'- 8) 9)
;;dylan has fun 'always, which is lisp eq of 'constantly
(funcall (constantly 8))
(defun always (x)
  #'(lambda (&rest args) x))
(funcall (always 8))
(apply (always 8) ())
;;6.7 dynamic scope
;;lexical scope, 'x always refers to the lexical envi of first
;; let when foo is called
(let ((x 10))
  (defun foo ()
    x))
(let ((x 29))
  (foo))
;;dynamic scope, variable 'y is looked up in the envi in which
;; foo is called
(let ((y 10))
  (defun foo2 ()
    (declare (special y))
    y))
;;error:
(let ((y 29))
  (foo2))
(let ((y 299))
  (declare (special y))
  (foo2))
;;dont worry much about 'declare, they come under optimising
;; code for compiler, can do later on
;;above is the only instance where declare changes fun
;; behaviour
(foo)
(setf x 89)
(foo)
(foo2)
(setf y 69)
(foo2)
;;using defparameter makes code clearer, but dont worry now
;;eg for use of dynamic scope using glob vars in lisp
*print-base*
(let ((*print-base* 2)
      (x 8))
  (format t "~A" x))
;;6.8compilation
(defun foo3 (x)
  (+ x 1))
;;in sbcl:
(compiled-function-p #'foo3)
;;above behaviour shows nil in clisp
;; for clisp (compile 'foo3)
;;usual way to compile lisp is to compile whole files with
;;compile-file, not individual funs
;;6.9 using recursion
(defun fib (n)
  (do ((i n (- i 1))
       (f1 1 (+ f1 f2))
       (f2 1 f1))
      ((<= i 1) f1)))
(fib 8)
;;ch6 exercises
;;6.1
;;original tokens
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
;;modified
(defun tokens (str &key (test #'constituent) (start 0))
  (let* ((p1 (position-if test str :start start))
	 (p2 (position-if #'(lambda (c)
			      (not (funcall test c)))
			  str :start p1)))
    (cons (subseq str p1 p2)
	  (if p2
	      (tokens str :test test :start p2)
	      nil))))
(tokens "ab12 3cde.f")
;;6.2
;;original
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
(find 'a '(c b a) :start 0 :end 3)
;;modified
(defun bin-search (obj vec &key (key #'identity) (test #'equal)
			     (start 0) (end (- (length vec) 1)))
  (let ((len (length vec)))
    (and (not (zerop len))
	 (finder obj vec start end :test1 test :key1 key))))

(defun finder (obj vec start end &key (test1 #'equal) (key1 #'identity))
  (format t "~&~A" (subseq vec start (+ end 1)))
  (let ((range (- end start)))
    (cond ((zerop range)
	   (if (funcall test1 obj (funcall key1 (svref vec start)))
	       obj
	       nil))
	  (t (let* ((mid (+ start (round (/ range 2))))
		    (obj2 (funcall key1 (svref vec mid))))
	       (cond ((< obj obj2) (finder obj vec start (- mid 1)))
		     ((> obj obj2) (finder obj vec (+ mid 1) end))
;;		     ((eql obj obj2) obj)
		     (t (finder obj vec mid mid))))))))
(setf vectest2 (make-array '6 :initial-contents '((0) (1) (2) (3) (4) (5))))
vectest2
(realp vectest2)
(bin-search 4 vectest2 :key #'car)
(bin-search 8 vectest)
(dtrace bin-search finder)
(defun foo (n)
  (dotimes (i n nil)
    (format t "(~A) " i)))
(foo 6)
;;as of dec2015







