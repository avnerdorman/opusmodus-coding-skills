Opusmodus                                                                text-to-letters   1

text-to-letters text
[Function]

Arguments and Values:
text                      a string list of text.


Description:

This function explodes words into single letters.

(text-to-letters '("Opusmodus"))
=> (o p u s m o d u s)


Examples:

With sublists:

(text-to-letters '(("To be, or not to be,")
                     ("that is the question")))
=> (((t o) (b e) (o r) (n o t) (t o) (b e))
      ((t h a t) (i s) (t h e) (q u e s t i o n)))

With the function FLATTEN it’s possible to make a alphabetical symbol list suitable
structuring a collage of variables titled with symbols.

(flatten
 (text-to-letters '(("To be, or not to be,")
                    ("that is the question"))))
=> (t o b e o r n o t t o b e t h a t i s t h e q u e s t i o n)
Opusmodus                                                text-to-letters   2

Poem by Paul Valéry.

(setf poem '("Ce toit tranquille, où marchent des colombes,
             Entre les pins palpite, entre les tombes;
             Midi le juste y compose de feux
             La mer, la mer, toujours recommencée
             O récompense après une pensée
             Qu'un long regard sur le calme des dieux!"))

(setf text (text-to-letters poem))
=> ((c e) (t o i t) (t r a n q u i l l e) (o ù) (m a r c h e n t)
    (d e s) (c o l o m b e s) (e n t r e) (l e s) (p i n s)
    (p a l p i t e) (e n t r e) (l e s) (t o m b e s) (m i d i)
    (l e) (j u s t e) (y) (c o m p o s e) (d e) (f e u x) (l a)
    (m e r) (l a) (m e r) (t o u j o u r s) (r e c o m m e n c é e)
    (o) (r é c o m p e n s e) (a p r è s) (u n e) (p e n s é e)
    (q u u n) (l o n g) (r e g a r d) (s u r) (l e) (c a l m e)
    (d e s) (d i e u x))
