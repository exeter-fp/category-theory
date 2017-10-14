(in-package :cl-user)
(defpackage :kleisli
  (:use :cl))

(in-package :kleisli)



(defun to-upper (str)
  (values (string-upcase str)
          "to-upper"))

(defun split-on-next (str splits)
  "Split on the next character in the str that is a member of splits"
  (let ((pos (position-if (lambda (chr) (member chr splits)) str)))
    (if pos
      (values (subseq str 0 pos)
              (subseq str (1+ pos)))
      (values str nil))))

(defun words (str)
  (labels ((rec (str accum)
             (multiple-value-bind (word remainder)
                 (split-on-next str
                                '(#\Space #\Tab #\Newline #\Return))
               (if remainder
                   (rec remainder (cons word accum))
                   (reverse (cons word accum))))))
    (rec str nil)))

(defun to-words (str)
  (values (words str)
          "to-words"))

#+ponk(defun process (str)
  (multiple-value-bind (p1 log1)
      (to-upper str)
    (multiple-value-bind (p2 log2)
        (to-words p1)
      (values p2 (concatenate 'string log1 " " log2))))) ()

(defun is-even (num)
  (values (evenp num)
          "is-even"))

(defun negate (b)
  (values (not b)
          "not so!"))


(defun >==> (m1 m2)
  (lambda (p)
    (multiple-value-bind (p1 log1)
        (funcall m1 p)
      (multiple-value-bind (p2 log2)
          (funcall m2 p1)
        (values p2 (concatenate 'string log1 " " log2))))))


(defun identity* (a)
  "identity is already defined"
  (values a ""))

(defun process (str)
  (funcall (>==> #'to-upper #'to-words) str))





;; Partial functions

(defclass optional ()
  ((is-valid :initarg :is-valid
             :reader is-valid)
   (value :initarg :value
          :reader value)))

(defmethod print-object ((o optional) str)
  (with-accessors ((is-valid is-valid) 
                   (value value)) o
    (if is-valid
        (format str "Valid : ~A" value)
        (format str "Invalid"))))

(defun valid (value)
  "Make a valid instance of optional"
  (make-instance 'optional :is-valid t :value value))

(defun invalid ()
  "Make an invalid instance of optional"
  (make-instance 'optional :is-valid nil))

(defun safe-root (x) 
  (if (plusp x)
      (valid (sqrt x))
      (invalid)))

(defun identity* (x)
  x)

(defun compose (m1 m2)
  (lambda (p)
    (let ((p1 (funcall m1 p)))
      (if (valid p1)
          (funcall m2 (value p1))
          (invalid)))))

(defun safe-reciprocal (x)
  (if (zerop x)
      (invalid)
      (valid (/ 1 x))))

(defun safe-root-reciprocal (x)
  (funcall (compose #'safe-reciprocal #'safe-root) x))
