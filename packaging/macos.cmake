# Package generator for macOS (.app in a DragNDrop DMG).
#
# Selected by default on macOS (see CMakeLists.txt "Packaging" section).
# Requires the app to be built with Homebrew dependencies (see README.md 12.1.4);
# the resulting DMG contains ImPPG.app linked against the Homebrew dylibs,
# so it runs on any Mac with Homebrew-installed (or equivalent) libraries.
# Notarization/signing, if desired, must be done separately with
# codesign/notarytool (an Apple Developer certificate is required).
set(CPACK_GENERATOR "DragNDrop")
set(CPACK_DMG_FORMAT "UDBZ")
set(CPACK_DMG_VOLUME_NAME "ImPPG")
set(CPACK_PACKAGE_VERSION_MAJOR ${IMPPG_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${IMPPG_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${IMPPG_VERSION_SUBMINOR})
set(CPACK_PACKAGE_FILE_NAME "imppg-${IMPPG_VERSION_MAJOR}.${IMPPG_VERSION_MINOR}.${IMPPG_VERSION_SUBMINOR}-macos")
set(CPACK_PACKAGE_CONTACT "Filip Szczerek <ga.software@yahoo.com>")
set(CPACK_PACKAGE_VENDOR "Filip Szczerek <ga.software@yahoo.com>")
set(CPACK_PACKAGE_DESCRIPTION "Image Post-Processor")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Image Post-Processor")
# CPack's normal CMake install step runs the Makefile preinstall target, which
# depends on ALL and would recursively invoke the automatic DMG target.
set(CPACK_INSTALL_CMAKE_PROJECTS "")
set(CPACK_INSTALLED_DIRECTORIES "${CMAKE_BINARY_DIR}/ImPPG.app;ImPPG.app")
include(CPack)
