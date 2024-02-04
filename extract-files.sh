#!/usr/bin/env bash

# This script extracts proprietary blobs from an Android device or a system dump
# It requires the device name, vendor name, and source of the blobs as arguments
# It also supports some optional flags to customize the extraction
# It uses the extract_utils.sh helper script to perform the extraction
# It patches some of the extracted files with sed
# It generates the makefiles for the vendor repository

# Exit if the script is sourced
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    return
fi

# Exit on error
set -e

# Exit on unset variable
set -u

# Exit on error in pipeline
set -o pipefail

# Load extract_utils and do some sanity checks
declare -r MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

declare -r ANDROID_ROOT="${MY_DIR}/../../.."

declare -r HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [[ ! -f "${HELPER}" ]]; then
    printf '%s\n' "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
declare -r CLEAN_VENDOR=true

declare -r KANG=
declare -r SECTION=

# Parse arguments using getopts
while getopts "nks:" opt; do
    case "${opt}" in
        n | no-cleanup )
                CLEAN_VENDOR=false
                ;;
        k | kang )
                KANG="--kang"
                ;;
        s | section )
                SECTION="${OPTARG}"
                CLEAN_VENDOR=false
                ;;
        * )
                printf '%s\n' "Invalid option: ${opt}"
                exit 1
                ;;
    esac
done

# Shift the positional parameters to get the remaining arguments
shift $((OPTIND - 1))

# Check if the device name, vendor name, and source are provided
if [[ "$#" -ne 3 ]]; then
    printf '%s\n' "Usage: ${0} [-n|--no-cleanup] [-k|--kang] [-s|--section SECTION] DEVICE VENDOR SOURCE"
    exit 1
fi

# Assign the arguments to variables
declare -r DEVICE="gauguin"
declare -r VENDOR="xiaomi"
declare -r SRC="$3"

# Use adb as default source
if [[ -n "${SRC}" ]]; then
    SRC="adb"
fi

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

# Extract proprietary files
extract "${MY_DIR}"/proprietary-files.txt "${SRC}" \
        "${KANG}" --section "${SECTION}"

declare -r DEVICE_BLOB_ROOT="${ANDROID_ROOT}"/vendor/"${VENDOR}"/"${DEVICE}"/proprietary

# Define a function to patch a file with sed
patch_file() {
    local -r file="$1"; shift
    for patch in "$@"; do
        # Use the -n option to suppress the output
        sed -i -n "${patch}" "${file}"
    done
}

# Setup makefiles
"${MY_DIR}"/setup-makefiles.sh
