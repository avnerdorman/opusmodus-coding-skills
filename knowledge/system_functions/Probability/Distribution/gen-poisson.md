     Opusmodus                                                                               gen-poisson      1

     gen-poisson n k lambda
     [Function]

     Arguments and Values:
     n                        The total value to scale the generated values.
     k                        A list of values representing the number of events.
     lambda                   (Number): This is the average rate of occurrence for the event. It represents
                              the expected number of times an event happens within the interval.
                              It should be a positive number.


     Description:

     In probability theory and statistics, the Poisson distribution is a discrete probability
     distribution that expresses the probability of a given number of events occurring in a xed
     interval of time or space if these events occur with a known constant mean rate and
     independently of the time since the last event. It is named after French mathematician
     Siméon Denis Poisson. The Poisson distribution can also be used for the number of events in
     other speci ed interval types such as distance, area, or volume.


     Examples:
     (gen-poisson 195 '(0 1 2 3 4 5) 0.6)
     => (107 64 19 4 1 0)

     To nd out the probability values used in the Poisson distribution result from above, use the
     POISSON-PMF function:

     (poisson-pmf '(0 1 2 3 4 5) 0.6)
     => (0.5488116 0.329287 0.09878609 0.019757219 0.002963583 3.5562998E-4)
fi
         fi
                                                                                             fi
