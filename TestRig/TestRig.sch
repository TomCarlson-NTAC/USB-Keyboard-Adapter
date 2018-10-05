EESchema Schematic File Version 4
LIBS:TestRig-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:AVR-ISP-6 J2
U 1 1 5BA7DFCF
P 3250 5050
F 0 "J2" H 3250 5450 50  0000 L CNN
F 1 "AVR-ISP-6" H 3250 4750 50  0000 L CNN
F 2 "Connector_IDC:IDC-Header_2x03_P2.54mm_Vertical" V 3000 5100 50  0001 C CNN
F 3 " ~" H 1975 4500 50  0001 C CNN
	1    3250 5050
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP4
U 1 1 5BA7E269
P 3150 4350
F 0 "TP4" H 3215 4580 50  0000 C CNN
F 1 "VCC" H 3215 4510 50  0000 C CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 3350 4350 50  0001 C CNN
F 3 "~" H 3350 4350 50  0001 C CNN
	1    3150 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4350 3150 4450
$Comp
L Connector:TestPoint_Probe TP9
U 1 1 5BA7E39E
P 3150 5650
F 0 "TP9" H 3215 5880 50  0000 C CNN
F 1 "GND" H 3215 5810 50  0000 C CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 3350 5650 50  0001 C CNN
F 3 "~" H 3350 5650 50  0001 C CNN
	1    3150 5650
	1    0    0    1   
$EndComp
Wire Wire Line
	3150 5450 3150 5550
Wire Wire Line
	3650 4850 4100 4850
Wire Wire Line
	3650 4950 4100 4950
Wire Wire Line
	3650 5050 4100 5050
Wire Wire Line
	3650 5150 4100 5150
$Comp
L Connector:TestPoint_Probe TP5
U 1 1 5BA7E421
P 4100 4850
F 0 "TP5" H 4250 4900 50  0000 L CNN
F 1 "MISO" H 4450 4900 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 4300 4850 50  0001 C CNN
F 3 "~" H 4300 4850 50  0001 C CNN
	1    4100 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP6
U 1 1 5BA7E584
P 4100 4950
F 0 "TP6" H 4250 5000 50  0000 L CNN
F 1 "MOSI" H 4450 5000 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 4300 4950 50  0001 C CNN
F 3 "~" H 4300 4950 50  0001 C CNN
	1    4100 4950
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP7
U 1 1 5BA7E5A6
P 4100 5050
F 0 "TP7" H 4250 5100 50  0000 L CNN
F 1 "SCK" H 4450 5100 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 4300 5050 50  0001 C CNN
F 3 "~" H 4300 5050 50  0001 C CNN
	1    4100 5050
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP8
U 1 1 5BA7E5C6
P 4100 5150
F 0 "TP8" H 4250 5200 50  0000 L CNN
F 1 "~RST" H 4450 5200 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 4300 5150 50  0001 C CNN
F 3 "~" H 4300 5150 50  0001 C CNN
	1    4100 5150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR03
U 1 1 5BA7E639
P 3000 4350
F 0 "#PWR03" H 3000 4200 50  0001 C CNN
F 1 "VCC" H 3000 4500 50  0000 C CNN
F 2 "" H 3000 4350 50  0001 C CNN
F 3 "" H 3000 4350 50  0001 C CNN
	1    3000 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5BA7E67E
P 3000 5650
F 0 "#PWR04" H 3000 5400 50  0001 C CNN
F 1 "GND" H 3000 5500 50  0000 C CNN
F 2 "" H 3000 5650 50  0001 C CNN
F 3 "" H 3000 5650 50  0001 C CNN
	1    3000 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4350 3000 4450
Wire Wire Line
	3000 4450 3150 4450
Connection ~ 3150 4450
Wire Wire Line
	3150 4450 3150 4550
Wire Wire Line
	3000 5650 3000 5550
Wire Wire Line
	3000 5550 3150 5550
Connection ~ 3150 5550
Wire Wire Line
	3150 5550 3150 5650
Text Label 3700 4850 0    50   ~ 0
MISO
Text Label 3700 4950 0    50   ~ 0
MOSI
Text Label 3700 5050 0    50   ~ 0
SCK
Text Label 3700 5150 0    50   ~ 0
~RST
$Comp
L Connector:USB_B_Micro J1
U 1 1 5BAC8293
P 3150 2550
F 0 "J1" H 2950 3000 50  0000 L CNN
F 1 "USB_B_Micro" H 2950 2900 50  0000 L CNN
F 2 "Connector_USB:USB_Micro-B_Molex-105017-0001" H 3300 2500 50  0001 C CNN
F 3 "~" H 3300 2500 50  0001 C CNN
	1    3150 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5BAC83A7
