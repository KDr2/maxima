;;; Compiled by f2cl version 2.0 beta Date: 2007/05/04 17:29:50 
;;; Using Lisp CMU Common Lisp Snapshot 2007-05 (19D)
;;; 
;;; Options: ((:prune-labels nil) (:auto-save t) (:relaxed-array-decls t)
;;;           (:coerce-assigns :as-needed) (:array-type ':simple-array)
;;;           (:array-slicing nil) (:declare-common nil)
;;;           (:float-format double-float))

(in-package :slatec)


(let ((zeror 0.0)
      (zeroi 0.0)
      (coner 1.0)
      (cipr
       (make-array 4
                   :element-type 'double-float
                   :initial-contents '(1.0 0.0 -1.0 0.0)))
      (cipi
       (make-array 4
                   :element-type 'double-float
                   :initial-contents '(0.0 1.0 0.0 -1.0)))
      (hpi 1.5707963267948966)
      (aic 1.2655121234846454))
  (declare (type (simple-array double-float (4)) cipi cipr)
           (type (double-float) aic hpi coner zeroi zeror))
  (defun zuni2 (zr zi fnu kode n yr yi nz nlast fnul tol elim alim)
    (declare (type (simple-array double-float (*)) yi yr)
             (type (f2cl-lib:integer4) nlast nz n kode)
             (type (double-float) alim elim tol fnul fnu zi zr))
    (prog ((bry (make-array 3 :element-type 'double-float))
           (cssr (make-array 3 :element-type 'double-float))
           (csrr (make-array 3 :element-type 'double-float))
           (cyr (make-array 2 :element-type 'double-float))
           (cyi (make-array 2 :element-type 'double-float)) (i 0) (iflag 0)
           (in 0) (inu 0) (j 0) (k 0) (nai 0) (nd 0) (ndai 0) (nn 0) (nuf 0)
           (nw 0) (idum 0) (aarg 0.0) (aii 0.0) (air 0.0) (ang 0.0) (aphi 0.0)
           (argi 0.0) (argr 0.0) (ascle 0.0) (asumi 0.0) (asumr 0.0)
           (bsumi 0.0) (bsumr 0.0) (cidi 0.0) (crsc 0.0) (cscl 0.0) (c1r 0.0)
           (c2i 0.0) (c2m 0.0) (c2r 0.0) (daii 0.0) (dair 0.0) (fn 0.0)
           (phii 0.0) (phir 0.0) (rast 0.0) (raz 0.0) (rs1 0.0) (rzi 0.0)
           (rzr 0.0) (sti 0.0) (str 0.0) (s1i 0.0) (s1r 0.0) (s2i 0.0)
           (s2r 0.0) (zbi 0.0) (zbr 0.0) (zeta1i 0.0) (zeta1r 0.0) (zeta2i 0.0)
           (zeta2r 0.0) (zni 0.0) (znr 0.0) (car$ 0.0) (sar 0.0))
      (declare (type (simple-array double-float (2)) cyi cyr)
               (type (simple-array double-float (3)) cssr csrr bry)
               (type (double-float) sar car$ znr zni zeta2r zeta2i zeta1r
                                    zeta1i zbr zbi s2r s2i s1r s1i str sti rzr
                                    rzi rs1 raz rast phir phii fn dair daii c2r
                                    c2m c2i c1r cscl crsc cidi bsumr bsumi
                                    asumr asumi ascle argr argi aphi ang air
                                    aii aarg)
               (type (f2cl-lib:integer4) idum nw nuf nn ndai nd nai k j inu in
                                         iflag i))
      (setf nz 0)
      (setf nd n)
      (setf nlast 0)
      (setf cscl (/ 1.0 tol))
      (setf crsc tol)
      (setf (f2cl-lib:fref cssr (1) ((1 3))) cscl)
      (setf (f2cl-lib:fref cssr (2) ((1 3))) coner)
      (setf (f2cl-lib:fref cssr (3) ((1 3))) crsc)
      (setf (f2cl-lib:fref csrr (1) ((1 3))) crsc)
      (setf (f2cl-lib:fref csrr (2) ((1 3))) coner)
      (setf (f2cl-lib:fref csrr (3) ((1 3))) cscl)
      (setf (f2cl-lib:fref bry (1) ((1 3)))
              (/ (* 1000.0 (f2cl-lib:d1mach 1)) tol))
      (setf znr zi)
      (setf zni (- zr))
      (setf zbr zr)
      (setf zbi zi)
      (setf cidi (- coner))
      (setf inu (f2cl-lib:int fnu))
      (setf ang (* hpi (- fnu inu)))
      (setf c2r (cos ang))
      (setf c2i (sin ang))
      (setf car$ c2r)
      (setf sar c2i)
      (setf in (f2cl-lib:int-sub (f2cl-lib:int-add inu n) 1))
      (setf in (f2cl-lib:int-add (mod in 4) 1))
      (setf str
              (- (* c2r (f2cl-lib:fref cipr (in) ((1 4))))
                 (* c2i (f2cl-lib:fref cipi (in) ((1 4))))))
      (setf c2i
              (+ (* c2r (f2cl-lib:fref cipi (in) ((1 4))))
                 (* c2i (f2cl-lib:fref cipr (in) ((1 4))))))
      (setf c2r str)
      (if (> zi 0.0) (go label10))
      (setf znr (- znr))
      (setf zbi (- zbi))
      (setf cidi (- cidi))
      (setf c2i (- c2i))
     label10
      (setf fn (max fnu 1.0))
      (multiple-value-bind
            (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-8 var-9 var-10
             var-11 var-12 var-13 var-14 var-15 var-16)
          (zunhj znr zni fn 1 tol phir phii argr argi zeta1r zeta1i zeta2r
           zeta2i asumr asumi bsumr bsumi)
        (declare (ignore var-0 var-1 var-2 var-3 var-4))
        (setf phir var-5)
        (setf phii var-6)
        (setf argr var-7)
        (setf argi var-8)
        (setf zeta1r var-9)
        (setf zeta1i var-10)
        (setf zeta2r var-11)
        (setf zeta2i var-12)
        (setf asumr var-13)
        (setf asumi var-14)
        (setf bsumr var-15)
        (setf bsumi var-16))
      (if (= kode 1) (go label20))
      (setf str (+ zbr zeta2r))
      (setf sti (+ zbi zeta2i))
      (setf rast (coerce (realpart (/ fn (zabs str sti))) 'double-float))
      (setf str (* str rast rast))
      (setf sti (* (- sti) rast rast))
      (setf s1r (- str zeta1r))
      (setf s1i (- sti zeta1i))
      (go label30)
     label20
      (setf s1r (- zeta2r zeta1r))
      (setf s1i (- zeta2i zeta1i))
     label30
      (setf rs1 s1r)
      (if (> (abs rs1) elim) (go label150))
     label40
      (setf nn (min (the f2cl-lib:integer4 2) (the f2cl-lib:integer4 nd)))
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i nn) nil)
        (tagbody
          (setf fn (+ fnu (f2cl-lib:int-sub nd i)))
          (multiple-value-bind
                (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-8 var-9
                 var-10 var-11 var-12 var-13 var-14 var-15 var-16)
              (zunhj znr zni fn 0 tol phir phii argr argi zeta1r zeta1i zeta2r
               zeta2i asumr asumi bsumr bsumi)
            (declare (ignore var-0 var-1 var-2 var-3 var-4))
            (setf phir var-5)
            (setf phii var-6)
            (setf argr var-7)
            (setf argi var-8)
            (setf zeta1r var-9)
            (setf zeta1i var-10)
            (setf zeta2r var-11)
            (setf zeta2i var-12)
            (setf asumr var-13)
            (setf asumi var-14)
            (setf bsumr var-15)
            (setf bsumi var-16))
          (if (= kode 1) (go label50))
          (setf str (+ zbr zeta2r))
          (setf sti (+ zbi zeta2i))
          (setf rast (coerce (realpart (/ fn (zabs str sti))) 'double-float))
          (setf str (* str rast rast))
          (setf sti (* (- sti) rast rast))
          (setf s1r (- str zeta1r))
          (setf s1i (+ (- sti zeta1i) (abs zi)))
          (go label60)
         label50
          (setf s1r (- zeta2r zeta1r))
          (setf s1i (- zeta2i zeta1i))
         label60
          (setf rs1 s1r)
          (if (> (abs rs1) elim) (go label120))
          (if (= i 1) (setf iflag 2))
          (if (< (abs rs1) alim) (go label70))
          (setf aphi (coerce (realpart (zabs phir phii)) 'double-float))
          (setf aarg (coerce (realpart (zabs argr argi)) 'double-float))
          (setf rs1
                  (- (+ rs1 (f2cl-lib:flog aphi))
                     (* 0.25 (f2cl-lib:flog aarg))
                     aic))
          (if (> (abs rs1) elim) (go label120))
          (if (= i 1) (setf iflag 1))
          (if (< rs1 0.0) (go label70))
          (if (= i 1) (setf iflag 3))
         label70
          (multiple-value-bind
                (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7)
              (zairy argr argi 0 2 air aii nai idum)
            (declare (ignore var-0 var-1 var-2 var-3))
            (setf air var-4)
            (setf aii var-5)
            (setf nai var-6)
            (setf idum var-7))
          (multiple-value-bind
                (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7)
              (zairy argr argi 1 2 dair daii ndai idum)
            (declare (ignore var-0 var-1 var-2 var-3))
            (setf dair var-4)
            (setf daii var-5)
            (setf ndai var-6)
            (setf idum var-7))
          (setf str (- (* dair bsumr) (* daii bsumi)))
          (setf sti (+ (* dair bsumi) (* daii bsumr)))
          (setf str (+ str (- (* air asumr) (* aii asumi))))
          (setf sti (+ sti (+ (* air asumi) (* aii asumr))))
          (setf s2r (- (* phir str) (* phii sti)))
          (setf s2i (+ (* phir sti) (* phii str)))
          (setf str (* (exp s1r) (f2cl-lib:fref cssr (iflag) ((1 3)))))
          (setf s1r (* str (cos s1i)))
          (setf s1i (* str (sin s1i)))
          (setf str (- (* s2r s1r) (* s2i s1i)))
          (setf s2i (+ (* s2r s1i) (* s2i s1r)))
          (setf s2r str)
          (if (/= iflag 1) (go label80))
          (multiple-value-bind (var-0 var-1 var-2 var-3 var-4)
              (zuchk s2r s2i nw (f2cl-lib:fref bry (1) ((1 3))) tol)
            (declare (ignore var-0 var-1 var-3 var-4))
            (setf nw var-2))
          (if (/= nw 0) (go label120))
         label80
          (if (<= zi 0.0) (setf s2i (- s2i)))
          (setf str (- (* s2r c2r) (* s2i c2i)))
          (setf s2i (+ (* s2r c2i) (* s2i c2r)))
          (setf s2r str)
          (setf (f2cl-lib:fref cyr (i) ((1 2))) s2r)
          (setf (f2cl-lib:fref cyi (i) ((1 2))) s2i)
          (setf j (f2cl-lib:int-add (f2cl-lib:int-sub nd i) 1))
          (setf (f2cl-lib:fref yr (j) ((1 n)))
                  (* s2r (f2cl-lib:fref csrr (iflag) ((1 3)))))
          (setf (f2cl-lib:fref yi (j) ((1 n)))
                  (* s2i (f2cl-lib:fref csrr (iflag) ((1 3)))))
          (setf str (* (- c2i) cidi))
          (setf c2i (* c2r cidi))
          (setf c2r str)
         label90))
      (if (<= nd 2) (go label110))
      (setf raz (coerce (realpart (/ 1.0 (zabs zr zi))) 'double-float))
      (setf str (* zr raz))
      (setf sti (* (- zi) raz))
      (setf rzr (* (+ str str) raz))
      (setf rzi (* (+ sti sti) raz))
      (setf (f2cl-lib:fref bry (2) ((1 3)))
              (/ 1.0 (f2cl-lib:fref bry (1) ((1 3)))))
      (setf (f2cl-lib:fref bry (3) ((1 3))) (f2cl-lib:d1mach 2))
      (setf s1r (f2cl-lib:fref cyr (1) ((1 2))))
      (setf s1i (f2cl-lib:fref cyi (1) ((1 2))))
      (setf s2r (f2cl-lib:fref cyr (2) ((1 2))))
      (setf s2i (f2cl-lib:fref cyi (2) ((1 2))))
      (setf c1r (f2cl-lib:fref csrr (iflag) ((1 3))))
      (setf ascle (f2cl-lib:fref bry (iflag) ((1 3))))
      (setf k (f2cl-lib:int-sub nd 2))
      (setf fn (coerce (the f2cl-lib:integer4 k) 'double-float))
      (f2cl-lib:fdo (i 3 (f2cl-lib:int-add i 1))
                    ((> i nd) nil)
        (tagbody
          (setf c2r s2r)
          (setf c2i s2i)
          (setf s2r (+ s1r (* (+ fnu fn) (- (* rzr c2r) (* rzi c2i)))))
          (setf s2i (+ s1i (* (+ fnu fn) (+ (* rzr c2i) (* rzi c2r)))))
          (setf s1r c2r)
          (setf s1i c2i)
          (setf c2r (* s2r c1r))
          (setf c2i (* s2i c1r))
          (setf (f2cl-lib:fref yr (k) ((1 n))) c2r)
          (setf (f2cl-lib:fref yi (k) ((1 n))) c2i)
          (setf k (f2cl-lib:int-sub k 1))
          (setf fn (- fn 1.0))
          (if (>= iflag 3) (go label100))
          (setf str (abs c2r))
          (setf sti (abs c2i))
          (setf c2m (max str sti))
          (if (<= c2m ascle) (go label100))
          (setf iflag (f2cl-lib:int-add iflag 1))
          (setf ascle (f2cl-lib:fref bry (iflag) ((1 3))))
          (setf s1r (* s1r c1r))
          (setf s1i (* s1i c1r))
          (setf s2r c2r)
          (setf s2i c2i)
          (setf s1r (* s1r (f2cl-lib:fref cssr (iflag) ((1 3)))))
          (setf s1i (* s1i (f2cl-lib:fref cssr (iflag) ((1 3)))))
          (setf s2r (* s2r (f2cl-lib:fref cssr (iflag) ((1 3)))))
          (setf s2i (* s2i (f2cl-lib:fref cssr (iflag) ((1 3)))))
          (setf c1r (f2cl-lib:fref csrr (iflag) ((1 3))))
         label100))
     label110
      (go end_label)
     label120
      (if (> rs1 0.0) (go label140))
      (setf (f2cl-lib:fref yr (nd) ((1 n))) zeror)
      (setf (f2cl-lib:fref yi (nd) ((1 n))) zeroi)
      (setf nz (f2cl-lib:int-add nz 1))
      (setf nd (f2cl-lib:int-sub nd 1))
      (if (= nd 0) (go label110))
      (multiple-value-bind
            (var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-8 var-9 var-10
             var-11)
          (zuoik zr zi fnu kode 1 nd yr yi nuf tol elim alim)
        (declare (ignore var-0 var-1 var-2 var-3 var-4 var-5 var-6 var-7 var-9
                         var-10 var-11))
        (setf nuf var-8))
      (if (< nuf 0) (go label140))
      (setf nd (f2cl-lib:int-sub nd nuf))
      (setf nz (f2cl-lib:int-add nz nuf))
      (if (= nd 0) (go label110))
      (setf fn (+ fnu (f2cl-lib:int-sub nd 1)))
      (if (< fn fnul) (go label130))
      (setf in (f2cl-lib:int-sub (f2cl-lib:int-add inu nd) 1))
      (setf in (f2cl-lib:int-add (mod in 4) 1))
      (setf c2r
              (- (* car$ (f2cl-lib:fref cipr (in) ((1 4))))
                 (* sar (f2cl-lib:fref cipi (in) ((1 4))))))
      (setf c2i
              (+ (* car$ (f2cl-lib:fref cipi (in) ((1 4))))
                 (* sar (f2cl-lib:fref cipr (in) ((1 4))))))
      (if (<= zi 0.0) (setf c2i (- c2i)))
      (go label40)
     label130
      (setf nlast nd)
      (go end_label)
     label140
      (setf nz -1)
      (go end_label)
     label150
      (if (> rs1 0.0) (go label140))
      (setf nz n)
      (f2cl-lib:fdo (i 1 (f2cl-lib:int-add i 1))
                    ((> i n) nil)
        (tagbody
          (setf (f2cl-lib:fref yr (i) ((1 n))) zeror)
          (setf (f2cl-lib:fref yi (i) ((1 n))) zeroi)
         label160))
      (go end_label)
     end_label
      (return (values nil nil nil nil nil nil nil nz nlast nil nil nil nil)))))

(in-package #-gcl #:cl-user #+gcl "CL-USER")
#+#.(cl:if (cl:find-package '#:f2cl) '(and) '(or))
(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (gethash 'fortran-to-lisp::zuni2 fortran-to-lisp::*f2cl-function-info*)
          (fortran-to-lisp::make-f2cl-finfo
           :arg-types '((double-float) (double-float) (double-float)
                        (fortran-to-lisp::integer4) (fortran-to-lisp::integer4)
                        (simple-array double-float (*))
                        (simple-array double-float (*))
                        (fortran-to-lisp::integer4) (fortran-to-lisp::integer4)
                        (double-float) (double-float) (double-float)
                        (double-float))
           :return-values '(nil nil nil nil nil nil nil fortran-to-lisp::nz
                            fortran-to-lisp::nlast nil nil nil nil)
           :calls '(fortran-to-lisp::zuoik fortran-to-lisp::zuchk
                    fortran-to-lisp::zairy fortran-to-lisp::zabs
                    fortran-to-lisp::zunhj fortran-to-lisp::d1mach))))

