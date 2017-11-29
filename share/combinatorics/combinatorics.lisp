;;;; COMBINATORICS package for Maxima
;;;;
;;;; Maxima functions to work with permutations.
;;;;  $cyclep               : predicate function for cycles.
;;;;  $permutationp         : predicate function for permutations.
;;;;  $permult              : permutations product.
;;;;  $invert_permutation   : inverse of a permutation.
;;;;  $apply_permutation    : permutes a list according to a permutation.
;;;;  $apply_cycles         : permutes a list according to a list of cycles.
;;;;  $permutation_undecomp : converts a list of cycles into a permutation.
;;;;  $permutation_cycles   : decomposes a permutation into cycles.
;;;;  $permutation_lex_rank : permutation's position in lexicographic sequence.
;;;;  $permutation_index    : minimum number of adjacent transpositions.
;;;;  $permutation_decomp   : minimum set of adjacent transpositions to get p.
;;;;  $permutation_parity   : parity of a permutation (0 or 1).
;;;;  $permutations_lex     : lexicographic list of n-degree permutations
;;;;                          or one or more permutations within that sequence.
;;;;  $permutation_lex_next : finds next permutation in lexicographic ordering.
;;;;  $permutations_tj      : List of n-degree permutations in mimimum-change
;;;;                          ordering (Trotter-Johnson), or one or more
;;;;                          permutations within that sequence.
;;;;  $permutation_tj_next  : finds next permutation in Trotter-Johnson ordering
;;;;
;;;; NOTATION
;;;;  pm    : a permutation as a maxima list
;;;;  pa    : a permutation as a lisp array
;;;;  lpm   : a lisp list of pm's (in reverse order)
;;;;  lmpm  : a maxima list of pm's
;;;;  cm    : a cycle as a maxima list
;;;;  ca    : a cycle as a lisp array
;;;;  lcm   : a lisp list of cycles as maxima lists
;;;;  lmcm  : a maxima list of cycles as maxima lists
;;;;
;;;; USEFULL COMMANDS
;;;;  Turn a pa into a pm:
;;;;       (concatenate 'list `((mlist simp)) pa)
;;;;
;;;;  Turn an lpm into a maxima list
;;;;       `((mlist simp) ,@(nreverse lpm))
;;;;
;;;; MACROS
;;;;  Apply transposition [i,j] to a pa (i and j from 1 to n)
;;;;       (array-transposition pa i j)
;;;;
;;;;  Apply transposition [i,i+1] to a pa (i from 1 to n-1)
;;;;       (array-adjacent-transposition pa i)
;;;;
;;;;  Turn a pa into a pm and push it to the top of an lpm
;;;;       (push-array-mlist pa lpm)
;;;;
;;;; Copyright (C) 2017 Jaime Villate
;;;;
;;;; This program is free software; you can redistribute it and/or
;;;; modify it under the terms of the GNU General Public License
;;;; as published by the Free Software Foundation; either version 2
;;;; of the License, or (at your option) any later version.
;;;;
;;;; This program is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU General Public License for more details.
;;;;
;;;; You should have received a copy of the GNU General Public License
;;;; along with this program; if not, write to the Free Software
;;;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
;;;; MA  02110-1301, USA

(in-package :maxima)
(macsyma-module combinatorics)

(defmacro push-array-mlist (pa lpm)
  `(push (concatenate (quote list) (quote ((mlist simp))) ,pa) ,lpm))

(defmacro array-adjacent-transposition (pa i)
  `(rotatef (aref ,pa (1- ,i)) (aref ,pa ,i)))

(defmacro array-transposition (pa i j)
  `(rotatef (aref ,pa (1- ,i)) (aref ,pa (1- ,j))))

;;; $cyclep returns true if its argument is a maxima list of lenght n or
;;; lower, whose elements are integers between 1 and n, without repetitions.
(defun $cyclep (cm n)
  ;; a cycle must be a maxima list
  (or (and (integerp n) (> n 1)) (return-from $cyclep nil))
  (or ($listp cm) (return-from $cyclep nil))
  (dolist (i (rest cm))
    ;; cycle elements must be positive integers, less or equal to n
    (or (and (integerp i) (plusp i) (<= i n)) (return-from $cyclep nil))
    ;; and cannot be repeated
    (or (< (count i (rest cm)) 2) (return-from $cyclep nil)))
    t)

