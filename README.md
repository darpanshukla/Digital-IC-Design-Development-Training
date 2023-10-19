# Digital-Design-Development-Training
This repository contains the verilog development training files and provide workflow at Monk9tech Pvt. Ltd.

Promise: To Digital IC Design from scratch

| Task               | Detailed subtask                                                        |
| ------------------ | ----------------------------------------------------------------------- |
| Design             | Behavioral, Gate level, transistor-level                                |
| Analysis of design | Timing, Power, Performance, Manufacturability, Testability, Reliability |

# Workflow (Design)

0. create a folder for development under designs_n_tb folder

1. create design file: design_module_name.v
```
iverilog design_module_name.v
```
2. create test file: design_module_name_test.v 
this file has one line $dumpfile("dmn.vcd")
```
iverilog -o dmnx design_module_name_test.v
vvp dmnx
open -a gtkwave.app dmn.vcd
```
3. push the design, testbench and results to github repository
```
git add -A
git commit -m "write message describing the changes made or if new desing is made"
git push
```

# Workflow for contributors

1. Clone the repository
```
git clone https://github.com/Monk9Tech/Digital-Design-Development-Training.git
git switch -c "new-branch-contributer_name"
```

2. modify and create new files

3. push to the new-branch-contributer_name
```
git push -u origin new-branch-contributer_name
```



<details>
<summary>

## Verilog design training steps
</summary>
<p>

| No | Design module       | Verilog file name    | Learning objective |
| -- | ------------------- | -------------------- | ------------- |
| 1  | Hello world display | use_display.v        | To understand use of display and monitor |
| 2  | hierarchical modeling concepts | hierarchical_modeling.v | Design methodologies, design at different levels of abstractions |
| 3  | Counter             | counter.v            | To design counter and timer |
| 4  | Inverter            | inverter.v           | i/p o/p Ports, assign data flow statments |
| 5  | Half adder          | half_adder.v         | logic operation statements |
| 6  | Full adder          | full_adder.v         | more input ports | 
| 7  | Full subtractor     | full_subtractor.v    | more diffrent functional logic modules |
| 8  | D flipflop          | D_flipflop.v         | sequential circuit, clock, clock generation, $finish system task |
| 9  | JK flipflop         | JK_flipflop.v        | with more than one input ports |
| 10 | Traffic light controller                   | traffic_light_controller.v             | Timing from clock     |
| 11 | Washing machine controller | 9_washing.. Top module - Microcontroller.v   | Communication between two modules |
| 12 | Elevator controller | 10_lift/lift_controller.v | Top down design, differetn testbench |
| 13 | Substractor | 11_half_substractor, 12_full_substractor | |
| 14 | Multiplier | 13_multiplier | This is a high level behavioral modeling example |
| 15 | Random Access Memory | 14_memory | creating memory |
| 16 | CAN bus protocol | | |
| 17 | GPIO multiplier | | |
| 18 | Voltage regulator | | |
</p>
</details>


<details>
<summary> 

## Advanced development projects
</summary>
<p>

- Coffee machine
- Candy machine dispenser
- SoC
- Microprocessor/Microcontroller
- Digital and analog signal processor
- Graphics processor
- Neural processor
- Nvidia type - GPU
- Neuromorphic processor
- Mixed signal IC
</p>
</details>


# Resources
<details>
<summary> 

## Learning to design
</summary>
<p>

