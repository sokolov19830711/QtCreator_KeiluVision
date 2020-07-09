#--- папка с исходниками и заголовками, которые используются и компилятором GCC, и компилятором KEIL
set(COMMON_SOURCES_DIR ${PROJECT_SOURCE_DIR}/src/common)

set(PROJECT_INCLUDES
	${COMMON_SOURCES_DIR}
	${COMMON_SOURCES_DIR}/avar_dump
	${COMMON_SOURCES_DIR}/CAN
	${COMMON_SOURCES_DIR}/HEXbyCAN
	${COMMON_SOURCES_DIR}/RealMon
	${COMMON_SOURCES_DIR}/sr_load_hex
	${COMMON_SOURCES_DIR}/sr_Plates
	${COMMON_SOURCES_DIR}/sr_STRUCT_xES4K
	${COMMON_SOURCES_DIR}/sr_Types
	)
#--- рабочий каталог uVision, в который копируются/переименовываются файлы *.cpp и работает компилятор Keil

set(KEIL_DIR d:/Projects/xES4K_CMake/general_build/xES4K_firmware)

#--- список общих исходников *.cpp, которые используются
#--- и компилятором GCC, и компилятором KEIL
#--- Добавлять исходнки сюда и в папку ${COMMON_SOURCES_DIR}
set(SRC_SHORT_NAMES
	ADC_ext.cpp
	ADC_in.cpp
	Avar.cpp
	BS.cpp
	Bv_Tokopr.cpp
	Bvv.cpp
	calcF.cpp
	CAP.cpp
	DiagLink.cpp
	Indikator.cpp
	inOut_BUTP.cpp
	inZnBUO.cpp
	IZMV_b.cpp
	KrVent.cpp
	Main.cpp
	Main_BUO.cpp
	Main_BUTP.cpp
	New_IzmV.cpp
	outZnBUO.cpp
	Periphery.cpp
	PosTabl2Impl.cpp
	PSN.cpp
	Regul_all.cpp
	Spi.cpp
	Tayga.cpp
#	Test_con.cpp
	Tormoj.cpp
	avar_dump/Avar_Dump.cpp
	avar_dump/SysPackTime.cpp
	CAN/can_drv.cpp
	CAN/KanalSW.cpp
#	HEXbyCAN/HEXbyCAN.c
	RealMon/RS232.cpp
#	sr_load_hex/LoadHEX.c
#	sr_load_hex/SROM.c
	sr_STRUCT_xES4K/signal_xES4K_sbit.cpp
	)

set(SRC_FULL_NAMES)
foreach(current_src_short IN LISTS SRC_SHORT_NAMES)
	set(current_full_name ${COMMON_SOURCES_DIR}/${current_src_short})
	list(APPEND SRC_FULL_NAMES ${current_full_name})
endforeach()

#--- список общих заголовочников *.h, которые используются
#--- и компилятором GCC, и компилятором KEIL
#--- Добавлять исходнки сюда и в папку ${COMMON_SOURCES_DIR}

set(HEADERS_SHORT_NAMES
	ADC_ext.h
	ADC_in.h
	Avar.h
	BS.h
	Bv_Tokopr.h
	Bvv.h
	CAN/KanalSW.h
	CAN/Tabl_AB.h
	CAN/can_V3.h
	CAN/can_drv.h
	CAP.h
	CONSTANT.H
	DiagLink.h
#	HEXbyCAN/HEXbyCAN.H
	IZMV_b.H
	Indikator.h
	KrVent.h
	Main.h
	Main_BUO.h
	Main_BUTP.h
	New_IzmV.h
	PSN.h
	Periphery.h
	PosTabl2Impl.h
	RealMon/RS232.H
	RealMon/Tabl.h
	Regul_all.h
	Spi.h
	Tayga.h
#	Test_con.h
	Tormoj.h
	avar_dump/AvarKadr_xES4K.h
	avar_dump/AvarStruct.h
	avar_dump/Avar_Dump.h
	avar_dump/SysPackTime.h
	calcF.h
	dataTyagi.h
	inOutZnach.h
	inOut_BUTP.h
	inZnBUO.h
	outZnBUO.h
	sr_Plates/BMK033.h
	sr_Plates/BPI042.h
	sr_Plates/BRV030.h
	sr_Plates/BV032.h
	sr_Plates/BVV057.h
	sr_Plates/BVV129.h
	sr_STRUCT_xES4K/DiagData.h
	sr_STRUCT_xES4K/PosTabl2.h
	sr_STRUCT_xES4K/ags9_def.h
	sr_STRUCT_xES4K/bpi_diag_struct.h
	sr_STRUCT_xES4K/signal_xES4K_sbit.h
	sr_STRUCT_xES4K/signals_xES4K.h
	sr_STRUCT_xES4K/signals_xES4K_MK.h
	sr_STRUCT_xES4K/struct_BRPD_004.h
	sr_STRUCT_xES4K/struct_xES4K.h
	sr_STRUCT_xES4K/usavp_control_xES4K.h
	sr_Types/MySeries.h
	sr_Types/MyStruct.h
	sr_Types/MyTemplates.h
	sr_Types/MyTypes.h
	sr_Types/UsedCPU.h
	sr_Types/readme.txt
#	sr_load_hex/LoadHEX.H
#	sr_load_hex/SROM.H
#	sr_load_hex/vt100smpl.h
	)

set(HEADERS_FULL_NAMES)
foreach(current_h_short IN LISTS HEADERS_SHORT_NAMES)
	set(current_full_name ${COMMON_SOURCES_DIR}/${current_h_short})
	list(APPEND HEADERS_FULL_NAMES ${current_full_name})
endforeach()

#--- список исходников и зоголовочных, которые используются только компилятором GCC

set(GCC_ONLY_DIR ${PROJECT_SOURCE_DIR}/src/gcc_only)
set(GCC_ONLY_SOURCES
					${GCC_ONLY_DIR}/regst10F269.h
					${GCC_ONLY_DIR}/regst10F269.cpp
					${GCC_ONLY_DIR}/sbit.h
					${GCC_ONLY_DIR}/INTRINS.h
					${GCC_ONLY_DIR}/ABSACC.h
					${GCC_ONLY_DIR}/MAC.h
					${GCC_ONLY_DIR}/main.cpp
					)