;;; $permutationp returns true if its argument is a maxima list of lenght n,
;;; whose elements are the integers 1, 2, ...n, without repetitions.
(defun $permutationp (pm)
  (or ($listp pm) (return-from $permutationp nil))
  (let ((n ($length pm)))
    ;; a permutation of degree n is also a valid cycle of degree n
    ($cyclep pm n)))

(defun check-permutation (pm caller)
  (let ((s "~M: argument should be a permutation; found: ~M"))
    (or ($permutationp pm) (merror (intl:gettext s) caller pm))))

(defun check-cycle (cm n caller)
  (let ((s "~M: argument should be a cycle of degree ~M; found: ~M"))
    (or ($cyclep cm n) (merror (intl:gettext s) caller n cm))))

(defun check-list-or-set (lsm caller)
  (let ((s "~M: argument should be a list or set; found: ~M"))
    (or ($listp lsm) ($setp lsm) (merror (intl:gettext s) caller lsm))))

(defun check-list (lm caller)
  (let ((s "~M: argument should be a list; found: ~M"))
  (or ($listp lm) (merror (intl:gettext s) caller lm))))

(defun check-list-length (lm n caller)
  (let ((s "~M: argument should be a list of length ~M; found: ~M"))
  (or (eql ($length lm) n) (merror (intl:gettext s) caller n lm))))

(defun check-pos-integer (n caller)
  (let ((s "~M: argument must be a positive integer; found: ~M"))
  (or (and (integerp n) (> n 0)) (merror (intl:gettext s) caller n))))

(defun check-integer-n1-n2 (r n1 n2 caller)
  (let ((s "~M: argument must be an integer between ~M and ~M; found: ~M"))
    (or (and (integerp r) (>= r n1) (<= r n2))
        (merror (intl:gettext s) caller n1 n2 r))))

;;; $permult multiplies permutation pm by the permutations in list lmpm
(defun $permult (pm &rest lmpm)
  (check-permutation pm "permult") 
  (let ((n ($length pm)) (rm (copy-list pm)))
    ;; multiplies the current product, rm, by each of the permutations in lmpm
    (dolist (qm lmpm)
      (check-list-length qm n "permult")
      (check-permutation qm "permult") 
      ;; the new product, rm, is the current product, rm, times
      ;; permutation qm: rm = [qm[rm[1]], qm[rm[2]], ..., qm[rm[n]]]
      (loop for j from 1 to n do
           (setf (nth j rm) (nth (nth j rm) qm))))
    rm))

;;; $invert_permutation computes the inverse of permutation p
(defun $invert_permutation (pm)
      (check-permutation pm "invert_permutation") 
  (let ((inverse (copy-list pm)))
    ;; if the element pm[j] of the permutation is equal to i, then
    ;; the element inverse[i] of the inverse should be equal to j.
    (dotimes (j ($length pm))
      (setf (nth (nth (1+ j) pm) inverse) (1+ j)))
    inverse))

;;; $apply_permutation permutes the elements of list (or set) lsm according
;;; to the permutation pm
(defun $apply_permutation (pm lsm)
  (check-permutation pm "apply_permutation") 
  (check-list-or-set lsm "apply_permutation")
  (check-list-length lsm ($length pm) "apply_permutation")
  (let ((result nil))
    (dolist (j (reverse (rest pm)))
      (setq result (cons (nth j lsm) result)))
    (cons (car lsm) result)))

;;; $apply_cycles permutes the elements of list (or set) lsm according to the
;;; list of cycles lmcm, applying the cycles on the end of the list first
(defun $apply_cycles (lmcm lsm)
  (check-list lmcm "apply_cycles")
  (check-list-or-set lsm "apply_cycles")
  (let ((n ($length lsm)) (r (copy-list lsm)) m tmp)
    ;; iterate the cycles, the last in the list first
    (dolist (cm (reverse (rest lmcm)))
      (check-cycle cm n "apply_cycles")
      (setq m ($length cm))
      (setq tmp (nth (nth 1 cm) r))
      (loop for i from 1 to (1- m) do
           (setf (nth (nth i cm) r) (nth (nth (1+ i) cm) r)))
      (setf (nth (nth m cm) r) tmp))
    r))

