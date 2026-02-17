Opusmodus                                                                      make-binary   1

make-binary sequence &key test
[Function]

Arguments and Values:
sequence                an integer list.
test                    :prime, :odd, :even, or :fib. The default is :prime.


Description:

The function MAKE-BINARY returns a list of binaries from a list of numbers with a given
test condition. It returns 0 if the condition is false, or 1 if the condition is true.

The default test is :prime (numbers):

(make-binary (rndn 16 0 23))
=> (0 1 1 0 1 0 0 0 1 1 1 0 0 1 0 0)


Examples:
(setf ulam (ulam-spiral-array 16))
=> #2A((226 225 224 223 222 221 220 219 218 217 216 215 214 213 212 211)
        (227 170 169 168 167 166 165 164 163 162 161 160 159 158 157 210)
        (228 171 122 121 120 119 118 117 116 115 114 113 112 111 156 209)
        (229 172 123 82 81 80 79 78 77 76 75 74 73 110 155 208)
        (230 173 124 83 50 49 48 47 46 45 44 43 72 109 154 207)
        (231 174 125 84 51 26 25 24 23 22 21 42 71 108 153 206)
        (232 175 126 85 52 27 10 9 8 7 20 41 70 107 152 205)
        (233 176 127 86 53 28 11 2 1 6 19 40 69 106 151 204)
        (234 177 128 87 54 29 12 3 4 5 18 39 68 105 150 203)
        (235 178 129 88 55 30 13 14 15 16 17 38 67 104 149 202)
        (236 179 130 89 56 31 32 33 34 35 36 37 66 103 148 201)
        (237 180 131 90 57 58 59 60 61 62 63 64 65 102 147 200)
        (238 181 132 91 92 93 94 95 96 97 98 99 100 101 146 199)
        (239 182 133 134 135 136 137 138 139 140 141 142 143 144 145 198)
        (240 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197)
        (241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256)
      )
Opusmodus                                                             make-binary   2

(setf ulam-binary (make-binary ulam))
=> ((0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1)
    (1 0 0 0 1 0 0 0 1 0 0 0 0 0 1 0)
    (0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0)
    (1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0)
    (0 1 0 1 0 0 0 1 0 0 0 1 0 1 0 0)
    (0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0)
    (0 0 0 0 0 0 0 0 0 1 0 1 0 1 0 0)
    (1 0 1 0 1 0 1 1 1 0 1 0 0 0 1 0)
    (0 0 0 0 0 1 0 1 0 1 0 0 0 0 0 0)
    (0 0 0 0 0 0 1 0 0 0 1 0 1 0 1 0)
    (0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 0)
    (0 0 1 0 0 0 1 0 1 0 0 0 0 0 0 0)
    (0 1 0 0 0 0 0 0 0 1 0 0 0 1 0 1)
    (1 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0)
    (0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1)
    (1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0))

In the following examples we use CIRCLE-RHYTHM-PLOT function to visualise the
results:

(circle-rhythm-plot ulam :points 16)
Opusmodus                                             make-binary   3

(circle-rhythm-plot ulam-binary :points 16)




(setf num (rndn 16 0 23))
=> (14 11 11 21 13 22 10 8 5 19 19 18 18 13 4 22)

(circle-rhythm-plot (make-binary num :test :prime))
Opusmodus                                            make-binary   4

(circle-rhythm-plot (make-binary num :test :odd))




(circle-rhythm-plot (make-binary num :test :even))
Opusmodus                                           make-binary   5

(circle-rhythm-plot (make-binary num :test :fib))




(circle-rhythm-plot (zigzag-array 16) :points 16)
Opusmodus                                                                      make-binary   6

(circle-rhythm-plot (make-binary (zigzag-array 16)) :points 16)




Let’s create a short percussion score with a visualisation for each instrument. Please note we
are using the RND-SAMPLE in our expressions, therefore each evaluation creates a different
result.

(setf ulam (make-binary (ulam-spiral-array 16)))
(setf bd (make-omn :length (binary-map (rnd-sample 4 ulam) 's)
                   :pitch '(b1)))

(circle-rhythm-plot bd :points 16)
Opusmodus                                                make-binary   7

(setf hb1 (make-omn
           :length (binary-map (rnd-sample 4 ulam) 's)
           :pitch '(c4)))

(circle-rhythm-plot hb1 :points 16)




(setf lb1 (make-omn
           :length (binary-map (rnd-sample 4 ulam) 's)
           :pitch '(cs4)))

(circle-rhythm-plot lb1 :points 16)
Opusmodus                                                make-binary   8

(setf ohc (make-omn
           :length (binary-map (rnd-sample 4 ulam) 's)
           :pitch '(eb4)))

(circle-rhythm-plot ohc :points 16)




(setf hb2 (make-omn
           :length (binary-map (rnd-sample 4 ulam) 's)
           :pitch '(c4)))

(circle-rhythm-plot hb2 :points 16)
Opusmodus                                                make-binary   9

(setf lb2 (make-omn
           :length (binary-map (rnd-sample 4 ulam) 's)
           :pitch '(cs4)))

(circle-rhythm-plot hb1 :points 16)




(setf mhc (make-omn
           :length (binary-map (rnd-sample 4 ulam) 's)
           :pitch '(d4)))

(circle-rhythm-plot mhc :points 16)
Opusmodus                                               make-binary   10

(setf lc (make-omn
          :length (binary-map (rnd-sample 4 ulam) 's)
          :pitch '(e4)))

(circle-rhythm-plot lc :points 16)




Preview Score:
(ps 'gm :rhy (list bd hb1 hb2 lb1 lb2 ohc mhc lc)
    :tempo 112)
