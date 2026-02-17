Opusmodus                                                                         tonnetz-structure   1

tonnetz-structure number
[Function]

Arguments and Values:
number                    a number or list of numbers (Tonnetz label), 1 to 12.


Description:

The TONNETZ-STRUCTURE function returns an intervallic content of a given Tonnetz
number (label). This function is a companion to the TONNETZ function.

In musical tuning and harmony, the Tonnetz (German: tone-network) is a conceptual lattice
diagram representing tonal space rst described by Leonhard Euler in 1739. Various visual
representations of the Tonnetz can be used to show traditional harmonic relationships in
European classical music.

In Opusmodus there are 12 Tonnetz structures labelled by a number and by an intervallic
content of the composite chord. The intervallic content is a number of semitones associated
with the different interval axis. As you will notice each of the intervallic content sum up to
12:

1 (1 1 10)
2 (1 2 9)
3 (1 3 8)
4 (1 4 7)
5 (1 5 6)
6 (2 2 8)
7 (2 3 7)
8 (2 4 6)
9 (2 5 5)
10 (3 3 6)
11 (3 4 5)
12 (4 4 4)
                           fi
Opusmodus                                               tonnetz-structure   2

Examples:

The intervallic content of the Tonnetz labelled 11:

(tonnetz-structure 11)
=> (3 4 5)

Names:

(get-interval-name (tonnetz-structure 11))
=> (minor-third major-third perfect-fourth)

The intervallic content of the Tonnetz 11 and 8:

(tonnetz-structure '(11 8))
=> ((3 4 5) (2 4 6))

The intervallic content of all Tonnetz numbers:

(tonnetz-structure '(1 2 3 4 5 6 7 8 9 10 11 12))
=> ((1 1 10) (1 2 9) (1 3 8) (1 4 7) (1 5 6) (2 2 8)
    (2 3 7) (2 4 6) (2 5 5) (3 3 6) (3 4 5) (4 4 4))


Relevant Functions
---------------------------------------------------------
TONNETZ

Relevant Examples
---------------------------------------------------------
Documentation/3. How-to/Tonnetz/
