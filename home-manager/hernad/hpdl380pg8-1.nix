{ inputs, outputs, ... }:
{
  imports = [
    ../global
  ];

}


#[root@hpdl380pg8-1:~]# iommu_check 
#IOMMU Group 0 	00:00.0 Host bridge [0600]: Intel Corporation Xeon E5/Core i7 DMI2 [8086:3c00] (rev 07)
#IOMMU Group 1 	00:01.0 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 1a [8086:3c02] (rev 07)
#IOMMU Group 2 	00:01.1 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 1b [8086:3c03] (rev 07)
#IOMMU Group 3 	00:02.0 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2a [8086:3c04] (rev 07)
#IOMMU Group 4 	00:02.1 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2b [8086:3c05] (rev 07)
#IOMMU Group 5 	00:02.2 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2c [8086:3c06] (rev 07)
#IOMMU Group 6 	00:02.3 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2d [8086:3c07] (rev 07)
#IOMMU Group 7 	00:03.0 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3a in PCI Express Mode [8086:3c08] (rev 07)
#IOMMU Group 8 	00:03.1 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3b [8086:3c09] (rev 07)
#IOMMU Group 9 	00:03.2 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3c [8086:3c0a] (rev 07)
#IOMMU Group 10 	00:03.3 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3d [8086:3c0b] (rev 07)
#IOMMU Group 11 	00:04.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 0 [8086:3c20] (rev 07)
#IOMMU Group 12 	00:04.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 1 [8086:3c21] (rev 07)
#IOMMU Group 13 	00:04.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 2 [8086:3c22] (rev 07)
#IOMMU Group 14 	00:04.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 3 [8086:3c23] (rev 07)
#IOMMU Group 15 	00:04.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 4 [8086:3c24] (rev 07)
#IOMMU Group 16 	00:04.5 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 5 [8086:3c25] (rev 07)
#IOMMU Group 17 	00:04.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 6 [8086:3c26] (rev 07)
#IOMMU Group 18 	00:04.7 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 7 [8086:3c27] (rev 07)
#IOMMU Group 19 	00:05.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Address Map, VTd_Misc, System Management [8086:3c28] (rev 07)
#IOMMU Group 20 	00:05.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Control Status and Global Errors [8086:3c2a] (rev 07)
#IOMMU Group 21 	00:05.4 PIC [0800]: Intel Corporation Xeon E5/Core i7 I/O APIC [8086:3c2c] (rev 07)
#IOMMU Group 22 	00:11.0 PCI bridge [0604]: Intel Corporation C600/X79 series chipset PCI Express Virtual Root Port [8086:1d3e] (rev 05)


#IOMMU Group 23 	00:1a.0 USB controller [0c03]: Intel Corporation C600/X79 series chipset USB2 Enhanced Host Controller #2 [8086:1d2d] (rev 05)
#IOMMU Group 24 	00:1c.0 PCI bridge [0604]: Intel Corporation C600/X79 series chipset PCI Express Root Port 1 [8086:1d10] (rev b5)
#IOMMU Group 25 	00:1c.7 PCI bridge [0604]: Intel Corporation C600/X79 series chipset PCI Express Root Port 8 [8086:1d1e] (rev b5)

#IOMMU Group 26 	00:1d.0 USB controller [0c03]: Intel Corporation C600/X79 series chipset USB2 Enhanced Host Controller #1 [8086:1d26] (rev 05)
#IOMMU Group 27 	00:1e.0 PCI bridge [0604]: Intel Corporation 82801 PCI Bridge [8086:244e] (rev a5)
#IOMMU Group 28 	00:1f.0 ISA bridge [0601]: Intel Corporation C600/X79 series chipset LPC Controller [8086:1d41] (rev 05)

# sata disk
#IOMMU Group 28 	00:1f.2 IDE interface [0101]: Intel Corporation C600/X79 series chipset 4-Port SATA IDE Controller [8086:1d00] (rev 05)

#IOMMU Group 29 	01:00.0 System peripheral [0880]: Hewlett-Packard Company Integrated Lights-Out Standard Slave Instrumentation & System Support [103c:3306] (rev 05)
#IOMMU Group 29 	01:00.1 VGA compatible controller [0300]: Matrox Electronics Systems Ltd. MGA G200EH [102b:0533]
#IOMMU Group 29 	01:00.2 System peripheral [0880]: Hewlett-Packard Company Integrated Lights-Out Standard Management Processor Support and Messaging [103c:3307] (rev 05)
#IOMMU Group 29 	01:00.4 USB controller [0c03]: Hewlett-Packard Company Integrated Lights-Out Standard Virtual USB Controller [103c:3300] (rev 02)

# diskovi
#IOMMU Group 30 	02:00.0 RAID bus controller [0104]: Hewlett-Packard Company Smart Array Gen8 Controllers [103c:323b] (rev 01)

