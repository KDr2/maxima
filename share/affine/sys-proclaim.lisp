
(IN-PACKAGE "COMPILER") 
(PROCLAIM
    '(FTYPE (FUNCTION (T) FIXNUM) MAXIMA::POLY-LENGTH MAXIMA::TWO
            MAXIMA::TWO-TIMES-N
            MAXIMA::RANK-DIMENSION-THREE-MODULO-CUBIC
            MAXIMA::LDATA-CODIM MAXIMA::ZOPEN-DIM
            MAXIMA::THREE-TIMES-N)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T T T) *) MAXIMA::HENSEL-LIFT-LIST
            MAXIMA::SP-SET-ENTRY)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T T T *) *) MAXIMA::GROBNER-BI-MONOMIALS)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T *) *) MAXIMA::COPY-SORT
            MAXIMA::VARIETY-LDATA-SUBSET MAXIMA::GROBNER-SUBSET
            MAXIMA::COMMUTATIVE-MONOMIALS MAXIMA::NORMALIZE-ZOPEN
            MAXIMA::APPLY-RMAP MAXIMA::MY-RATCOEFF2
            MAXIMA::FIND-IN-ORDERED-LIST MAXIMA::AFP-EXPT-MODULO
            MAXIMA::CONVERT-POLYNOMIAL-TO-VECTOR MAXIMA::TEST-TIMES
            MAXIMA::GROBNER-MONOMIALS)) 
(PROCLAIM '(FTYPE (FUNCTION (T T T T T) *) MAXIMA::HENSEL-LIFT)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T T *) *) MAXIMA::LDATA-REFINEMENT
            MAXIMA::TRANSLATE-COMPONENT-AND-REDUCE
            MAXIMA::TRANSLATE-COMPONENT
            MAXIMA::TRANSLATE-REDUCED-COMPONENT-AND-REDUCE
            MAXIMA::RSUBLIS MAXIMA::PSUBLIS)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T T) *) MAXIMA::RATIONAL-SUB
            MAXIMA::POLY-NCMUL1 MAXIMA::NEW-RAT-NCMUL1
            MAXIMA::GEN-PSUBLIS MAXIMA::GEN-PREM MAXIMA::PSUBST
            MAXIMA::SP-SET-CURRENT-ROW-ENTRY MAXIMA::SET-ENTRY
            MAXIMA::SP-ENTRY)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T *) T) MAXIMA::SORT-REMEMBER
            MAXIMA::$BLOWUP_CHART
            MAXIMA::$CANCEL_FACTORS_AND_DENOMINATORS MAXIMA::$MONO
            MAXIMA::$CHECK_TRANSPOSE_CONDITION_2_1
            MAXIMA::POINT-OF-TENSORS MAXIMA::DUAL-BASIS-ELEMENT
            MAXIMA::MAKE-PAIRING-FUNCTION MAXIMA::GENCOEFF
            MAXIMA::SEQ-OP MAXIMA::REPLACE-SYMBOLS MAXIMA::BLOWUP-SHEAF
            MAXIMA::SOLVE-SIMPLE-SYSTEM MAXIMA::$FIND_KERNEL
            MAXIMA::PLS-LDATA
            MAXIMA::BLOWUP-PLS-USING-HIGH-DIMENSIONAL-COMPONENTS
            MAXIMA::INTERSECTP MAXIMA::BLOWUP-PLS-USING-CHOICES
            MAXIMA::PCOEFF MAXIMA::$NC_COEFF MAXIMA::$COM
            MAXIMA::REDUCE-LINEAR-LDATA MAXIMA::$TRY_BEZOUT
            MAXIMA::MY-RATCOEFF MAXIMA::$FIND_RANK_OF_RELATIONS
            MAXIMA::$FIND_CENTRAL_ELEMENTS
            MAXIMA::$INDEPENDENT_LINSOLVE MAXIMA::$EXTR_EQNS
            MAXIMA::$EXPRESS_IN_TERMS_OF_BASIS MAXIMA::INTERSECT-LDATA
            MAXIMA::CHECK-SIMP MAXIMA::$NCOEFF
            MAXIMA::SIMPLIFY-DICHOTOMY MAXIMA::$SUBLIS_AND_ADD
            MAXIMA::FIND-POSITION-IN-LIST MAXIMA::MATCH-COMPONENTS
            MAXIMA::$DICHOTOMY
            MAXIMA::ELIMINATE-HIGHEST-POWER-DIVIDING-HOMOGENEOUSLY
            MAXIMA::COLLECT-MONOMIAL-COEFFICIENTS-AND-MONOMIALS
            MAXIMA::$DOT_FACTOR MAXIMA::SP-GET-ROWS-FROM-ARRAY
            MAXIMA::MY-RATCOEFF1 MAXIMA::SIMPLE-RAT-SUBLIS
            MAXIMA::RANDOM-MATRIX MAXIMA::SP-ADD-NEW-ROW
            MAXIMA::ANY-LINEARP MAXIMA::SP-SET-ROWS
            MAXIMA::PV-GET-ROWS-FROM-ARRAY-OF-POLYNOMIALS
            MAXIMA::CHECK-COMPONENT-CONTAINMENT
            MAXIMA::$CONTRACT_TO_VARIABLES
            MAXIMA::AFP-BERLEKAMP-FACTOR1
            MAXIMA::PV-GET-ROWS-FROM-LIST-OF-POLYNOMIALS
            MAXIMA::PCOEFF1 MAXIMA::GEN-MATRIX-ROW-PLUS
            MAXIMA::$GROBNER_MONOMIALS MAXIMA::SP-GROW-ROW
            MAXIMA::IDEAL-SUBSETP)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T T) T) MAXIMA::SORT-GROUPED-LIST
            MAXIMA::CHECK-ASSOCIATIVE MAXIMA::NCMUL1
            MAXIMA::$GENERATE_MATRIX MAXIMA::$SYMBOL_MATRIX
            MAXIMA::$TRACE_GENERAL_ELEMENT MAXIMA::$REPLACE_THE_PATTERN
            MAXIMA::IBLOWUP MAXIMA::$MATRIX_ENTRY
            MAXIMA::BERLEKAMP-GET-FACTORS-BIG-PRIME
            MAXIMA::DOTSIMP-ONE-TERM MAXIMA::FACTOR-OUT-MONOMIAL
            MAXIMA::$FIND_RIGHT_LAP MAXIMA::SET-UP-GRADED-RELATIONS
            MAXIMA::$GENERATE_ARRAY_OF_RELATIONS
            MAXIMA::AFP-TRUNCATE-POWERS1 MAXIMA::PRESULTANT
            MAXIMA::$LIST_SUBLIS MAXIMA::TEST_PATTERN
            MAXIMA::$SPECIAL_FIND_CENTRAL_ELEMENTS MAXIMA::$MONO-AUX
            MAXIMA::$EULER_SUM MAXIMA::$FIND_HIGHEST_WEIGHT_VECTORS
            MAXIMA::$UNIPOTENT_INVARIANT_VECTORS MAXIMA::$EIJ
            MAXIMA::$LEFTSOCLE MAXIMA::DELETE-FROM-SIMPS
            MAXIMA::AFFINE-LDATA MAXIMA::FIND-VARIABLE-WITH-SIMPLE-LC
            MAXIMA::$SUB_MATRIX MAXIMA::LIST-OPENS-WITH-COMPONENT
            MAXIMA::S-BLOW MAXIMA::NORMALIZE-PLS
            MAXIMA::SORT-EXPENSIVE-KEY MAXIMA::OPEN-REFINEMENT
            MAXIMA::POLY-LINEARP MAXIMA::ICHART
            MAXIMA::INVERTIBLE-LEADING-COEFFICIENT MAXIMA::SUB-SCHEME
            MAXIMA::PTRUNCATE MAXIMA::PTRUNCATE1
            MAXIMA::MAKE-NORMAL-ZOPEN MAXIMA::CHECK-NORMALIZATION
            MAXIMA::PREPARE-FOR-BLOWUP MAXIMA::$POLYSUB
            MAXIMA::$PSUBLIS MAXIMA::POLY-SUBST MAXIMA::POLY-SUBST1
            MAXIMA::RATIONAL-SUBST MAXIMA::MY-MINOR
            MAXIMA::$CHECK_ASSOCIATIVE MAXIMA::ONE-DEGREE-FACTORS
            MAXIMA::SPLICE-IN MAXIMA::AFP-TRUNCATE-POWERS
            MAXIMA::NSPLICE-IN MAXIMA::SP-ROW-DOT-ROW-NUMBERS
            MAXIMA::SAFE-PUTPROP MAXIMA::SP-MULTIPLY-ROW
            MAXIMA::NEW-NEWVARMEXPT MAXIMA::SP-ROW-DOT
            MAXIMA::BERLEKAMP-GET-FACTORS-LITTLE-PRIME
            MAXIMA::GET-FACTORS MAXIMA::CHECK-CONVERSION
            MAXIMA::GENMATRIX MAXIMA::$SPUR MAXIMA::$CASE_REP
            MAXIMA::PV-GET-ROWS-FROM-MACSYMA-EQUATIONS-AND-VARIABLES
            MAXIMA::$RANK_OF_REPRESENTATION
            MAXIMA::LIST-IND-TO-TENSOR-IND)) 
