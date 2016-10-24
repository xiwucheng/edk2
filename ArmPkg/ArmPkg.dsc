#/** @file
# ARM processor package.
#
# Copyright (c) 2009 - 2010, Apple Inc. All rights reserved.<BR>
# Copyright (c) 2011 - 2015, ARM Ltd. All rights reserved.<BR>
# Copyright (c) 2016, Linaro Ltd. All rights reserved.<BR>
#
#    This program and the accompanying materials
#    are licensed and made available under the terms and conditions of the BSD License
#    which accompanies this distribution. The full text of the license may be found at
#    http://opensource.org/licenses/bsd-license.php
#
#    THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#    WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#
#**/

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = ArmPkg
  PLATFORM_GUID                  = 5CFBD99E-3C43-4E7F-8054-9CDEAFF7710F
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/Arm
  SUPPORTED_ARCHITECTURES        = ARM|AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT

[BuildOptions]
  XCODE:*_*_ARM_PLATFORM_FLAGS  == -arch armv7
  GCC:*_*_ARM_PLATFORM_FLAGS    == -march=armv7-a -mfpu=neon
  # We use A15 to get the Secure and Virtualization extensions
  RVCT:*_*_ARM_PLATFORM_FLAGS  == --cpu Cortex-A15

  RELEASE_*_*_CC_FLAGS  = -DMDEPKG_NDEBUG
  *_*_*_CC_FLAGS  = -DDISABLE_NEW_DEPRECATED_INTERFACES

[LibraryClasses.common]
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
  CacheMaintenanceLib|ArmPkg/Library/ArmCacheMaintenanceLib/ArmCacheMaintenanceLib.inf
  DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
  HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
  TimerLib|MdePkg/Library/BaseTimerLibNullTemplate/BaseTimerLibNullTemplate.inf
  UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
  UefiLib|MdePkg/Library/UefiLib/UefiLib.inf
  DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  UefiRuntimeServicesTableLib|MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf
  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/BasePeCoffGetEntryPointLib.inf

  NetLib|MdeModulePkg/Library/DxeNetLib/DxeNetLib.inf
  UefiHiiServicesLib|MdeModulePkg/Library/UefiHiiServicesLib/UefiHiiServicesLib.inf
  HiiLib|MdeModulePkg/Library/UefiHiiLib/UefiHiiLib.inf

  SemihostLib|ArmPkg/Library/SemihostLib/SemihostLib.inf
  UncachedMemoryAllocationLib|ArmPkg/Library/UncachedMemoryAllocationLib/UncachedMemoryAllocationLib.inf
  DxeServicesTableLib|MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf
  DefaultExceptionHandlerLib|ArmPkg/Library/DefaultExceptionHandlerLib/DefaultExceptionHandlerLib.inf
  CpuExceptionHandlerLib|ArmPkg/Library/ArmExceptionLib/ArmExceptionLib.inf

  CpuLib|MdePkg/Library/BaseCpuLib/BaseCpuLib.inf
  ArmGicLib|ArmPkg/Drivers/ArmGic/ArmGicLib.inf
  ArmGicArchLib|ArmPkg/Library/ArmGicArchLib/ArmGicArchLib.inf
  ArmGenericTimerCounterLib|ArmPkg/Library/ArmGenericTimerPhyCounterLib/ArmGenericTimerPhyCounterLib.inf
  ArmSmcLib|ArmPkg/Library/ArmSmcLib/ArmSmcLib.inf
  ArmDisassemblerLib|ArmPkg/Library/ArmDisassemblerLib/ArmDisassemblerLib.inf
  DmaLib|ArmPkg/Library/ArmDmaLib/ArmDmaLib.inf

  UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
  PerformanceLib|MdePkg/Library/BasePerformanceLibNull/BasePerformanceLibNull.inf
  SerialPortLib|MdePkg/Library/BaseSerialPortLibNull/BaseSerialPortLibNull.inf

  BdsLib|ArmPkg/Library/BdsLib/BdsLib.inf
  FdtLib|EmbeddedPkg/Library/FdtLib/FdtLib.inf

  ShellLib|ShellPkg/Library/UefiShellLib/UefiShellLib.inf
  FileHandleLib|MdePkg/Library/UefiFileHandleLib/UefiFileHandleLib.inf
  SortLib|MdeModulePkg/Library/UefiSortLib/UefiSortLib.inf

  IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf

  ArmLib|ArmPkg/Library/ArmLib/ArmBaseLib.inf
  ArmMmuLib|ArmPkg/Library/ArmMmuLib/ArmMmuBaseLib.inf

[LibraryClasses.common.PEIM]
  HobLib|MdePkg/Library/PeiHobLib/PeiHobLib.inf
  PeimEntryPoint|MdePkg/Library/PeimEntryPoint/PeimEntryPoint.inf
  MemoryAllocationLib|MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllocationLib.inf
  PeiServicesLib|MdePkg/Library/PeiServicesLib/PeiServicesLib.inf
  PeiServicesTablePointerLib|MdePkg/Library/PeiServicesTablePointerLib/PeiServicesTablePointerLib.inf