# sve network kartice jedna iommu grupa
#IOMMU Group 31 	03:00.0 Ethernet controller [0200]: Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe [14e4:1657] (rev 01)
#IOMMU Group 31 	03:00.1 Ethernet controller [0200]: Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe [14e4:1657] (rev 01)
#IOMMU Group 31 	03:00.2 Ethernet controller [0200]: Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe [14e4:1657] (rev 01)
#IOMMU Group 31 	03:00.3 Ethernet controller [0200]: Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe [14e4:1657] (rev 01)

# 10g intel kartica
#IOMMU Group 32 	04:00.0 Ethernet controller [0200]: Intel Corporation 82599ES 10-Gigabit SFI/SFP+ Network Connection [8086:10fb] (rev 01)

#IOMMU Group 33 	1f:08.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link 0 [8086:3c80] (rev 07)
#IOMMU Group 34 	1f:08.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 0 [8086:3c83] (rev 07)
#IOMMU Group 35 	1f:08.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 0 [8086:3c84] (rev 07)
#IOMMU Group 36 	1f:09.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link 1 [8086:3c90] (rev 07)
#IOMMU Group 37 	1f:09.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 1 [8086:3c93] (rev 07)
#IOMMU Group 38 	1f:09.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 1 [8086:3c94] (rev 07)
#IOMMU Group 39 	1f:0a.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 0 [8086:3cc0] (rev 07)
#IOMMU Group 39 	1f:0a.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 1 [8086:3cc1] (rev 07)
#IOMMU Group 39 	1f:0a.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 2 [8086:3cc2] (rev 07)
#IOMMU Group 39 	1f:0a.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 3 [8086:3cd0] (rev 07)
#IOMMU Group 40 	1f:0b.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Interrupt Control Registers [8086:3ce0] (rev 07)
#IOMMU Group 40 	1f:0b.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Semaphore and Scratchpad Configuration Registers [8086:3ce3] (rev 07)
#IOMMU Group 41 	1f:0c.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
#IOMMU Group 41 	1f:0c.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
#IOMMU Group 41 	1f:0c.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
#IOMMU Group 41 	1f:0c.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 0 [8086:3cf4] (rev 07)
#IOMMU Group 41 	1f:0c.7 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 System Address Decoder [8086:3cf6] (rev 07)
#IOMMU Group 42 	1f:0d.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
#IOMMU Group 42 	1f:0d.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
#IOMMU Group 42 	1f:0d.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
#IOMMU Group 42 	1f:0d.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 1 [8086:3cf5] (rev 07)
#IOMMU Group 43 	1f:0e.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Processor Home Agent [8086:3ca0] (rev 07)
#IOMMU Group 43 	1f:0e.1 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 Processor Home Agent Performance Monitoring [8086:3c46] (rev 07)
#IOMMU Group 44 	1f:0f.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Registers [8086:3ca8] (rev 07)
#IOMMU Group 45 	1f:0f.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller RAS Registers [8086:3c71] (rev 07)
#IOMMU Group 46 	1f:0f.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 0 [8086:3caa] (rev 07)
#IOMMU Group 47 	1f:0f.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 1 [8086:3cab] (rev 07)
#IOMMU Group 48 	1f:0f.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 2 [8086:3cac] (rev 07)
#IOMMU Group 49 	1f:0f.5 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 3 [8086:3cad] (rev 07)
#IOMMU Group 50 	1f:0f.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 4 [8086:3cae] (rev 07)
#IOMMU Group 51 	1f:10.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 0 [8086:3cb0] (rev 07)
#IOMMU Group 52 	1f:10.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 1 [8086:3cb1] (rev 07)
#IOMMU Group 53 	1f:10.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 0 [8086:3cb2] (rev 07)
#IOMMU Group 54 	1f:10.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 1 [8086:3cb3] (rev 07)
#IOMMU Group 55 	1f:10.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 2 [8086:3cb4] (rev 07)
#IOMMU Group 56 	1f:10.5 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 3 [8086:3cb5] (rev 07)
#IOMMU Group 57 	1f:10.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 2 [8086:3cb6] (rev 07)
#IOMMU Group 58 	1f:10.7 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 3 [8086:3cb7] (rev 07)
#IOMMU Group 59 	1f:11.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DDRIO [8086:3cb8] (rev 07)
#IOMMU Group 60 	1f:13.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 R2PCIe [8086:3ce4] (rev 07)
#IOMMU Group 60 	1f:13.1 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 Ring to PCI Express Performance Monitor [8086:3c43] (rev 07)
#IOMMU Group 60 	1f:13.4 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 QuickPath Interconnect Agent Ring Registers [8086:3ce6] (rev 07)
#IOMMU Group 60 	1f:13.5 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 0 Performance Monitor [8086:3c44] (rev 07)
#IOMMU Group 60 	1f:13.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 1 Performance Monitor [8086:3c45] (rev 07)