P 3150 3250
F 0 "#PWR02" H 3150 3000 50  0001 C CNN
F 1 "GND" H 3150 3100 50  0000 C CNN
F 2 "" H 3150 3250 50  0001 C CNN
F 3 "" H 3150 3250 50  0001 C CNN
	1    3150 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2950 3150 3100
Wire Wire Line
	3050 2950 3050 3100
Wire Wire Line
	3050 3100 3150 3100
Connection ~ 3150 3100
Wire Wire Line
	3150 3100 3150 3250
NoConn ~ 3450 2750
$Comp
L power:VBUS #PWR01
U 1 1 5BAC867F
P 3700 2050
F 0 "#PWR01" H 3700 1900 50  0001 C CNN
F 1 "VBUS" H 3700 2200 50  0000 C CNN
F 2 "" H 3700 2050 50  0001 C CNN
F 3 "" H 3700 2050 50  0001 C CNN
	1    3700 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2050 3700 2350
Wire Wire Line
	3700 2350 3450 2350
$Comp
L Connector:TestPoint_Probe TP3
U 1 1 5BAC8811
P 4050 2650
F 0 "TP3" H 4200 2700 50  0000 L CNN
F 1 "USB_D-" H 4400 2700 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 4250 2650 50  0001 C CNN
F 3 "~" H 4250 2650 50  0001 C CNN
	1    4050 2650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP2
U 1 1 5BAC8855
P 4050 2550
F 0 "TP2" H 4200 2600 50  0000 L CNN
F 1 "USB_D+" H 4400 2600 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 4250 2550 50  0001 C CNN
F 3 "~" H 4250 2550 50  0001 C CNN
	1    4050 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2550 4050 2550
Wire Wire Line
	3450 2650 4050 2650
Text Label 3700 2550 0    50   ~ 0
D+
Text Label 3700 2650 0    50   ~ 0
D-
$Comp
L Connector:TestPoint_Probe TP1
U 1 1 5BABE374
P 4050 2350
F 0 "TP1" H 4200 2400 50  0000 L CNN
F 1 "VBUS" H 4400 2400 50  0000 L CNN
F 2 "Connector_Pin:Pin_D1.0mm_L10.0mm" H 4250 2350 50  0001 C CNN
F 3 "~" H 4250 2350 50  0001 C CNN
	1    4050 2350
	1    0    0    -1  
$EndComp
Connection ~ 3700 2350
Wire Wire Line
	3700 2350 4050 2350
$Comp
L Mechanical:MountingHole MH?
U 1 1 5BABE71B
P 7000 3750
F 0 "MH?" H 7000 3950 50  0000 C CNN
F 1 "MountingHole" H 7000 3875 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7000 3750 50  0001 C CNN
F 3 "~" H 7000 3750 50  0001 C CNN
	1    7000 3750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH?
U 1 1 5BABE992
P 7600 3750
F 0 "MH?" H 7600 3950 50  0000 C CNN
F 1 "MountingHole" H 7600 3875 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7600 3750 50  0001 C CNN
F 3 "~" H 7600 3750 50  0001 C CNN
	1    7600 3750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH?
U 1 1 5BABEB7A
P 7000 4200
F 0 "MH?" H 7000 4400 50  0000 C CNN
F 1 "MountingHole" H 7000 4325 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7000 4200 50  0001 C CNN
F 3 "~" H 7000 4200 50  0001 C CNN
	1    7000 4200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH?
U 1 1 5BABEB80
P 7600 4200
F 0 "MH?" H 7600 4400 50  0000 C CNN
F 1 "MountingHole" H 7600 4325 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7600 4200 50  0001 C CNN
F 3 "~" H 7600 4200 50  0001 C CNN
	1    7600 4200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH?
U 1 1 5BABEDD6
P 7000 4700
F 0 "MH?" H 7000 4900 50  0000 C CNN
F 1 "MountingHole" H 7000 4825 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7000 4700 50  0001 C CNN
F 3 "~" H 7000 4700 50  0001 C CNN
	1    7000 4700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH?
U 1 1 5BABEDDC
P 7600 4700
F 0 "MH?" H 7600 4900 50  0000 C CNN
F 1 "MountingHole" H 7600 4825 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7600 4700 50  0001 C CNN
F 3 "~" H 7600 4700 50  0001 C CNN
	1    7600 4700
	1    0    0    -1  
$EndComp
$EndSCHEMATC