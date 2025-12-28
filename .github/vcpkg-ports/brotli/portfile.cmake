vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO google/brotli
    REF "v${VERSION}"
    SHA512 7d7b25329a37c4ddb9155c7f30784f3fa6b877a2e09c038bf99b4089ba7da8ec77bcb7ef48276a4c9dd39bce7e4e696e4308e68f7f61ced59e9cfff3bb4e9921
    HEAD_REF master
    PATCHES
        install.patch
        fix-arm-uwp.patch
        pkgconfig.patch
        emscripten.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBROTLI_DISABLE_TESTS=ON
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

# Skip pkgconfig fixup to avoid MSYS2 dependency
# vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
