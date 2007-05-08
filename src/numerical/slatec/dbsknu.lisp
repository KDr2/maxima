;;; Compiled by f2cl version 2.0 beta Date: 2007/05/04 17:29:50 
;;; Using Lisp CMU Common Lisp Snapshot 2007-05 (19D)
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':simple-array)
;;;           (:array-slicing nil) (:declare-common nil)
;;;           (:float-format double-float))

(in-package :slatec)


(let ((x1 2.0)
      (x2 17.0)
      (pi$ 3.14159265358979)
      (rthpi 1.2533141373155)
      (cc
       (make-array 8
                   :element-type 'double-float
                   :initial-contents '(0.577215664901533 -0.0420026350340952
                                       -0.0421977345555443 0.007218943246663
                                       -2.152416741149e-4 -2.01348547807e-5
                                       1.133027232e-6 6.116095e-9))))
  (declare (type (simple-array double-float (8)) cc)
           (type (double-float) rthpi pi$ x2 x1))
  (defun dbsknu (x fnu kode n y nz)
    (declare (type (simple-array double-float (*)) y)
             (type (f2cl-lib:integer4) nz n kode)
             (type (double-float) fnu x))
    (prog ((a (make-array 160 :element-type 'double-float))
           (b (make-array 160 :element-type 'double-float)) (ak 0.0) (a1 0.0)
           (a2 0.0) (bk 0.0) (ck 0.0) (coef 0.0) (cx 0.0) (dk 0.0) (dnu 0.0)
           (dnu2 0.0) (elim 0.0) (etest 0.0) (ex 0.0) (f 0.0) (fc 0.0)
           (fhs 0.0) (fk 0.0) (fks 0.0) (flrx 0.0) (fmu 0.0) (g1 0.0) (g2 0.0)
           (p 0.0) (pt 0.0) (p1 0.0) (p2 0.0) (q 0.0) (rx 0.0) (s 0.0)
           (smu 0.0) (sqk 0.0) (st 0.0) (s1 0.0) (s2 0.0) (tm 0.0) (tol 0.0)
           (t1 0.0) (t2 0.0) (i 0) (iflag 0) (inu 0) (j 0) (k 0) (kk 0)
           (koded 0) (nn 0))
      (declare (type (f2cl-lib:integer4) nn koded kk k j inu iflag i)
               (type (double-float) t2 t1 tol tm s2 s1 st sqk smu s rx q p2 p1
                                    pt p g2 g1 fmu flrx fks fk fhs fc f ex
                                    etest elim dnu2 dnu dk cx coef ck bk a2 a1
                                    ak)
               (type (simple-array double-float (160)) b a))
      (setf kk (f2cl-lib:int-sub (f2cl-lib:i1mach 15)))
      (setf elim (* 2.303 (- (* kk (f2cl-lib:d1mach 5)) 3.0)))
      (setf ak (f2cl-lib:d1mach 3))
      (setf tol (max ak 1.0e-15))
      (if (<= x 0.0) (go label350))
      (if (< fnu 0.0) (go label360))
      (if (or (< kode 1) (> kode 2)) (go label370))
      (if (< n 1) (go label380))
      (setf nz 0)
      (setf iflag 0)
      (setf koded kode)
      (setf rx (/ 2.0 x))
      (setf inu (f2cl-lib:int (+ fnu 0.5)))
      (setf dnu (- fnu inu))
      (if (= (abs dnu) 0.5) (go label120))
      (setf dnu2 0.0)
      (if (< (abs dnu) tol) (go label10))
      (setf dnu2 (* dnu dnu))
     label10
      (if (> x x1) (go label120))
      (setf a1 (- 1.0 dnu))
      (setf a2 (+ 1.0 dnu))
      (setf t1 (/ 1.0 (dgamma a1)))
      (setf t2 (/ 1.0 (dgamma a2)))
      (if (> (abs dnu) 0.1) (go label40))
      (setf s (f2cl-lib:fref cc (1) ((1 8))))
      (setf ak 1.0)
      (f2cl-lib:fdo (k 2 (f2cl-lib:int-add k 1))
                    ((> k 8) nil)
        (tagbody
          (setf ak (* ak dnu2))
          (setf tm (* (f2cl-lib:fref cc (k) ((1 8))) ak))
          (setf s (+ s tm))
          (if (< (abs tm) tol) (go label30))
         label20))
     label30
      (setf g1 (- s))
      (go label50)
     label40
      (setf g1 (/ (- t1 t2) (+ dnu dnu)))
     label50
      (setf g2 (* (+ t1 t2) 0.5))
      (setf smu 1.0)
      (setf fc 1.0)
      (setf flrx (f2cl-lib:flog rx))
      (setf fmu (* dnu flrx))
      (if (= dnu 0.0) (go label60))
      (setf fc (* dnu pi$))
      (setf fc (/ fc (sin fc)))
      (if (/= fmu 0.0) (setf smu (/ (sinh fmu) fmu)))
     label60
      (setf f (* fc (+ (* g1 (cosh fmu)) (* g2 flrx smu))))
      (setf fc (exp fmu))
      (setf p (/ (* 0.5 fc) t2))
      (setf q (/ 0.5 (* fc t1)))
      (setf ak 1.0)
      (setf ck 1.0)
      (setf bk 1.0)
      (setf s1 f)
      (setf s2 p)
      (if (or (> inu 0) (> n 1)) (go label90))
      (if (< x tol) (go label80))
      (setf cx (* x x 0.25))
     label70
      (setf f (/ (+ (* ak f) p q) (- bk dnu2)))
      (setf p (/ p (- ak dnu)))
      (setf q (/ q (+ ak dnu)))
      (setf ck (/ (* ck cx) ak))
      (setf t1 (* ck f))
      (setf s1 (+ s1 t1))
      (setf bk (+ bk ak ak 1.0))
      (setf ak (+ ak 1.0))
      (setf s (/ (abs t1) (+ 1.0 (abs s1))))
      (if (> s tol) (go label70))
     label80
      (setf (f2cl-lib:fref y (1) ((1 *))) s1)
      (if (= koded 1) (go end_label))
      (setf (f2cl-lib:fref y (1) ((1 *))) (* s1 (exp x)))
      (go end_label)
     label90
      (if (< x tol) (go label110))
      (setf cx (* x x 0.25))
     label100
      (setf f (/ (+ (* ak f) p q) (- bk dnu2)))
      (setf p (/ p (- ak dnu)))
      (setf q (/ q (+ ak dnu)))
      (setf ck (/ (* ck cx) ak))
      (setf t1 (* ck f))
      (setf s1 (+ s1 t1))
      (setf t2 (* ck (- p (* ak f))))
      (setf s2 (+ s2 t2))
      (setf bk (+ bk ak ak 1.0))
      (setf ak (+ ak 1.0))
      (setf s (+ (/ (abs t1) (+ 1.0 (abs s1))) (/ (abs t2) (+ 1.0 (abs s2)))))
      (if (> s tol) (go label100))
     label110
      (setf s2 (* s2 rx))
      (if (= koded 1) (go label170))
      (setf f (exp x))
      (setf s1 (* s1 f))
      (setf s2 (* s2 f))
      (go label170)
     label120
      (setf coef (/ rthpi (f2cl-lib:fsqrt x)))
      (if (= koded 2) (go label130))
      (if (> x elim) (go label330))
      (setf coef (* coef (exp (- x))))
     label130
      (if (= (abs dnu) 0.5) (go label340))
      (if (> x x2) (go label280))
      (setf etest (/ (cos (* pi$ dnu)) (* pi$ x tol)))
      (setf fks 1.0)
      (setf fhs 0.25)
      (setf fk 0.0)
      (setf ck (+ x x 2.0))
      (setf p1 0.0)
      (setf p2 1.0)
      (setf k 0)
     label140
      (setf k (f2cl-lib:int-add k 1))
      (setf fk (+ fk 1.0))
      (setf ak (/ (- fhs dnu2) (+ fks fk)))
      (setf bk (/ ck (+ fk 1.0)))
      (setf pt p2)
      (setf p2 (- (* bk p2) (* ak p1)))
      (setf p1 pt)
      (setf (f2cl-lib:fref a (k) ((1 160))) ak)
      (setf (f2cl-lib:fref b (k) ((1 160))) bk)
      (setf ck (+ ck 2.0))
      (setf fks (+ fks fk fk 1.0))
      (setf fhs (+ fhs fk fk))
      (if (> etest (* fk p1)) (go label140))
      (setf kk k)
      (setf s 1.0)
      (setf p1 0.0)
      (setf p2 1.0)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i k) nil)
        (tagbody
          (setf pt p2)
          (setf p2
                  (/ (- (* (f2cl-lib:fref b (kk) ((1 160))) p2) p1)
                     (f2cl-lib:fref a (kk) ((1 160)))))
          (setf p1 pt)
          (setf s (+ s p2))
          (setf kk (f2cl-lib:int-sub kk 1))
         label150))
      (setf s1 (* coef (/ p2 s)))
      (if (or (> inu 0) (> n 1)) (go label160))
      (go label200)
     label160
      (setf s2 (/ (* s1 (+ x dnu 0.5 (/ (- p1) p2))) x))
     label170
      (setf ck (/ (+ dnu dnu 2.0) x))
      (if (= n 1) (setf inu (f2cl-lib:int-sub inu 1)))
      (if (> inu 0) (go label180))
      (if (> n 1) (go label200))
      (setf s1 s2)
      (go label200)
     label180
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i inu) nil)
        (tagbody
          (setf st s2)
          (setf s2 (+ (* ck s2) s1))
          (setf s1 st)
          (setf ck (+ ck rx))
         label190))
      (if (= n 1) (setf s1 s2))
     label200
      (if (= iflag 1) (go label220))
      (setf (f2cl-lib:fref y (1) ((1 *))) s1)
      (if (= n 1) (go end_label))
      (setf (f2cl-lib:fref y (2) ((1 *))) s2)
      (if (= n 2) (go end_label))
      (f2cl-lib:fdo (i 3 (f2cl-lib:int-add i 1))
                    ((> i n) nil)
        (tagbody
          (setf (f2cl-lib:fref y (i) ((1 *)))
                  (+ (* ck (f2cl-lib:fref y ((f2cl-lib:int-sub i 1)) ((1 *))))
                     (f2cl-lib:fref y ((f2cl-lib:int-sub i 2)) ((1 *)))))
          (setf ck (+ ck rx))
         label210))
      (go end_label)
     label220
      (setf s (- (f2cl-lib:flog s1) x))
      (setf (f2cl-lib:fref y (1) ((1 *))) 0.0)
      (setf nz 1)
      (if (< s (- elim)) (go label230))
      (setf (f2cl-lib:fref y (1) ((1 *))) (exp s))
      (setf nz 0)
     label230
      (if (= n 1) (go end_label))
      (setf s (- (f2cl-lib:flog s2) x))
      (setf (f2cl-lib:fref y (2) ((1 *))) 0.0)
      (setf nz (f2cl-lib:int-add nz 1))
      (if (< s (- elim)) (go label240))
      (setf nz (f2cl-lib:int-sub nz 1))
      (setf (f2cl-lib:fref y (2) ((1 *))) (exp s))
     label240
      (if (= n 2) (go end_label))
      (setf kk 2)
      (if (< nz 2) (go label260))
      (f2cl-lib:fdo (i 3 (f2cl-lib:int-add i 1))
                    ((> i n) nil)
        (tagbody
          (setf kk i)
          (setf st s2)
          (setf s2 (+ (* ck s2) s1))
          (setf s1 st)
          (setf ck (+ ck rx))
          (setf s (- (f2cl-lib:flog s2) x))
          (setf nz (f2cl-lib:int-add nz 1))
          (setf (f2cl-lib:fref y (i) ((1 *))) 0.0)
          (if (< s (- elim)) (go label250))
          (setf (f2cl-lib:fref y (i) ((1 *))) (exp s))
          (setf nz (f2cl-lib:int-sub nz 1))
          (go label260)
         label250))
      (go end_label)
     label260
      (if (= kk n) (go end_label))
      (setf s2 (+ (* s2 ck) s1))
      (setf ck (+ ck rx))
      (setf kk (f2cl-lib:int-add kk 1))
      (setf (f2cl-lib:fref y (kk) ((1 *))) (exp (- (f2cl-lib:flog s2) x)))
      (if (= kk n) (go end_label))
      (setf kk (f2cl-lib:int-add kk 1))
      (f2cl-lib:fdo (i kk (f2cl-lib:int-add i 1))
                    ((> i n) nil)
        (tagbody
          (setf (f2cl-lib:fref y (i) ((1 *)))
                  (+ (* ck (f2cl-lib:fref y ((f2cl-lib:int-sub i 1)) ((1 *))))
                     (f2cl-lib:fref y ((f2cl-lib:int-sub i 2)) ((1 *)))))
          (setf ck (+ ck rx))
         label270))
      (go end_label)
     label280
      (setf nn 2)
      (if (and (= inu 0) (= n 1)) (setf nn 1))
      (setf dnu2 (+ dnu dnu))
      (setf fmu 0.0)
      (if (< (abs dnu2) tol) (go label290))
      (setf fmu (* dnu2 dnu2))
     label290
      (setf ex (* x 8.0))
      (setf s2 0.0)
      (f2cl-lib:fdo (k 1 (f2cl-lib:int-add k 1))
                    ((> k nn) nil)
        (tagbody
          (setf s1 s2)
          (setf s 1.0)
          (setf ak 0.0)
          (setf ck 1.0)
          (setf sqk 1.0)
          (setf dk ex)
          (f2cl-lib:fdo (j 1 (f2cl-lib:int-add j 1))
                        ((> j 30) nil)
            (tagbody
              (setf ck (/ (* ck (- fmu sqk)) dk))
              (setf s (+ s ck))
              (setf dk (+ dk ex))
              (setf ak (+ ak 8.0))
              (setf sqk (+ sqk ak))
              (if (< (abs ck) tol) (go label310))
             label300))
         label310
          (setf s2 (* s coef))
          (setf fmu (+ fmu (* 8.0 dnu) 4.0))
         label320))
      (if (> nn 1) (go label170))
      (setf s1 s2)
      (go label200)
     label330
      (setf koded 2)
      (setf iflag 1)
      (go label120)
     label340
      (setf s1 coef)
      (setf s2 coef)
      (go label170)
     label350
      (xermsg "SLATEC" "DBSKNU" "X NOT GREATER THAN ZERO" 2 1)
      (go end_label)
     label360
      (xermsg "SLATEC" "DBSKNU" "FNU NOT ZERO OR POSITIVE" 2 1)
      (go end_label)
     label370
      (xermsg "SLATEC" "DBSKNU" "KODE NOT 1 OR 2" 2 1)
      (go end_label)
     label380
      (xermsg "SLATEC" "DBSKNU" "N NOT GREATER THAN 0" 2 1)
      (go end_label)
     end_label
      (return (values nil nil nil nil nil nz)))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::dbsknu
                 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((double-float) (double-float)
                        (fortran-to-lisp::integer4) (fortran-to-lisp::integer4)
                        (simple-array double-float (*))
                        (fortran-to-lisp::integer4))
           :return-values '(nil nil nil nil nil fortran-to-lisp::nz)
           :calls '(fortran-to-lisp::xermsg fortran-to-lisp::dgamma
                    fortran-to-lisp::d1mach fortran-to-lisp::i1mach))))

