set(keil_files)
set(KEIL_BUILD_DIR d:/Projects/xES4K_CMake/general_build/xES4K_firmware)
set(KEIL_PROJ_FILE_DIR d:/Projects/xES4K_CMake/xES4K_BMK)

set(keil_files)
file(GLOB keil_files ${KEIL_BUILD_DIR}/*)

set(bak_files)
file(GLOB bak_files ${KEIL_PROJ_FILE_DIR}/*.bak)
list(APPEND keil_files ${bak_files})

set(htm_files)
file(GLOB htm_files ${KEIL_PROJ_FILE_DIR}/*.htm)
list(APPEND keil_files ${htm_files})

set(opt_files)
file(GLOB opt_files ${KEIL_PROJ_FILE_DIR}/*.uvopt)
list(APPEND keil_files ${opt_files})

set(guiopt_files)
file(GLOB guiopt_files ${KEIL_PROJ_FILE_DIR}/*.uvgui.*)
list(APPEND keil_files ${guiopt_files})

if(keil_files)
	file(REMOVE ${keil_files})
endif()