1. Book: Sumir Palnitkar, VLSI Design
2. [Tutorials point](https://www.tutorialspoint.com/vlsi_design/vlsi_design_digital_system.htm)
3. [eSim tutorial](https://spoken-tutorial.org/tutorial-search/?search_foss=eSim&search_language=English)
4. [Zero to ASIC](https://www.zerotoasiccourse.com/course_content/)
5. [VLSI design testing](https://ocw.tudelft.nl/courses/vlsi-test-technology-reliabillity/)
6. [iverilog](https://bleyer.org/icarus/)
</p>
</details>
<details>
<summary> 

## Design online resources
</summary>
<p>

1. [Module definitions given in here](https://www.rfwireless-world.com/Tutorials/)
2. [Github repositories for washing machine in here](https://github.com/yasnakateb)
3. [OpenRAM](https://openram.org/)
[OpenRAM Github link](https://github.com/VLSIDA/OpenRAM)
4. [Github list of all VLSI System Design IP](https://www.vlsisystemdesign.com/ip/)
5. [Mixed Signal SoC design marathon](https://esim.fossee.in/mixed-signal-soc-design-marathon/completed-circuits)
6. [Mixed Signal Circuit Design and Simulation](https://esim.fossee.in/mixed-signal-design-marathon/download/completed-circuit)
7. [Circuit Design and Simulation](https://esim.fossee.in/hackathon/completed-circuits)
8. [VerificationGuide wesite](https://verificationguide.com/)
</p>
</details>

<details>
<summary> 

## Open PDK, EDA and important resource
</summary>

<p>

1. [**Google Open Source EDA tools**](https://foss-eda-tools.googlesource.com/)
2. [VSD FLOW by Kunal Ghosh](https://github.com/kunalg123/vsdflow.git)
3. [Free PDK ](https://vlsiarch.ecen.okstate.edu/flow/)
4. [VLSI and ASIC Technology](https://www.vlsitechnology.org/index.html)
5. [FOSSEE Free/Libre and Open Source Software for Education](https://fossee.in/)
6. [eSim EDA tool](https://esim.fossee.in/)
7. [DIY chip](https://diychip.org/)
8. [chipignite - resources](https://github.com/efabless/chipignite-resources.git)
9. [GTKWave](https://gtkwave.sourceforge.net/)
10. [OpenFPGA](https://openfpga.readthedocs.io/en/master/tutorials/getting_started/compile/)
11. [Opencores IP](https://opencores.org/)
</p>
</details>
<details>
<summary> 

## R. Timothy Edwards's OpenCircuitDesign.com 

</summary>
<p>

A single point for the suite of open-source Electronic Design Automation tools including Magic, qflow, Netgen, IRSIM, PCB and XCircuit.

0. Get efabless account for free.
1. [Main website -  opencircuitdesign](http://opencircuitdesign.com/)
2. [Open_pdks](http://opencircuitdesign.com/open_pdks/index.html)
3. [Magic VLSI Layout tool](http://opencircuitdesign.com/magic/index.html)
4. [His github repos](https://github.com/RTimothyEdwards)
</p>
</details>
<details>
<summary> 

## Caravel, Efabless expedition

</summary>
<p>

1. [Youtube channel](https://youtu.be/MNuoYz_MM-c)
2. [Caravel user project](https://github.com/efabless/caravel_user_project.git)
3. [Caravel Analog projects](https://github.com/efabless/caravel_user_project_analog.git)
4. [Caravel user projects doc](https://caravel-harness.readthedocs.io/en/latest/)
5. [Caravel ](https://github.com/efabless/caravel.git)

</p>
</details>
<details>
<summary> 

## Important resources

</summary>
<p>

1. [VSDOPEN 2022 conference](https://youtu.be/ZeyBiUlsaCE)
2. [VSDOpen](https://www.vlsisystemdesign.com/vsdopen2022/)
3. [RISC-V DIR-V ](https://pib.gov.in/PressReleasePage.aspx?PRID=1820621)
4. [Redwood](https://www.redwoodeda.com/publications)
5. [warp-v.com](https://warp-v.org/)
6. [makerchip](https://makerchip.com/sandbox/?tabs=Courses)
</p>
</details>
<details>
<summary> 

## eSim
</summary>
<p>

1. [eSim brochure](https://spoken-tutorial.org/media/videos/94/eSim-Brochure-English.pdf)

2. [FOSSEE Free/Libre and Open Source Software for Education](https://fossee.in/)

3. [eSim EDA tool](https://esim.fossee.in/)

4. [eSim tutorial](https://spoken-tutorial.org/tutorial-search/?search_foss=eSim&search_language=English)

</p>
</details>
<details>
<summary> 

## Tsung Wei Huang: OpenTimer

</summary>
<p>

1. [Github link for OpenTimer](https://github.com/OpenTimer/OpenTimer.git)
2. [Verilog to routing (VTR)](https://github.com/verilog-to-routing/vtr-verilog-to-routing.git)
   [VTR](https://verilogtorounting.org)
</p>
</details>


<details>
<summary>

## RISC V

</summary>
<p>

1. [RISC V ISA Simulator](https://github.com/riscv-software-src/riscv-isa-sim.git)
2. [pkgs.orgs](https://pkgs.org/)
</p>
</details>
--
[India Semiconductor Mission](https://ism.gov.in/)
