# MIPSprocessor
This is a MIPS (Microprocessor without interlocked pipeline stages) made with VHDL in Quartus version 20.1 Lite Edition and ModelSim-Altera.
To run the processor you need to first download the Quartus, especialy the version 20.1 or if you can't find, go for one that is newer. You are going to need ModelSim-Altera, as well.
The project is already setted so you don't need to go through the configurations, just make sure that the EDA tool has the right path. In case you don't know how this are the steps:
Inside the Quartus interface, go to Tools -> Options -> ModelSim-Altera in the EDA Tool collum and find the path for the "win32aloem" folder.
To run the simulation you need to change the option in the window "Taks" to "RTL Simulation", probably is set to "Compilation". 
Press the "RTL Simulation" and wait for the ModelSim tab open. From there you can simulate any way you want or use a premade settings that I created. To find that, click in the top left corner in "file" -> "Load" -> "Macro file" -> "wave.do"