(PROCLAIM '(FTYPE (FUNCTION (T T T T T *) T) MAXIMA::HENSEL-LIFT1)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T T T T T) T) MAXIMA::FINAL-CHECK-CONTAINED-IN
            MAXIMA::WR-LIFT MAXIMA::$TENSOR_PRODUCT_REPRESENTATION)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T T *) T) MAXIMA::$INTERCHANGE_MATRIX_ROWS
            MAXIMA::$FIND_COEFFICIENTS_FOR_LINEAR_COMBINATION
            MAXIMA::$INTERCHANGE_MATRIX_COLUMNS
            MAXIMA::REPLACE-MONOMIAL-RAT MAXIMA::BLOWUP-PLS
            MAXIMA::$MY_SUM MAXIMA::SORT-KEY MAXIMA::$FIND_RELATION
            MAXIMA::$INTERSECT_PRINCIPALS_VARIETY
            MAXIMA::NORMALIZE-ZOPEN-IN-PLS MAXIMA::CHECK-CONTAINMENT1
            MAXIMA::CHECK-CONTAINMENT MAXIMA::$INTERSECT_PRINCIPALS
            MAXIMA::GEN-DOT-CHECK-ASSOCIATIVE MAXIMA::GEN-RAT-SUBLIS
            MAXIMA::$SUB1 MAXIMA::EXPRESS-X^I MAXIMA::REPLACE-FUNCTIONS
            MAXIMA::REPLACE-MONOMIAL)) 
(PROCLAIM '(FTYPE (FUNCTION (T T T T T) T) MAXIMA::PSUBLIS1)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T T T) T) MAXIMA::POINT-OF-ALGEBRAS
            MAXIMA::RATIONAL-SUB1 MAXIMA::PROPER-TRANSFORM
            MAXIMA::GENERATE-T-FOR-ONE-DEGREE-FACTORS
            MAXIMA::$DIAGONALIZE_TORUS
            MAXIMA::$RESTRICTION_REPRESENTATION
            MAXIMA::DIMENSION-FROM-SEQUENCE
            MAXIMA::$FAST_CENTRAL_ELEMENTS_GIVEN_COMMUTATOR MAXIMA::HHH
            MAXIMA::BLOWUP-PLS-AND-REDUCED-PLS
            MAXIMA::CYCLIC-MODULE-BASIS
            MAXIMA::BLOWUP-PLS-BY-COMPONENT-OF-REDUCED
            MAXIMA::TRY-HARDER-AND-INTERSECT MAXIMA::SUB-RAT2
            MAXIMA::CORRECT-FACTORS)) 
(PROCLAIM '(FTYPE (FUNCTION NIL *) MAXIMA::SAVE-BLEW-UP)) 
(PROCLAIM
    '(FTYPE (FUNCTION (*) *) MAXIMA::POLY-NCMUL MAXIMA::$CIRCLE_TIMES
            MAXIMA::INTERSECTION-EQUAL1 MAXIMA::TYPE-I-SIMP
            MAXIMA::TEST-NNPFACTOR MAXIMA::GEN-AFP-TIMES1
            MAXIMA::GEN-AFP-TIMES MAXIMA::EXPONENT-PRODUCT
            MAXIMA::VADD* MAXIMA::VMUL* MAXIMA::CREATE-SPARSE-MATRIX
            MAXIMA::ZL-UNION MAXIMA::SP-ADD* MAXIMA::SP-MUL*)) 