;;; $permutation_undecomp converts a list of cycles into a permutation,
;;; equal to their product, by applying $apply_cycles to [1, 2,..., n]
(defun $permutation_undecomp (lmcm n)
  (check-list lmcm "permutation_undecomp")
  (check-pos-integer n "permutation_undecomp")
  ($apply_cycles
   lmcm `((mlist simp) ,@(loop for i from 1 to n collecting i))))

;;; $permutation_cycles decomposes permutation p into a product of canonical
;;; cycles: with lower indices first.
(defun $permutation_cycles (pm)
  (check-permutation pm "permutation_cycles")
  (let* (i j k cm (n ($length pm)) (result '((mlist simp)))
         (v (make-array n :element-type 'bit :initial-element 1)))
    ;; the i'th bit in bit array v equal to 1 means index i+1 has not been
    ;; added to any cycles. The next cycle will then start where the first
    ;; value of 1 is found in v
    (while (position 1 v)
      (setf i (position 1 v) (bit v i) 0)
      ;; i= v index where a 1 was found. j=i+1 first index in the current
      ;; cycle. k=next index in the current cycle
      (setq j (1+ i) k j cm `((mlist simp) ,j))
      ;; if p[k] is different from k, there's a non-trivial cycle
      (while (/= (nth k pm) j)
        (setf k (nth k pm) cm (append cm (list k)) (bit v (1- k)) 0))
      ;; a trivial cycle with just one index (length 2) will not be saved
      (and (> (length cm) 2) (setq result (append result (list cm)))))
    result))

;;; $permutation_lex_rank finds the position of the given permutation in
;;; the lexicographic ordering of permutations (from 1 to n!).
;;; Algorithm 2.15: from Kreher & Stinson (1999). Combinatorial Algorithms.
(defun $permutation_lex_rank (pm)
  (check-permutation pm "permutation_lex_rank") 
  (let ((r 1) (n ($length pm)) (qm (copy-list pm)))
    (loop for j from 1 to n do
         (incf r (* (1- (nth j qm)) (factorial (- n j))))
         (loop for i from (1+ j) to n do
              (when (> (nth i qm) (nth j qm))
                (setf (nth i qm) (1- (nth i qm))))))
    r))

;;; $permutation_index finds the minimum number of adjacent transpositions
;;; necessary to write permutation p as a product of adjacent transpositions.
(defun $permutation_index (pm)
  (check-permutation pm "permutation_index") 
  (let ((d 0) (n ($length pm)) (qm (copy-list pm)))
    (loop for j from 1 to n do
         (incf d (* (1- (nth j qm))))
      (loop for i from (1+ j) to n do
        (when (> (nth i qm) (nth j qm))
          (setf (nth i qm) (1- (nth i qm))))))
    d))

