cmake_minimum_required(VERSION 3.0.0)

project(xES4K_BMK VERSION 0.1 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt5Core)

include(general.cmake)

include_directories(${PROJECT_INCLUDES} ${GCC_ONLY_DIR})

#--- глобальные DEFINE для компилятора по умолчанию и корректной работы модели кода -----------------
add_compile_definitions(MASHINE_002
						BUSTER
						GCC
						__MOD167__
						bdata=
						idata=
						sdata=
						near=
						xhuge=
						far=
						PACK=
						)

#--- exe-файл для десктопа --------------------------------------------------------------------------
add_executable(${PROJECT_NAME} ${SRC_FULL_NAMES} ${HEADERS_FULL_NAMES} ${GCC_ONLY_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_INCLUDES} ${GCC_ONLY_DIR})
target_link_libraries(${PROJECT_NAME} Qt5::Core)

#--- HEX-файл для прошивки микроконтроллера ---------------------------------------------------------
set(uVision_executable c:/Keil_v5/UV4/UV4.exe)
set(uVision_log_file ${PROJECT_SOURCE_DIR}/uVision_log.txt)

add_custom_target(${PROJECT_NAME}_via_Keil
											COMMAND cmake -E echo Starting Keil uVision for ${PROJECT_NAME}_via_Keil building...
											COMMAND ${uVision_executable} -b ${PROJECT_SOURCE_DIR}/xES4K.uvproj -o "${uVision_log_file}" -j0
											COMMAND notepad ${uVision_log_file}
											)

#--- удаление файлов, созданных Keil'ом -------------------------------------------------------------
add_custom_target(clean_${PROJECT_NAME}_Keil_files	COMMAND cmake -E echo Removing files, created by Keil uVision...
													COMMAND cmake -P ${PROJECT_SOURCE_DIR}/remove_Keil_files.cmake
													)