(PROCLAIM
    '(FTYPE (FUNCTION NIL T) MAXIMA::$SORT_SOLUTION_TREE
            MAXIMA::SIMPLIFY-POLY-SIMPLIFICATIONS MAXIMA::CONCLUSIONP
            MAXIMA::CHECK-VGP-CORRESPOND MAXIMA::SHOW-VGP
            MAXIMA::RESET-GEN MAXIMA::RESET-VGP MAXIMA::PE
            MAXIMA::REPL-DEG MAXIMA::$REPLACEMENTS
            MAXIMA::$RE_RAT_THE_DOT_SIMPLIFICATIONS
            MAXIMA::WHICH-CENTRALS-TO-ADD
            MAXIMA::$RAT_THE_DOT_SIMPLIFICATIONS MAXIMA::COPY-VGP
            MAXIMA::TE MAXIMA::SHOW-REPLACEMENTS
            MAXIMA::SORT-POLY-SIMPLIFICATIONS
            MAXIMA::MONOMIAL-FINISH-REPLACE MAXIMA::$SHOW_SIMPS
            MAXIMA::REPLACEMENT-SEQUENCES MAXIMA::SHOW-CONSTANTS
            MAXIMA::$POLY_REPLACEMENTS)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T) *) MAXIMA::$LIST_IRREDUCIBLE_FACTORS
            MAXIMA::HEADER-FAKE MAXIMA::$ALGEBRA_TRACE_MATRIX
            MAXIMA::NEW-RAT MAXIMA::ORDER-EQUATIONS MAXIMA::AFP-SQUARE
            MAXIMA::PRINCIPAL-PART MAXIMA::FIND-MAIN-MONOMIAL
            MAXIMA::ST-RAT1 MAXIMA::SC_AND_NC_PARTS MAXIMA::DOTSIMP
            MAXIMA::NUMERICAL-COEFFICIENT-AND-MONOMIAL MAXIMA::GT
            MAXIMA::MUST-REPLACEP MAXIMA::$EXTRACT_NC_PART
            MAXIMA::$NILPOTENT MAXIMA::FIND-LEAST-MAIN-MONOMIAL
            MAXIMA::$CHECK_SKEW3_CONDITIONS MAXIMA::$MUST_REPLACEP
            MAXIMA::RESET-RAT MAXIMA::POLYSIMP
            MAXIMA::CHARACTARISTIC-SETP MAXIMA::FAST-MATCH-COMPONENTS
            MAXIMA::GEN-PCOMPLEXITY MAXIMA::RERAT MAXIMA::SP-RAT
            MAXIMA::AFP-TRY-MAKE-MONIC
            MAXIMA::SP-SWAP-PIVOT-ROW-WITH-LATER-ONE
            MAXIMA::RATIONAL-INVERSE MAXIMA::NEW-NEWVAR
            MAXIMA::SP-BEST-PIVOT MAXIMA::MY-NEWVAR1 MAXIMA::AFP-MOD
            MAXIMA::GCD-ARRAY MAXIMA::AFP-MAKE-MONIC
            MAXIMA::REPLACE-PARAMETERS-BY-AA
            MAXIMA::FIND-WORST-NC-MONOMIAL
            MAXIMA::EXTRACT_NC_AND_SC_PARTS MAXIMA::$LIST_NC_PARTS
            MAXIMA::GEN-MATRIX-ROWS MAXIMA::ST-RAT)) 
