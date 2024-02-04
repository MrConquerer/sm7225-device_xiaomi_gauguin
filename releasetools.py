# Import the common module that contains some utility functions for OTA packages
import common
# Import the re module that provides regular expression operations
import re
# Import the os module that provides operating system dependent functionality
import os
# Import the Path class from the pathlib module that provides object-oriented path manipulation
from pathlib import Path

# Define a function that performs the full OTA installation
def FullOTA_InstallEnd(info):
  # Call the OTA_InstallEnd function with the info parameter
  OTA_InstallEnd(info)

# Define a function that performs the incremental OTA installation
def IncrementalOTA_InstallEnd(info):
  # Call the OTA_InstallEnd function with the info parameter
  OTA_InstallEnd(info)

# Define a function that adds an image file to the OTA package and extracts it to the device
def AddImage(info, basename, dest):
  # Assign the basename parameter to a variable called name
  name = basename
  # Use os.path.join to construct the path to the image file in the input zip
  image_path = os.path.join("IMAGES", basename)
  # Convert the image_path to a Path object
  image_path = Path(image_path)
  # Use the with statement to handle opening and closing the file
  with info.input_zip.open(image_path) as image_file:
    # Read the data from the image file
    data = image_file.read()
    # Write the data to the output zip with the name
    common.ZipWriteStr(info.output_zip, name, data)
    # Append an extra command to the updater-script to extract the file to the destination
    info.script.AppendExtra(f'package_extract_file("{name}", "{dest}");')

# Define a function that performs the common tasks for both full and incremental OTA installation
def OTA_InstallEnd(info):
  # Print a message to the screen
  info.script.Print("Patching firmware images...")
  # Call the AddImage function with the info parameter and the names and paths of the dtbo and vbmeta images
  AddImage(info, "dtbo.img", "/dev/block/bootdevice/by-name/dtbo")
  AddImage(info, "vbmeta.img", "/dev/block/bootdevice/by-name/vbmeta")