;;; $permutation_decomp finds the minimum set of adjacent transpositions
;;; whose product equals permutation pm.
(defun $permutation_decomp (pm)
  (check-permutation pm "permutation_decomp") 
  (let (lcm (n ($length pm)) (qm (copy-list pm)))
    (loop for j from 1 to (1- n) do
         (when (>= (1- (nth j qm)) 1)
           (loop for i from (+ (- (nth j qm) 2) j) downto j do
                (setq lcm (cons `((mlist simp) ,i ,(1+ i)) lcm))))
         (loop for k from (1+ j) to n do
              (when (> (nth k qm) (nth j qm))
                (setf (nth k qm) (1- (nth k qm))))))
    (cons '(mlist simp) lcm)))

;;; $permutation_parity finds the parity of permutation p (0 or 1).
;;; Algorithm 2.19 from Kreher & Stinson (1999). Combinatorial Algorithms.
(defun $permutation_parity (pm)
  (check-permutation pm "permutation_parity") 
  (permutation-parity ($length pm) (rest pm)))

;;; permutation-parity finds the parity of n first elements of p (lisp list)
;;; Algorithm 2.19 from Kreher & Stinson (1999). Combinatorial Algorithms.
(defun permutation-parity (n p)
  (let (i (c 0) (a (make-array n :element-type 'bit :initial-element 0)))
    (dotimes (j n)
      (when (= (bit a j) 0)
        (incf c)
        (setf (bit a j) 1 i j)
        (while (/= (1- (nth i p)) j)
          (setf i (1- (nth i p)) (bit a i) 1))))
    (mod (- n c) 2)))
          
;;; $permutations_lex returns a list of the permutations of order n in
;;; lexicographic order
(defun $permutations_lex (n &optional r0 rf)
  (check-pos-integer n "permutations_lex")
  (when r0 (check-integer-n1-n2 r0 1 (factorial n) "permutations_lex"))
  (when rf (check-integer-n1-n2 rf r0 (factorial n) "permutations_lex"))
  (let ((pa (make-array n :element-type 'fixnum)) lpm)
    (if r0
        (progn
          (permutation-lex-unrank n r0 pa)
          (push-array-mlist pa lpm)
          (when rf
            (dotimes (j (- rf r0))
              (permutation-lex-next n pa)
              (push-array-mlist pa lpm))))
        (progn
          (dotimes (i n) (setf (aref pa i) (1+ i)))
          (push-array-mlist pa lpm)
          (while (permutation-lex-next n pa)
            (push-array-mlist pa lpm))))
    (if (> (length lpm) 1)
        `((mlist simp) ,@(nreverse lpm))
        (first lpm))))

;;; $permutation_lex_next finds the next permutation in lexicographic order
(defun $permutation_lex_next (pm)
  (check-permutation pm "permutation_lex_next") 
  (let* ((n ($length pm)) (pa (make-array n :element-type 'fixnum)))
    (dotimes (i n)
      (setf (aref pa i) (nth (1+ i) pm)))
    (unless (permutation-lex-next n pa)
      (return-from $permutation_lex_next nil))
    (concatenate 'list '((mlist simp)) pa)))

;;; permutation_lex_next finds next permutation in the lexicographic order.
;;; Based on Algorithm 2.14 from Kreher & Stinson (1999). Combinatorial
;;; Algorithms.
(defun permutation-lex-next (n pa)
  (declare (type (simple-array fixnum *) pa))
  (declare (type fixnum n))
  (let ((i (1- n)) (j n))
    (while (and (> i 0) (< (aref pa i) (aref pa (1- i))))
      (decf i))
    (when (= i 0) (return-from permutation-lex-next nil))
    (while (< (aref pa (1- j)) (aref pa (1- i)))
      (decf j))
    (array-transposition pa i j)
    (dotimes (k (floor (/ (- n i) 2)))
      (array-transposition pa (+ k i 1) (- n k)))
    t))

;;; permutation-lex-unrank finds the n-degree permutation of in position
;;; r (from 1 to n!) in the lexicographic ordering of permutations.
;;; Algorithm 2.16: from Kreher & Stinson (1999). Combinatorial Algorithms.
(defun permutation-lex-unrank (n r pa)
  (declare (type (simple-array fixnum *) pa))
  (declare (type fixnum n))
  (declare (type fixnum r))
  (let (d)
    (setf (aref pa (1- n)) 1)
    (dotimes (j (1- n))
      (setq d (/ (mod (1- r) (factorial (+ j 2))) (factorial (1+ j))))
      (decf r (* d (factorial (1+ j))))
      (setf (aref pa (- n j 2)) (1+ d))
      (loop for i from (- n j 1) to (1- n) do
           (when (> (aref pa i) d)
             (setf (aref pa i) (1+ (aref pa i))))))
    t))

;;; $permutations_tj returns a list of the permutations of order n
;;; using Trotter-Johnson ordering
(defun $permutations_tj (n &optional r0 rf)
  (check-pos-integer n "permutations_tj")
  (when r0 (check-integer-n1-n2 r0 1 (factorial n) "permutations_tj"))
  (when rf (check-integer-n1-n2 rf r0 (factorial n) "permutations_tj"))
  (let ((pa (make-array n :element-type 'fixnum)) lpm)
    (if r0
        (progn
          (permutation-tj-unrank n r0 pa)
          (push-array-mlist pa lpm)
          (when rf
            (dotimes (j (- rf r0))
              (permutation-tj-next n pa)
              (push-array-mlist pa lpm))))
        (progn
          (dotimes (i n) (setf (aref pa i) (1+ i)))
          (push-array-mlist pa lpm)
          (while (permutation-tj-next n pa)
            (push-array-mlist pa lpm))))
    (if (> (length lpm) 1)
        `((mlist simp) ,@(nreverse lpm))
        (first lpm))))

;;; $permutation_rank finds the position of the given permutation in
;;; the Trotter-Johnson ordering of permutations (from 1 to n!).
;;; Algorithm 2.17: from Kreher & Stinson (1999). Combinatorial Algorithms.
(defun $permutation_tj_rank (pm)
  (check-permutation pm "permutation_rank") 
  (let (i k (r 1) (n ($length pm)))
    (loop for j from 2 to n do
         (setq k 1 i 1)
         (while (/= (nth i pm) j)
           (and (< (nth i pm) j) (incf k))
           (incf i))
         (if (= (mod r 2) 1)
             (setq r (- (+ (* j r) 1) k))
             (setq r (+ (* j (1- r)) k))))
    r))

;;; permutation-tj-unrank returns the n-degree permutation in position r
;;; (from 1 to n!) in the Trotter-Johnson ordering of permutations.
;;; Algorithm 2.18: from Kreher & Stinson (1999). Combinatorial Algorithms.
(defun permutation-tj-unrank (n r pa)
  (declare (type (simple-array fixnum *) pa))
  (declare (type fixnum n))
  (declare (type fixnum r))
  (let (r1 (r2 0) k)
    (setf (aref pa 0) 1)
    (loop for j from 2 to n do
         (setq r1 (floor (/ (* (1- r) (factorial j)) (factorial n))))
         (setq k (- r1 (* j r2)))
         (if (= (mod r2 2) 0)
             (progn
               (loop for i from (1- j) downto (- j k) do
                    (setf (aref pa i) (aref pa (1- i))))
               (setf (aref pa (- j k 1)) j)) 
             (progn
               (loop for i from (1- j) downto (1+ k) do
                    (setf (aref pa i) (aref pa (1- i))))
               (setf (aref pa k) j)))
         (setq r2 r1))))
 
;;; permutation_tj_next finds next permutation in the Trotter-Johnson
;;; ordering. Algorithm 2.20 from Kreher & Stinson (1999). Combinatorial
;;; Algorithms.
(defun permutation-tj-next (n pa)
  (let ((q (concatenate 'list pa)) (st 0) (m n) d done)
    (while (and (> m 1) (not done))
      (setq d 1)
      (while (/= (nth (1- d) q) m) (incf d))
      (loop for i from d to (1- m) do (setf (nth (1- i) q) (nth i q)))
      (if (= (permutation-parity (1- m) q) 1)
          (if (= d m)
              (decf m)
              (progn
                (array-adjacent-transposition pa (+ st d))
                (setq done t)))
          (if (= d 1)
              (progn
                (decf m)
                (incf st))
              (progn
                (array-adjacent-transposition pa (+ st (1- d)))
                (setq done t)))))
    (if (= m 1) nil t)))

;;; $permutation_tj_next finds the next permutation in Trotter-Johnson ordering
(defun $permutation_tj_next (pm)
  (check-permutation pm "permutation_tj_next") 
  (let* ((n ($length pm)) (pa (make-array n :element-type 'fixnum)))
    (dotimes (i n)
      (setf (aref pa i) (nth (1+ i) pm)))
    (unless (permutation-tj-next n pa)
      (return-from $permutation_tj_next nil))
    (concatenate 'list '((mlist simp)) pa)))
