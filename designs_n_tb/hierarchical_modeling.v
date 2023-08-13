/* In this module we present 
a. Design Methodologies and 
b. Level of Abstractions.  

Two tyoes of design methodologies is considered in the VLSI Design
1. Top down design methodology: 
    Define top-level block and then identify sub blocks necessary to build
    the top-level block. Further devide the sub-blocks to reach to leaf cells.
2. Bottom up design methodology:
    First we identify the building blocks that are available to us, then we build 
    bigger cells (macro cells) using these building blocks. These cells are use
    for high-levels blocks until we build the top-level block in the design.

Typically, a combination of top-down and bottom-up design methodology is used.


You will see the four levels of abstractions of a SINGLE MODULE
1. Behavioral
2. Data flow
3. Gate level
4. Switch level 

Design architects: 
    - define the specification of the top-level block
Logic designers: 
    - how design should be structured by breaking up the functionality
    into blocks and sub-blocks
Circuit designers: 
    - Designing optimized circuits for leaf-level cells
    - Build higher-level cells by using these leaf cells


Conclusion: How the design meets from different designers
    - Switch-level circuit designers: 
        :-: create library of leaf cells by using switches
    - Logic-level designers:
        :-: top-down untill all modules are defined in terms of leaf cells.


A hierarchical modeling concepts in Verilog is module.

A module is the basic building block in Verilog.

Format of module is:

module <module_name> (<module_terminal_list>);
.
.
.
endmodule
*/


/*
B. Levels of abstraction:

Verilog is both behavioral and a structural language. 
Internals of each module can be defined at four levels of abstraction,
depending on the needs of the design.

The module behaves identically with the external environment irrespective
of the level of abstraction at which the module is described.

The internals of the module are hidden from the environment. Thus, the
level of abstraction to describe a module can be changed without any change
in the environment.

    1. Behavioral or algorithmic level
        A module can be implemented in terms of the desired design algorithm
        without concern for the hardware implementation details.
    
    2. Dataflow level
        At this level the module is designed by specifying the data flow.
        The designer is aware of how data flows between hardware registers 
        and how the data is processed in the design.

    3. Gate level
        The module is implemented in terms of logic gates and interconnections
        between these gates.
        Similar to gate-level logic diagram

    4. Swaitch level
        Lowest level of abstraction provided by Verilog.
        A module can be implemented in terms of switches, storage nodes and 
        the interconnections.

Bold, underline to
Verilog allows the design to mix and match all four levels of abstractions 
in a design.
In digital design community, RTL - Verilog Behavior + Dataflow constructs



*/


/* Instances

<modulename> instance_name (<set of signals);

nesting of modules is illegal.
*/

/* Stimulus or Test bench

Different test benches can be used to thoroughly test the design block.

Two style of stimulus:

1. Stimulus instantiate the design, and then checks the output

2. A top-level dummy module instantiate both the design and stimulus. The stimulus block interacts with the 
design block only through the interface.
*/