(PROCLAIM
    '(FTYPE (FUNCTION (*) T) MAXIMA::$MAKE_ART_Q
            MAXIMA::REMOVE-CONSTANT-PROPERTY
            MAXIMA::$FAST_LINSOLVE_INCONSISTENT_EQUATIONS
            MAXIMA::$LIST_RELATIONS MAXIMA::N**
            MAXIMA::$LINEAR_AUTOMORPHISM_GROUP MAXIMA::SHOW-SIMPS
            MAXIMA::M. MAXIMA::$RELATIONS_FROM_DOT_SIMPS
            MAXIMA::$SIMP_NCMUL MAXIMA::NEW-RAT-NCMUL MAXIMA::MAC-ADD*
            MAXIMA::RAT-NCMUL MAXIMA::MACSYMA-LIST MAXIMA::FREE-NCMUL
            MAXIMA::JOIN-ARRAYS MAXIMA::MAKE-POLYNOMIAL MAXIMA::$NSDOT
            MAXIMA::$CENTRAL_ELEMENTS_IN_DEGREES MAXIMA::$SCALAR_CONCAT
            MAXIMA::$CHECK_SKEW_RELATIONS MAXIMA::SHOW-GENVAR
            MAXIMA::BASIS_FROM_SIMPS
            MAXIMA::SUBSTITUTE-REAL-SYMBOLS-FOR-GENVAR
            MAXIMA::$COLLECT_SKEW_RELATIONS
            MAXIMA::$MODULE_REPLACEMENTS MAXIMA::REPLACEMENTS
            MAXIMA::NN+ MAXIMA::$SLOW_GCDLIST
            MAXIMA::POLY-RELATIONS-FROM-SIMPLIFICATIONS
            MAXIMA::AFFINE-SVAR MAXIMA::RESTART-BLOWUP
            MAXIMA::$SIMPLIFY_DOT_SIMPLIFICATIONS
            MAXIMA::$SORT_DOT_SIMPLIFICATIONS MAXIMA::REPLACE-GENVAR
            MAXIMA::$SUM_HILBERT MAXIMA::$VRAT MAXIMA::DECLARE-CONSTANT
            MAXIMA::$CURRENT_GROBNER_BASIS MAXIMA::MAKE-POLY-DATA
            MAXIMA::MAKE-S-VAR MAXIMA::MAKE-POLYNOMIAL-VECTORS
            MAXIMA::MAKE-MATRIX MAXIMA::MAKE-PRE-LDATA-SHEAVES
            MAXIMA::MAKE-LDATA MAXIMA::MAKE-RMAP MAXIMA::MAKE-ZOPEN
            MAXIMA::MAKE-IDEAL MAXIMA::MAKE-VARIABLE-CORRESPONDENCE
            MAXIMA::UNION-EQUAL MAXIMA::$SHOW_SOLUTION_TREE
            MAXIMA::$GCDLIST MAXIMA::FSIGNAL
            MAXIMA::CONSTRUCT-PRE-LDATA-SHEAVES MAXIMA::FMAT
            MAXIMA::MAKE-SOLUTION-ROW MAXIMA::MAKE-SPARSE-MATRIX
            MAXIMA::SHOW-VG MAXIMA::GEN-PTIMES
            MAXIMA::UNREPLACED-MONOMIALS-IN-DOT-SIMPLIFICATIONS
            MAXIMA::N*)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T) T) MAXIMA::ORDER-DICHOTOMY MAXIMA::$DOTSIMP
            MAXIMA::SET-UP-TRACE-SUBS MAXIMA::$LISTP
            MAXIMA::REDUCE-RATIONAL-MAP-OLD
            MAXIMA::$ADD_TO_SOLUTION_TREE MAXIMA::POLYNOMIALP
            MAXIMA::$LIST_NC_MONOMIALS MAXIMA::$LIST_MATRIX_ENTRIES
            MAXIMA::MAXIMA-MATRIX-FROM-ARRAY MAXIMA::NEW-DISREP
            MAXIMA::DEGREE-ONE-VARIABLES MAXIMA::DESCRIBE-LDATA
            MAXIMA::DESCRIBE-PLS MAXIMA::$PLUSP
            MAXIMA::AFP-TERMS-SQUARE MAXIMA::DISPLAY MAXIMA::$TEST
            MAXIMA::$FIND_RANK MAXIMA::AFP-CONTENT
            MAXIMA::$NORMALIZING_ELEMENT_P MAXIMA::GET-GENVAR
            MAXIMA::PV-GET-BASIS MAXIMA::VARLIST
            MAXIMA::AFP-SQUARE-FREE-WITH-MODULUS MAXIMA::CHECK-CASES
            MAXIMA::LIST-VARIABLES MAXIMA::$DIAGONAL
            MAXIMA::CONSTANT-FUNCTIONP MAXIMA::MY-EVENP
            MAXIMA::$FIRST_VARIABLE MAXIMA::$DECOMPOSE_SYMMETRIC_MATRIX
            MAXIMA::GET-VARLIST MAXIMA::AFP-SQUARE-FREE-FACTORIZATION
            MAXIMA::$NEW_DISREP MAXIMA::TIMEDBASIS
            MAXIMA::FUNCTION-NUMERATOR MAXIMA::FUNCTION-DENOMINATOR
            MAXIMA::$SPLIT_INTO_X_AND_Y MAXIMA::$NUMBERP
            MAXIMA::POLYSIMP-IGNORE-DENOMINATOR MAXIMA::POLY-SCALAR-P
            MAXIMA::BRING-TO-LEFT-SIDE MAXIMA::CONTAINS-A-REPLACEMENT
            MAXIMA::$MY_PHI MAXIMA::HILBERT-MODULO
            MAXIMA::ZERO-MODULO-SIMPLIFICATIONS
            MAXIMA::ADD-PLS-ZOPEN-HISTORY MAXIMA::$M_FROM_F
            MAXIMA::FAST-SCALARP MAXIMA::RATIONAL-FUNCTIONP
            MAXIMA::LDATAP MAXIMA::COPY-LIST-STRUCTURE MAXIMA::$PB
            MAXIMA::GOOD-ORDER-VARIABLES MAXIMA::NEW-RAT-DOTSIMP
            MAXIMA::CONTAINS-A-ZERO-REPLACEMENT
            MAXIMA::CONSTANT-DEG-SEQUENCEP MAXIMA::NNPFACTOR
            MAXIMA::SIMPLIFY-RATIONAL-QUOTIENT
            MAXIMA::REMOVE-ZERO-COEFFICIENTS MAXIMA::$DENOMINATOR
            MAXIMA::SORT-SIMPS-BY-DEGREE
            MAXIMA::HIGH-DIMENSIONAL-COMPONENT MAXIMA::$NUMERATOR
            MAXIMA::SIMPLIFY-SVAR-HOMOGENEOUS MAXIMA::$TES
            MAXIMA::PV-REDUCE
            MAXIMA::CONVERT-POLY-SIMPLIFICATIONS-TO-MACSYMA-FORM
            MAXIMA::MODULE-SIMP MAXIMA::$SET_UP_POLY_SIMPLIFICATIONS
            MAXIMA::MODULE-MUST-REPLACEP MAXIMA::Q-PRIMEP
            MAXIMA::$FIND_BASIS MAXIMA::DOTSIMP-ATOM
            MAXIMA::RAT-VARIABLE MAXIMA::MACSYMA-TYPEP
            MAXIMA::$REVERSE_EQUATION MAXIMA::NORMALIZE-FACTOR-LIST
            MAXIMA::ELIMINATE-EMPTY-AND-LARGER-OPENS
            MAXIMA::COLLECT-NUMBER-FACTORS MAXIMA::$DECLARE_SCALAR_LIST
            MAXIMA::PARSE-STRING MAXIMA::$STANDARD_BASIS
            MAXIMA::MUST-REPLACEP1 MAXIMA::POLY-TYPE
            MAXIMA::SIMPLIFY-MODULE-SIMPS MAXIMA::NC-MONOMIAL-TABLE
            MAXIMA::$HH MAXIMA::$MAKE_COMMUTATIVE MAXIMA::DOTSIMP2
            MAXIMA::MUST-REPLACEP1-BY-ZERO MAXIMA::MAKE-SIMP
            MAXIMA::|$HOMEWORK-aux| MAXIMA::DOTSIMP1
            MAXIMA::MATRIX-RANK MAXIMA::PLAIN-ADD-TO-MODULE-SIMPS
            MAXIMA::RATL-FUNCTION-ID MAXIMA::REMOVE-HEADER
            MAXIMA::MODULE-MONOM-MUST-REPLACEP MAXIMA::LAST2
            MAXIMA::CHECK-RAT-VARIABLES MAXIMA::COERCE-NCTIMES
            MAXIMA::FAKE-HEADER MAXIMA::$CLIFFORD_DOT_SIMPLIFICATIONS
            MAXIMA::RAT-SIMPLIFICATIONS MAXIMA::$LIST_FACTORS
            MAXIMA::MAKE-PREMONOMIAL MAXIMA::$MODSIMP
            MAXIMA::SHOW-MATRIX MAXIMA::VMINUS*
            MAXIMA::NUMBER-AND-ZEROP MAXIMA::$PBI MAXIMA::$SUMP
            MAXIMA::SP-DETERMINANT MAXIMA::CHECK-ZOPEN-INV
            MAXIMA::$NC_LINEAR_FACTOR MAXIMA::$ZEROP
            MAXIMA::RANK-DIMENSION-THREE MAXIMA::$COLLECT
            MAXIMA::MAKE-MONOMIAL MAXIMA::MODULE-AND-DOT-SIMP
            MAXIMA::RANK-1-1-1-9 MAXIMA::$LIST_TERMS
            MAXIMA::POLYNOMIAL-RING-1-1-1 MAXIMA::$HILBERT_MODULO
            MAXIMA::SHOW-COEFF MAXIMA::REDUCE-POLY-DATA
            MAXIMA::$READ_LISP_STRING MAXIMA::MONO-DIMENSION
            MAXIMA::$LIST_OF_VARIABLES MAXIMA::ALL-PERMS
            MAXIMA::$NC_MATRIX_ROW_REDUCE
            MAXIMA::$ADD_RELATION_TO_DOT_SIMPLIFICATIONS
            MAXIMA::PV-CLEAN-UP MAXIMA::$TRY MAXIMA::LIST-OPENS1
            MAXIMA::OUR-DIMENSIONS MAXIMA::REPLACE-DOT-SIMPLIFICATIONS
            MAXIMA::LDATA-UNUSED MAXIMA::SH-COMP
            MAXIMA::LIST-VARIABLES1 MAXIMA::$PLUCKER
            MAXIMA::$GLOBAL_DIMENSION_3 MAXIMA::$DOT_PRODUCTP
            MAXIMA::TRIANGULARP MAXIMA::NPFACTOR MAXIMA::$DOT
            MAXIMA::NSIGN-OF-PERMUTATION
            MAXIMA::MONOMIALS-AND-RANK-FUNCTION-AGREE
            MAXIMA::SIGN-OF-PERMUTATION
            MAXIMA::SORT-THE-REDUCED-HISTORY MAXIMA::$CHECK_PROGRAMS
            MAXIMA::$MATRIX_EQUATIONP
            MAXIMA::CHECK-EQUIVALENCE-RELATION MAXIMA::$NC_COEFFICIENTS
            MAXIMA::REPLACE-RMAPS-BY-NEW-ONES
            MAXIMA::CHANGE-STRINGS-TO-SYMBOLS MAXIMA::XXX
            MAXIMA::TEST-SIMP-LEAD MAXIMA::$DECLARE_CONSTANT_LIST
            MAXIMA::$NEW_RAT MAXIMA::SET-INEQUALITIES-TO-ONE
            MAXIMA::$FIND_RELATIONS_IN_FREE_RING
            MAXIMA::ELIMINATE-COMMON-FACTORS MAXIMA::REMOVE-0
            MAXIMA::REDUCE-RATIONAL-MAP MAXIMA::$POLYSIMP
            MAXIMA::CONVERT-DEG-SEQUENCE-TO-MONOMIAL
            MAXIMA::$REMOVE_LINEARS MAXIMA::$SQUARE_FREE_NUMERATORS
            MAXIMA::$REMOVE_NUMBER MAXIMA::LAST-STRING MAXIMA::UPDATE
            MAXIMA::NON-TRIVIAL-OPEN-SUB-SCHEME
            MAXIMA::MULTIPLY-OUT-FACTORIZATION MAXIMA::SHOW-DIVISORS
            MAXIMA::PLAIN-SIMPLIFY-SVAR-LDATA MAXIMA::MONOMIALP
            MAXIMA::ONE-VARIABLEP MAXIMA::GENVAR
            MAXIMA::SP-PRODUCT-OF-PIVOTS MAXIMA::CONSTRUCT-RMAP
            MAXIMA::DESCRIBE-COMPONENTS MAXIMA::S-VAR-P
            MAXIMA::DELETE-FROM-&AUX MAXIMA::$LIST_COMPONENTS
            MAXIMA::CLEAR-MEMORY-FUNCTION MAXIMA::CONSTANT-TERM
            MAXIMA::MATRIX-P MAXIMA::VA MAXIMA::PRE-LDATA-SHEAVES-P
            MAXIMA::LDATA-P MAXIMA::POLY-SCALARP MAXIMA::RMAP-P
            MAXIMA::NEW-DOTSIMP MAXIMA::ZOPEN-P
            MAXIMA::SIMP-ONCE-MONOMIAL MAXIMA::FIX-OPTIONAL
            MAXIMA::ORDER-VARIABLES-BY-OCCURENCE MAXIMA::DOT-SHOW
            MAXIMA::COLL-LINEAR MAXIMA::COLL-LINEAR1
            MAXIMA::SP-RESET-LIST-OF-ALL-COLUMNS-OCCURRING
            MAXIMA::FIX-EVEN MAXIMA::FORCE-POLY MAXIMA::SP-FLOAT
            MAXIMA::NCDOT-LIST MAXIMA::$COERCE_MATRIX
            MAXIMA::HEADER-POLY MAXIMA::GROBNER-BASIS-REMEMBER
            MAXIMA::GROBNER-REMEMBER MAXIMA::NEW-PFACTOR
            MAXIMA::SP-VERIFY-SOLUTIONS
            MAXIMA::MULTIPLY-FACTORS-WITH-MULTIPLICITY
            MAXIMA::$COLL_LINEAR MAXIMA::CONSTANT-POLYP
            MAXIMA::ADD-NEWVAR-TO-GENPAIRS MAXIMA::UNDO-TELLRATS
            MAXIMA::FIND-GOOD-VARIABLE-ORDER MAXIMA::SET-TELLRATS
            MAXIMA::LIST-PREVIOUS-TELLRATS MAXIMA::$MONO_WEIGHTED
            MAXIMA::SQUARE-FREE MAXIMA::RATIONALIZE-DENOM-ZETA3
            MAXIMA::SP-SHOW-CURRENT-AND-PIVOT MAXIMA::AFP-TERMS-MINUS
            MAXIMA::ORDER-VARIABLES MAXIMA::SAFE-STRING
            MAXIMA::TEST-DECREASE MAXIMA::NEW-PREP1
            MAXIMA::INTEGER-UNIVARIATE-FACTOR1 MAXIMA::$PHI
            MAXIMA::MAKE-TEST MAXIMA::FACTOREDP MAXIMA::NEW-RATF
            MAXIMA::CONVERT-RMAP-TO-NEW MAXIMA::NEW-RATREP*
            MAXIMA::SP-SMALLEST-POSSIBLE-PIVOT MAXIMA::NEW-RMAP-P
            MAXIMA::Q-VAR MAXIMA::AR-LAST MAXIMA::AFP-MINUS
            MAXIMA::SP-CHOOSE-TYPE-OF-ENTRIES MAXIMA::$PROJECTIVE
            MAXIMA::SP-BEST-PIVOT-MACSYMA
            MAXIMA::SP-PUT-BACK-ROW-WITH-NO-PIVOT MAXIMA::FAKE-DISREP
            MAXIMA::$ZETA3_RATSIMP MAXIMA::SHOW-GCD-OF-COLUMNS
            MAXIMA::DESIRABLE-ROW MAXIMA::CHECK-ORDER
            MAXIMA::$DISREP_IDEAL MAXIMA::ROW-TO-TERMS
            MAXIMA::GENERATE-NEW-VARIABLE-GENSYM MAXIMA::DESCRIBE-ZOPEN
            MAXIMA::DISREP-LIST MAXIMA::DESCRIBE-RMAP
            MAXIMA::CHECK-REPEATS
            MAXIMA::CONSTANT-TERM-IN-MAIN-VARIABLE
            MAXIMA::SP-FIND-GOOD-COLUMN-TO-PIVOT MAXIMA::SHL
            MAXIMA::PCOMPLEXITY MAXIMA::PV-CHECK-TYPE-OF-ENTRIES
            MAXIMA::NEW-NEWSYM MAXIMA::FLOAT-ZEROP
            MAXIMA::$LIST_EQUATIONS MAXIMA::SP-SHOW-MATRIX
            MAXIMA::LIST-EQUATIONS-MACSYMA1
            MAXIMA::MAKE-ONE-DIMENSIONAL MAXIMA::$ZETA3_FACTOR
            MAXIMA::REMOVE-FROM-*GENPAIRS* MAXIMA::SP-SHOW-SOLUTIONS
            MAXIMA::SP-VERIFY-COLUMNS-ABOVE-PIVOTS-ARE-ZERO
            MAXIMA::PV-SET-UP-HASH-TABLES MAXIMA::AR-SECOND-LAST
            MAXIMA::$SLOW_PROJECTIVE MAXIMA::TOTAL-DIMENSION
            MAXIMA::RAT-DOTSIMP MAXIMA::SP-MINUS* MAXIMA::GEN-DEGREE
            MAXIMA::$DOT_SIMP_MONOMIAL MAXIMA::SP-CLEAR-PIVOTS
            MAXIMA::INTEGER-UNIVARIATE-FACTOR
            MAXIMA::SP-REDUCE-ELEMENTS-FOR-TYPE
            MAXIMA::TRY-MULTI-FACTOR0
            MAXIMA::MAYBE-MOVE-BACK-FILL-POINTER
            MAXIMA::GET-ROWS-FROM-ARRAY MAXIMA::TEST-INTEGER-FACTOR
            MAXIMA::COLLECT-COEFFICIENTS MAXIMA::$FIND_SIMPLIFICATIONS
            MAXIMA::DEGREE-OF-SEQUENCE MAXIMA::SP-CHECK-SET-UP
            MAXIMA::AFP-BERLEKAMP-FACTOR MAXIMA::LIST-TERMS
            MAXIMA::$EXTRACT_NC_AND_SC_PARTS
            MAXIMA::SP-SHOW-ROW-ARRAY-LEADERS MAXIMA::LIST-EQUATIONS1
            MAXIMA::$LIST_POLES_OF_SUM MAXIMA::$NC_RAT
            MAXIMA::DEGREE-OF-DEG-SEQUENCE MAXIMA::SP-MAKE-TRANSPOSE
            MAXIMA::NCSIMP MAXIMA::ID MAXIMA::$MATRIX_FROM_LIST
            MAXIMA::ROTA1 MAXIMA::PD-CONVERT-TO-MAXIMA-FORMAT
            MAXIMA::INITIAL-SEGMENT-IS-REPLACED MAXIMA::WHERE-THE-MIN
            MAXIMA::POLY-DATA-FROM-NC-MATRIX
            MAXIMA::LIST-OF-MACSYMA-ARRAYS-TO-ROWS
            MAXIMA::PV-SET-UP-SPARSE-MATRIX-FROM-ROWS MAXIMA::SEQ-MINUS
            MAXIMA::FIND-EXTRA-CONDITIONS MAXIMA::$SETFY
            MAXIMA::PV-SOLVE-SUITABLE-TO-SUBLIS
            MAXIMA::CONVERT-MONOMIAL-TO-DEG-SEQUENCE MAXIMA::NEW-ZEROP
            MAXIMA::MACSYMA-DISPLAY MAXIMA::POLY-IDENTITY
            MAXIMA::SORT-LIST-OF-MONOMIALS
            MAXIMA::$ADD_TO_POLY_SIMPLIFICATIONS MAXIMA::$LDATA_DISREP
            MAXIMA::NIL-RADICALP MAXIMA::DEGREE-OF-WORST-MONOMIAL
            MAXIMA::$FAST_DETERMINANT MAXIMA::SHOW-HASH
            MAXIMA::$FIND_RANK_OF_LIST_OF_POLYNOMIALS)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T *) *) MAXIMA::$GENERAL_SUM MAXIMA::ADD-NEWVAR
            MAXIMA::$DOTSIMP_REMEMBER MAXIMA::$LINEAR_VARIABLES
            MAXIMA::TEST-SQUARE MAXIMA::LDATA-SIMPLIFICATIONS-WRITE
            MAXIMA::FSH MAXIMA::SIMPLIFY-AFFINE-LDATA-WRITE
            MAXIMA::CONVERT-RELATION-TO-DOT-SIMP
            MAXIMA::NON-SINGULAR-COMPLETE-INTERSECTION-P
            MAXIMA::REDUCE-JACOBIAN MAXIMA::FAST-GROBNER-BASIS
            MAXIMA::RANK-GENERIC-REDUCE-JACOBIAN MAXIMA::LINEAR-SOLVEDP
            MAXIMA::BUILD-EQUIV MAXIMA::SIMP-LEAD1 MAXIMA::$NC_DEGREE)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T T) (VALUES T T))
            MAXIMA::ORDERED-PAIR-IN-LIST)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T *) T) MAXIMA::$NORMALIZING_CONDITIONS
            MAXIMA::$EXTRACT_LINEAR_EQUATIONS MAXIMA::UNIT-IDEALP
            MAXIMA::FF MAXIMA::$FAST_LINSOLVE MAXIMA::M-PREPARED
            MAXIMA::ONE-PREPARED MAXIMA::$DIMENSIONS_FOR_REPLACEMENTS
            MAXIMA::HILBERT MAXIMA::$LIST_VARIABLES MAXIMA::AFFINE-OPEN
            MAXIMA::ADD-TO-POLY-SIMPLIFICATIONS MAXIMA::CHECK-OVERLAPS
            MAXIMA::$GROBNER_BASIS MAXIMA::SIMPLIFY-SVAR-LDATA
            MAXIMA::COLLECT-ATOMS MAXIMA::LDATA-SIMPLIFY-HOMOGENEOUS
            MAXIMA::LDATA-SIMPLIFICATIONS MAXIMA::$SEPARATE_PARAMETERS
            MAXIMA::OPEN-SUB-SCHEME MAXIMA::PERMUTATIONS
            MAXIMA::POLY-TO-ROW MAXIMA::SUBS-TRANSLATE-SUBLIS
            MAXIMA::$ADD_TO_SIMPS MAXIMA::$DETERMINANT_OF_EQUATIONS
            MAXIMA::GROBNER-BASIS MAXIMA::STRING-GRIND
            MAXIMA::SP-NUMBER-OF-PIVOTS MAXIMA::$EARLIER_MONO
            MAXIMA::SIMPLIFY-AFFINE-LDATA MAXIMA::$FIND_RELATIONS_AMONG
            MAXIMA::MATRIX-TO-SPARSE-MATRIX
            MAXIMA::$MONOMIAL_DIMENSIONS MAXIMA::$FAST_NORMAL_ELEMENTS
            MAXIMA::NEW-CONCAT MAXIMA::ALL-LINEAR-VARIABLES
            MAXIMA::$SIG MAXIMA::EXTRACT-LINEAR-EQUATIONS
            MAXIMA::CHECK-RAT-ORDER MAXIMA::ALL-LINEARP
            MAXIMA::$SOLVE_NC_COEFFICIENTS
            MAXIMA::NEW-CONVERT-RELATION-TO-DOT-SIMP
            MAXIMA::SP-MAKE-SPARSE-MATRIX MAXIMA::ELIMINATE-LARGER
            MAXIMA::FIND-GOOD-DICHOTOMY MAXIMA::GM-ALL-PREPARED
            MAXIMA::FIND-NUMBER-OF-CENTRALS MAXIMA::$SUB_MATRIX_COLUMNS
            MAXIMA::$CHECK_A_CASE MAXIMA::MAKE-COMPONENT-HISTORY
            MAXIMA::REMOVE-LINEARS MAXIMA::JACOBIAN-MATRIX
            MAXIMA::$RITT_SET MAXIMA::CONVERT-TO-SPARSE-MATRIX
            MAXIMA::BLOWUP-KEEP-EXCEPTIONAL MAXIMA::ML-SORT
            MAXIMA::SHORT-LIST-OPEN-NUMBERS MAXIMA::LINEAR-LDATAP
            MAXIMA::ELIMINATE-MULTIPLES MAXIMA::UNUSED-VARIABLES
            MAXIMA::MATCH-ALL-COMPONENTS
            MAXIMA::PROVIDE-SOME-CHOICES-TO-BLOWUP
            MAXIMA::$ELIMINATE_NONZERO_FACTORS
            MAXIMA::$SET_UP_MODULE_SIMPLIFICATIONS
            MAXIMA::LINEAR-TRIANGULARP MAXIMA::$CYCLIC_MODULE_BASIS
            MAXIMA::$SIMPLE_SOLVE MAXIMA::ELIMINATE-SMALLER
            MAXIMA::$MODULE_DIMENSIONS MAXIMA::SVAR-SIMP
            MAXIMA::GONE-PREPARED MAXIMA::JACOBIAN
            MAXIMA::NON-CONSTANT-FACTORS MAXIMA::JACOBIAN-DICHOTOMY
            MAXIMA::AFP-DISTINCT-DEGREE-FACTOR
            MAXIMA::SP-MAKE-ROWS-DESIRABLE MAXIMA::MACSYMA-ARRAY-TO-ROW
            MAXIMA::DEGREE MAXIMA::GM-PREPARED MAXIMA::SP-SOLVE
            MAXIMA::AFP-FACTOR MAXIMA::FIND-SMALL-PRIME-SO-SQUARE-FREE
            MAXIMA::SH MAXIMA::ZERO-SUBLIS MAXIMA::SP-REDUCE
            MAXIMA::SP-SHOW-ROWS MAXIMA::LINEAR-DICHOTOMY
            MAXIMA::TRY-FACTOR-IRREDUCIBLE-LDATA
            MAXIMA::DIVIDE-DICHOTOMY MAXIMA::MAKE-DICHOTOMY
            MAXIMA::SP-GROW-CURRENT-ROW MAXIMA::SIMP-LEAD
            MAXIMA::SP-LIST-PIVOTS MAXIMA::VARIABLE-DOESNT-OCCUR
            MAXIMA::DES MAXIMA::$UNLIST_MATRIX_ENTRIES
            MAXIMA::SP-SHOW-PIVOTS MAXIMA::EXPONENT-VECTOR
            MAXIMA::TENSOR-IND-TO-LIST-IND MAXIMA::$SHIFT
            MAXIMA::CHECK-CENTRALS MAXIMA::$BASIS_OF_INVARIANT_RING
            MAXIMA::$CHECK_OVERLAPS MAXIMA::$SET_UP_DOT_SIMPLIFICATIONS
            MAXIMA::$MAYBE_LDATA_SOLVE MAXIMA::DELETE-REDUNDANT-LDATA
            MAXIMA::SIMPLIFY-LDATA)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T) *) MAXIMA::$SCALAR_SUM
            MAXIMA::$CONSTANT_TERM MAXIMA::AFP-TIMES
            MAXIMA::AFP-BIG-GCD MAXIMA::AFP-SUBRESULTANT-GCD
            MAXIMA::RECURSIVE-IDEAL-GCD MAXIMA::RECURSIVE-IDEAL-GCD1
            MAXIMA::AFP-DIFFERENCE MAXIMA::OCCURS-IN1
            MAXIMA::AFP-CQUOTIENT MAXIMA::AFP-EUCLIDEAN-GCD
            MAXIMA::AFP-PSEUDO-QUOTIENT MAXIMA::AFC-REMAINDER
            MAXIMA::TYPE-II-SIMP MAXIMA::$DEGLESS MAXIMA::INITIAL-SEG
            MAXIMA::FIND-REPEATS MAXIMA::LDATA-SUBSET MAXIMA::DES-FILE
            MAXIMA::SP-QUOTIENT-SPACE-BASIS MAXIMA::SAVE-PARTS
            MAXIMA::WRITE-OBJECT MAXIMA::APPEARS-IN
            MAXIMA::SUBS-FOR-PSUBLIS MAXIMA::HIGHEST-POWER-DIVIDING
            MAXIMA::MY-TESTDIVIDE MAXIMA::SPLIT-NUMERATOR
            MAXIMA::SP-FIRST-ELEMENT-OF-ROW MAXIMA::AFP-QUOTIENT
            MAXIMA::AFP-GCD MAXIMA::AFP-EXPT MAXIMA::VARIABLE-IN-POLYP
            MAXIMA::CONSTANT-PSUBLIS MAXIMA::CONSTANT-PSUBLIS1
            MAXIMA::AFP-PCTIMES MAXIMA::SP-GCD-COLUMN MAXIMA::AFP-PLUS
            MAXIMA::SP-SORT-ROW MAXIMA::SP-SET-TYPE-OF-ENTRIES
            MAXIMA::SP-SUB* MAXIMA::GET-KEY MAXIMA::ROW-ENTRY)) 
