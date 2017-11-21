#------------------------
# Project Version
#------------------------

# Retrieve version from header file
set(PSVR_VERSION_HEADER_FILE "${ROOT_DIR}/src/psvrservice/Service/ServiceVersion.h")

file(STRINGS ${PSVR_VERSION_HEADER_FILE} PSVR_VERSION_PARTS
  REGEX "^#define[ \t]+PSVR_SERVICE_VERSION_(PRODUCT|MAJOR|PHASE|MINOR|RELEASE|HOTFIX)[ \t]+[0-9a-z]+$")
  
# Verify version parts
string(REGEX MATCH "PSVR_SERVICE_VERSION_PRODUCT[ \t]+[0-9a-z]+" PSVR_VERSION_PRODUCT  ${PSVR_VERSION_PARTS})
string(REGEX MATCH "PSVR_SERVICE_VERSION_MAJOR[ \t]+[0-9a-z]+" PSVR_VERSION_MAJOR  ${PSVR_VERSION_PARTS})
string(REGEX MATCH "PSVR_SERVICE_VERSION_MINOR[ \t]+[0-9a-z]+" PSVR_VERSION_MINOR  ${PSVR_VERSION_PARTS})
string(REGEX MATCH "PSVR_SERVICE_VERSION_HOTFIX[ \t]+[0-9a-z]+" PSVR_VERSION_HOTFIX  ${PSVR_VERSION_PARTS})

if(NOT PSVR_VERSION_PRODUCT 
    OR NOT PSVR_VERSION_MAJOR 
    OR NOT PSVR_VERSION_MINOR 
    OR NOT PSVR_VERSION_HOTFIX)
  message(FATAL_ERROR "Unable to retrieve project version from ${PSVR_VERSION_HEADER_FILE}")
endif()

# Extract version numbers
string(REGEX REPLACE "PSVR_SERVICE_VERSION_PRODUCT[ \t]+([0-9a-z]+)" "\\1" PSVR_VERSION_PRODUCT  ${PSVR_VERSION_PRODUCT})
string(REGEX REPLACE "PSVR_SERVICE_VERSION_MAJOR[ \t]+([0-9a-z]+)" "\\1" PSVR_VERSION_MAJOR  ${PSVR_VERSION_MAJOR})
string(REGEX REPLACE "PSVR_SERVICE_VERSION_MINOR[ \t]+([0-9a-z]+)" "\\1" PSVR_VERSION_MINOR  ${PSVR_VERSION_MINOR})
string(REGEX REPLACE "PSVR_SERVICE_VERSION_HOTFIX[ \t]+([0-9a-z]+)" "\\1" PSVR_VERSION_HOTFIX  ${PSVR_VERSION_HOTFIX})

set(PSVR_VERSION_STRING "${PSVR_VERSION_PRODUCT}.${PSVR_VERSION_MAJOR}.${PSVR_VERSION_MINOR}.${PSVR_VERSION_HOTFIX}")

message(STATUS "Project version: ${PSVR_VERSION_STRING}")