[LibraryClasses.ARM, LibraryClasses.AARCH64]
  NULL|ArmPkg/Library/CompilerIntrinsicsLib/CompilerIntrinsicsLib.inf

  # Add support for GCC stack protector
  NULL|MdePkg/Library/BaseStackCheckLib/BaseStackCheckLib.inf

[Components.common]
  ArmPkg/Library/ArmCacheMaintenanceLib/ArmCacheMaintenanceLib.inf
  ArmPkg/Library/ArmDisassemblerLib/ArmDisassemblerLib.inf
  ArmPkg/Library/ArmDmaLib/ArmDmaLib.inf
  ArmPkg/Library/BdsLib/BdsLib.inf
  ArmPkg/Library/CompilerIntrinsicsLib/CompilerIntrinsicsLib.inf
  ArmPkg/Library/DebugAgentSymbolsBaseLib/DebugAgentSymbolsBaseLib.inf
  ArmPkg/Library/DebugPeCoffExtraActionLib/DebugPeCoffExtraActionLib.inf
  ArmPkg/Library/DebugUncachedMemoryAllocationLib/DebugUncachedMemoryAllocationLib.inf
  ArmPkg/Library/DefaultExceptionHandlerLib/DefaultExceptionHandlerLib.inf
  ArmPkg/Library/RvdPeCoffExtraActionLib/RvdPeCoffExtraActionLib.inf
  ArmPkg/Library/SemiHostingDebugLib/SemiHostingDebugLib.inf
  ArmPkg/Library/SemiHostingSerialPortLib/SemiHostingSerialPortLib.inf
  ArmPkg/Library/SemihostLib/SemihostLib.inf
  ArmPkg/Library/UncachedMemoryAllocationLib/UncachedMemoryAllocationLib.inf
  ArmPkg/Library/ArmPsciResetSystemLib/ArmPsciResetSystemLib.inf
  ArmPkg/Library/ArmExceptionLib/ArmExceptionLib.inf
  ArmPkg/Library/ArmExceptionLib/ArmRelocateExceptionLib.inf

  ArmPkg/Drivers/CpuDxe/CpuDxe.inf
  ArmPkg/Drivers/CpuPei/CpuPei.inf
  ArmPkg/Drivers/ArmGic/ArmGicDxe.inf
  ArmPkg/Drivers/ArmGic/ArmGicLib.inf
  ArmPkg/Drivers/ArmGic/ArmGicSecLib.inf
  ArmPkg/Drivers/GenericWatchdogDxe/GenericWatchdogDxe.inf
  ArmPkg/Drivers/TimerDxe/TimerDxe.inf

  ArmPkg/Library/ArmGenericTimerPhyCounterLib/ArmGenericTimerPhyCounterLib.inf
  ArmPkg/Library/ArmGenericTimerVirtCounterLib/ArmGenericTimerVirtCounterLib.inf

  ArmPkg/Library/ArmSmcLib/ArmSmcLib.inf
  ArmPkg/Library/ArmSmcLibNull/ArmSmcLibNull.inf
  ArmPkg/Library/ArmHvcLib/ArmHvcLib.inf

  ArmPkg/Filesystem/SemihostFs/SemihostFs.inf

  ArmPkg/Application/LinuxLoader/LinuxLoader.inf

  ArmPkg/Library/ArmMmuLib/ArmMmuBaseLib.inf

  ArmPkg/Drivers/ArmPciCpuIo2Dxe/ArmPciCpuIo2Dxe.inf
  ArmPkg/Library/ArmArchTimerLib/ArmArchTimerLib.inf
  ArmPkg/Library/ArmGicArchLib/ArmGicArchLib.inf
  ArmPkg/Library/ArmGicArchSecLib/ArmGicArchSecLib.inf
  ArmPkg/Library/ArmLib/ArmBaseLib.inf
  ArmPkg/Library/ArmSoftFloatLib/ArmSoftFloatLib.inf
  ArmPkg/Library/DefaultExceptionHandlerLib/DefaultExceptionHandlerLibBase.inf
  ArmPkg/Library/PeiServicesTablePointerLib/PeiServicesTablePointerLib.inf
  ArmPkg/Library/PlatformBootManagerLib/PlatformBootManagerLib.inf

[Components.ARM]
  ArmPkg/Drivers/ArmCpuLib/ArmCortexA8Lib/ArmCortexA8Lib.inf
  ArmPkg/Drivers/ArmCpuLib/ArmCortexA9Lib/ArmCortexA9Lib.inf
  ArmPkg/Drivers/ArmCpuLib/ArmCortexA15Lib/ArmCortexA15Lib.inf

[Components.AARCH64]
  ArmPkg/Drivers/ArmCpuLib/ArmCortexAEMv8Lib/ArmCortexAEMv8Lib.inf
  ArmPkg/Drivers/ArmCpuLib/ArmCortexA5xLib/ArmCortexA5xLib.inf
  ArmPkg/Library/ArmMmuLib/ArmMmuPeiLib.inf