(PROCLAIM
    '(FTYPE (FUNCTION (T T) T) MAXIMA::SORT-BY-ORDERING
            MAXIMA::REMOVE-COMMON-FACTORS MAXIMA::$ALGEBRA_TRACE
            MAXIMA::STRINGS-SEARCH MAXIMA::MAY-INVERTP MAXIMA::NCMUL2*
            MAXIMA::SFTIMES MAXIMA::LIST-TABLEAUX
            MAXIMA::COLLECT-ATOMS1 MAXIMA::$MULTIPLY_ROW
            MAXIMA::$SIMP_NCMULN MAXIMA::TAIL-ALPHALESSP
            MAXIMA::$LIST_DOT MAXIMA::RAT-DEGREE MAXIMA::$DNCMUL
            MAXIMA::$COMMUTATIVE_DOT_MONOMIALS MAXIMA::$DIM3_RELATIONS
            MAXIMA::NRED MAXIMA::PV-GET-ROWS-FROM-MACSYMA-EQUATIONS
            MAXIMA::OVERLAP MAXIMA::GEN-POINTERGP
            MAXIMA::$GROBNER_BASIS_OF_SLICE MAXIMA::AFP-TERMS-DIFFER
            MAXIMA::N- MAXIMA::REVERSE-XYZ-ORDER-SEQUENCE
            MAXIMA::AFP-TERMS-MAIN-CONSTANT-DIFFER
            MAXIMA::AUX_TO_LIST_OF_VARIABLES
            MAXIMA::AFP-TERMS-CONSTANT-MAIN-DIFFER MAXIMA::$FIRSTN
            MAXIMA::SEQ-SUBSET MAXIMA::$NEXP MAXIMA::PART-ABOVE-DEGREE
            MAXIMA::DEG-SEQUENCE MAXIMA::ORDERED-SUBLIST
            MAXIMA::MAYBE-RATREDUCE
            MAXIMA::FIND-FACTOR-LIST-GIVEN-IRREDUCIBLE-FACTORS
            MAXIMA::OCCURS-IN MAXIMA::VDIV*
            MAXIMA::APPLY-LINEAR-FUNCTION MAXIMA::A-LESS
            MAXIMA::PART-ABOVE MAXIMA::PART-ABOVE1 MAXIMA::MDEGREE
            MAXIMA::ONE-PTIMES MAXIMA::LINEAR-POLY-SOLVE
            MAXIMA::FAST-GCD MAXIMA::MATRIX-COLUMN MAXIMA::BIN-GCD
            MAXIMA::FIND-RING-MAP MAXIMA::GET-ALT MAXIMA::GET-ALTQ
            MAXIMA::BERLEKAMP-POLYNOMIAL-SOLUTIONS MAXIMA::NC-EQUAL
            MAXIMA::INITIAL-EQUAL MAXIMA::SAME-MAIN-AND-DEGREE
            MAXIMA::APPEARS MAXIMA::VARIABLES-SAME-DIVIDE
            MAXIMA::SEQ-LESSP MAXIMA::AFC-QUOTIENT MAXIMA::N.
            MAXIMA::SUB-LISTS MAXIMA::DOT-RIGHT-QUOTIENT
            MAXIMA::DELETE-PAIR MAXIMA::INITIAL-SUBLIST
            MAXIMA::ZOPEN-SPECIAL-SUBSET
            MAXIMA::REVERSE-Z-ORDER-SEQUENCE MAXIMA::$FIND_SYGY
            MAXIMA::Z-ORDER-SEQUENCE MAXIMA::$SOLVE_SP
            MAXIMA::$FIND_EIGENVECTORS MAXIMA::ADD-ZOPEN-HISTORY
            MAXIMA::$SUB_LIST MAXIMA::CHECK-COMPONENTS-CONTAIN-ORIGINAL
            MAXIMA::REPLACE-PARAMETERS-BY MAXIMA::$LASTN_NCDEGREE
            MAXIMA::ORDER-LDATA MAXIMA::$FAST_CENTRAL_ELEMENTS
            MAXIMA::$FIRSTN_NCDEGREE
            MAXIMA::SP-REDUCE-ROW-WITH-RESPECT-TO-ROWS MAXIMA::$TENSOR4
            MAXIMA::$MY_NC_COEF MAXIMA::SUB-LIST MAXIMA::GET-COMPONENT
            MAXIMA::$FIND_CENTRAL_THRU_DEG MAXIMA::HIGHEST-VARIABLES
            MAXIMA::BEST-OPEN-COVER MAXIMA::$NU_POLY MAXIMA::NEW-SUBLIS
            MAXIMA::BEST-OPEN-COVER1 MAXIMA::$TE
            MAXIMA::VERIFY-SIMPLIFICATION MAXIMA::MAKE-RELATION
            MAXIMA::APPLY-RMAP-TO-SQUARE-FREE-FACTORS
            MAXIMA::ANY-INVERTIBLE-LEADING-COEFFICIENT
            MAXIMA::NEW-TESTDIVIDE MAXIMA::NPLCM MAXIMA::NPGCD
            MAXIMA::$MONOMIAL_AND_DEGREE_LESSP MAXIMA::MY-PAIRLIS
            MAXIMA::$CONVERT_RIGHT_TO_LEFT
            MAXIMA::CONTRACT-IDEAL-LOCALIZATION MAXIMA::UN-SORT
            MAXIMA::$SIMPLIFY_RELATIVE MAXIMA::MYSUB MAXIMA::MYSUB1
            MAXIMA::PLENGTH-ORDER
            MAXIMA::INTERSECTION-INEQUALITY-IN-OP1 MAXIMA::DELETE-NTH
            MAXIMA::OPEN-REFINEMENT-FOR-LIST MAXIMA::OPEN-SUBSETP
            MAXIMA::ZOPEN-EQUAL MAXIMA::REFINE-PLS MAXIMA::USER-SUPPLY1
            MAXIMA::A-FACTOR MAXIMA::LEADING-COEFFICIENT
            MAXIMA::SUBS-FOR-SIMPLE-RAT-SUBLIS
            MAXIMA::$NC_MATRIX_QUOTIENT MAXIMA::$SHIFT_SEQUENCE
            MAXIMA::LASTN MAXIMA::ZL-PAIRLIS MAXIMA::ANY-IRREDUCIBLE
            MAXIMA::LEADING-COF MAXIMA::ALPHAGREATP MAXIMA::DOT-SUBWORD
            MAXIMA::$MONOMIAL_ALPHAGREATP MAXIMA::$MONOMIAL_ALPHALESSP
            MAXIMA::$DEGREE MAXIMA::$WEDGE_MATRIX
            MAXIMA::$POWER_SERIES_MONOMIAL_ALPHALESSP
            MAXIMA::COLLECT-MONOMIAL-COEFFICIENTS
            MAXIMA::COLLECT-AND-VERIFY-COEFFICIENTS
            MAXIMA::$LIST_TABLEAUX MAXIMA::PDISCRIMINANT
            MAXIMA::SP-VERIFY-SOLUTIONS-FOR-ORIGINAL-ARRAY
            MAXIMA::GEN-VREM MAXIMA::MUST-RITT-REDUCEP
            MAXIMA::RITT-REDUCE MAXIMA::VDIVIDE MAXIMA::RAT-SETUP2
            MAXIMA::RAT-SETUP1 MAXIMA::ADD-TO-CHAIN
            MAXIMA::VARIABLE-IN-POLYP1 MAXIMA::AFP-TEST-DIVIDE
            MAXIMA::ELIMINATE-FACTORS MAXIMA::CONJ-ZETA3
            MAXIMA::AFP-PGCDCOFACTS MAXIMA::$REL
            MAXIMA::ANY-GM-PREPARED MAXIMA::AFP-DEGVECTOR
            MAXIMA::SP-ENTER-PIVOT-DATA MAXIMA::$SOCLE
            MAXIMA::COMPOSE-RMAP MAXIMA::$INVERSE_MODULO
            MAXIMA::SMALLEST-POWER-BIGGER
            MAXIMA::SP-FORCE-PIVOT-ROW-TO-CONTAIN-GCD MAXIMA::$NU
            MAXIMA::SP-GCD-ROW MAXIMA::N1* MAXIMA::AFP-TERMS-TIMES
            MAXIMA::SP-INIT MAXIMA::TABLEAUX-LESSP MAXIMA::POLY-DEGREE
            MAXIMA::AFP-SMALLEST-VAR MAXIMA::EXPONENT
            MAXIMA::CHECK-FOR-GM-PREPARED
            MAXIMA::BERLEKAMP-SET-UP-AND-REDUCE-MATRIX
            MAXIMA::SP-SET-CURRENT-COLUMN-ABOVE-PIVOT-ROW-NUMBER
            MAXIMA::SP-SHOW-ROW MAXIMA::AFP-TERMS-PLUS
            MAXIMA::AFP-CONSTANT-TERM-PLUS MAXIMA::SET-FILL-POINTER
            MAXIMA::SP-SET-CURRENT-ROW MAXIMA::SP-DIV*
            MAXIMA::GCD-AND-COFS MAXIMA::SP-KILL-EXTRA-ROWS
            MAXIMA::$FIND_MATRIX_OF_OPERATOR
            MAXIMA::$IDEAL_INTERSECTION MAXIMA::SP-ROW-OPERATION
            MAXIMA::SP-SET-PIVOT-ROW MAXIMA::$TENSOR2 MAXIMA::VSUB*
            MAXIMA::CHOOSE MAXIMA::XYZ-ORDER-SEQUENCE
            MAXIMA::XYZ-AND-DEGREE MAXIMA::PUT-TELLRAT-PROPERTY
            MAXIMA::$POLY_MONOMIAL_DIMENSIONS MAXIMA::MAX-FOR-PRED
            MAXIMA::SEGMENT-INTERVAL
            MAXIMA::SP-REMOVE-ZERO-ENTRIES-FROM-ROW MAXIMA::$MY_COEFF
            MAXIMA::MUST-REPLACE-MONOM MAXIMA::$TENSOR3
            MAXIMA::CONVERT-POLYNOMIAL-ROW MAXIMA::$SUM5_STANDARD_REP
            MAXIMA::MEMBER-EVEN MAXIMA::OVERLAP-DEGREE
            MAXIMA::FAST-LINSOLVE MAXIMA::SP-SHOW-COLUMN
            MAXIMA::SP-SET-CONSTANTS-COLUMN MAXIMA::$KRONECKER_PRODUCT
            MAXIMA::N+ MAXIMA::NIL-LESSP MAXIMA::KRONECKER-ROW-PRODUCT
            MAXIMA::$SORT_MONO MAXIMA::REMOVE_NTH
            MAXIMA::$SUBTRACT_MONOMIAL MAXIMA::$COEFFICIENT_MATRIX
            MAXIMA::$GENERAL_MATRIX MAXIMA::IN-NTH-POWER-RADICAL
            MAXIMA::DIVIDES MAXIMA::$STANDARD_REP MAXIMA::$FOOD)) 