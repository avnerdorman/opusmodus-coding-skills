Opusmodus                                                                    power-of-two   1

power-of-two n
[Function]

Arguments and Values:
n                        an integer.


Description:

Exponents are shorthand for repeated multiplication of the same thing by itself. For instance,
the shorthand for multiplying three copies of the number 5 is shown on the right-hand side of
the "equals" sign in (5)(5)(5) = 53. The "exponent", being 3 in this example, stands for
however many times the value is being multiplied. The thing that's being multiplied, being 5
in this example, is called the "base".

This process of using exponents is called "raising to a power", where the exponent is the
"power". The expression "53" is pronounced as " ve, raised to the third power" or " ve to
the third". There are two specially-named powers: "to the second power" is generally
pronounced as "squared", and "to the third power" is generally pronounced as "cubed". So
"53" is commonly pronounced as " ve cubed"Power-of-two will return 2^n.

(power-of-two 7)
=> 128

Calculate 2^-2:

(power-of-two -2)
=> 0.25


Examples:
(power-of-two 7)
=> 128

Let's build a micro function to generate a list of 'POWER-OF-TWO'.

(defun power-of-many (n)
 (prog (out)
  (dotimes (i n)
   (setf out (append out (list (power-of-two i)))))
 (return out)))
                             fi
                                           fi
                                                                              fi
