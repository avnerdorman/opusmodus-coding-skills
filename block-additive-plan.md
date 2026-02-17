Based on the sources, particularly the definition of "process music" as a rigorous execution of a rule 1, 2 and Opusmodus's design as a Lisp-based environment for manipulating musical lists 3, 4, you can build this function using a technique called Binary Masking.
Since Block Additive process is defined as "replacing rests by beats" within a "predetermined and unchanging time frame" 5, your function needs to separate the rhythm from the pitch and apply a gradually changing mask (a list of 0s and 1s) to the rhythm.
Here is the logic and structural design for an Opusmodus function to achieve this.
1. The Core Logic: Binary Masking
In Opusmodus (OMN), you can represent the "Block" as a fixed list of lengths. To simulate Reich's process of "gradual assembly" 5, you do not change the measure length; you change the state of the events within it.
* The Input: A melody (Pitches + Lengths).
* The Grid: The number of total events (e.g., 12 eighth notes).
* The Mask: A list of integers where 1 = Note and 0 = Rest.
* The Process: Your function generates a sequence of lists, starting with (0 0 0 ...) and ending with (1 1 1 ...).
2. Designing the Function (gen-block-additive)
You can define a function that accepts your melody and a "build method."
Step A: AnalysisThe function first "de-constructs" your input melody into two lists:
1. Pitch List: The notes (e.g., (c4 d4 e4 ...))
2. Length List: The rhythmic values.
Step B: Index Generation (The "Creative" Part)This is where you implement the "creative ways" you requested. The function needs to decide the order in which rests turn into notes. Since the sources note that block additive music can be represented by "positive integers" (beat-classes) 6, you can manipulate the indices mathematically.
* Linear (Reich style): The function generates indices (0 1 2 3...). The music builds from left to right 7.
* Symmetric (Outside-In): You requested "symmetric" generation. The function would generate indices by alternating the start and end: (0 11 1 10 2 9...).
* Mod 12 / Odd-Even: As hinted by the integer analysis of Clapping Music 6, you could build all even numbered beats first (0 2 4...), then fill in the odds (1 3 5...).
* Random Accumulation: The function uses rnd-order to shuffle the indices (5 0 11 3...). This creates a non-linear build-up within the fixed block.
Step C: The Loop (The Build)The function loops through the number of steps you want (e.g., 12 steps for a 12-note pattern).
* Iteration 1: Activates index 0. (Result: 1 note, 11 rests).
* Iteration 2: Activates indices 0, 11. (Result: 2 notes, 10 rests).
* ...and so on.
Step D: Re-Synthesis (OMN Output)Finally, the function applies these masks to the original Length List. In Opusmodus, if you multiply a length by -1 (or use a specific rest-function), it becomes a rest.
* If the mask is 1, keep the length.
* If the mask is 0, make the length a rest.
3. Extending to Phasing
Once your function returns the "built" block, the sources suggest the next logical step in this genre is Canon/Phasing 5.
You can create a secondary function (or add an argument to the main one) that takes the final built block and applies Rotation.
* Concept: "The pattern rotates one note to the left" 8.
* Implementation: In Opusmodus, you can use list rotation functions on your generated material to create a second voice that is displaced by one beat (an eighth note), mirroring the structure of Clapping Music 9.
Summary of Workflow for Your App/Script
To replicate the "sophistication and elegance" 10 of this music in Opusmodus:
1. Define a 12-note melody (representing the 12/8 measure of Clapping Music 6).
2. Call your gen-block-additive function.
3. Pass the argument :type 'symmetric (or 'random).
4. The function returns a list of measures showing the melody emerging from silence based on that mathematical rule.
5. Export to MusicXML using Opusmodus's native export features 11, 12.