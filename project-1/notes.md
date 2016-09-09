Project 1 Notes
=================

IDF - Intermediate Distribution Frame
----------------------------------------

### Location/Connection
Must be within 90ft of whatever computer you are servicing with copper cable

Use single mode fiber to connect between IDFs and MDFs

### Fire Control
1. Prevention
2. Supression
  * don't sprinkle the room
  * use electronic safe foam
3. Detection

Must use plenum cable for any cable running through the drop ceiling to prevent toxic
fumes from being spread thought the building if there is a fire


Power
------
UPS allows cleans AC electricity by storing it in batteries and gives a clean stream of
energy to your server infrastructure

Based on the wattage that you are using, contact vendor for this info.

Grounding and bonding cable goes to a 10ft spike in the ground to ground the entire system

PC power and cooling is the best PSU vendor on the planet

Get electricians in to get high power circuitry and 30 Amp twist locks. Around $45,000 to
rewire the circuits


HVAC and Humidity Control
-------------------------

Air conditioning must be redundant

Handles the humidity in the room

Use BTUs to figure out what you need to air condition. Take Watts to BTUS and buy an Air
conditioner with 30% more tonnage than you need and then buy a second one.


Server Hardware Requirements
----------------------------

1. Identify your needs
  * Certain amounts of ghz
  * Certain amounts of ram
  * Depends on what you want to do with your network

Physical Security
------------------

Don't let people just plug in random flash drives to your network without having the
correct security

Don't throw away your drives or store it unencrypted.

Doors must be rated secure, fireproof, no outside wall, no outside wall, or in a basement


Virtual Desktop Interface
--------------------------

All the work gets done on a server and the laptops are simply a thin-client.

Must have a certain level of requirements to be able to have each user work


Virtual Servers
----------------
Replaced having a server for every type of process, 80% of the time it would be idle

Cost a lot of money in having to have each seperate computer

### VMWare (rainbow)
* VMWare
* Citrix
* Microsoft

Runs on a tiny Linux kernel, called a hyper-visor

Allows you to start partitioning your server virtually
* you can give # cpus and ram to any computer with any OS on it
* creates a pool of all of the hardware for all of the virtual machines


SAN - Storage Area Network
----
Storage between network and storage

Nexus switch can handle the high load of the data

Blade servers connect to one chassis with # amount of PSUs, network ports, and you can
slide blades with CPUs and RAM. This allows for only two redundant cables to go to the
NEXUS switch.




Kernel
-------
Takes shell commands and translates it to the correct instruction call

Drivers allow it to talk to specific hardware that it can't account for


R.A.I.D
-----------
Redundant array of independent disks

Lose the space of one hard drive to get multiple hard disks to work at the same time and
replace a drive when it fails.

RAID 50 stripes the stripes and then mirrors it.

Important Considerations
------------------------
REDUNDANCY REDUNDANCY REDUNDANCY

NEVER HAVE A SINGLE POINT OF FAILURE

TELL PEOPLE THE RAMIFICATIONS OF THE REDUNDANCY. FIND CONSULTING MONEY.

Pay someone to do server maintenance, you can't be an expert at something you do once a
year.




Firmware
---------
Software on an EEPROM

Flashing rewrites the EEPROM
















