import os
import shutil
import subprocess

print " "
print "======================================="
print "|  Wearable Lanterns Release Builder  |"
print "======================================="
print " "
user_input = raw_input("Enter the release version: ")

os.chdir("..\\")

# Build the temp directory
print "Creating temp directories..."
tempdir = ".\\tmp\\Data\\"
os.makedirs('./tmp/Data/readmes')
os.makedirs('./tmp/Data/Interface/wearablelanterns')
os.makedirs('./tmp/Data/Interface/exported/widgets/wearablelanterns')
os.makedirs('./tmp/Data/Interface/Translations')
os.makedirs('./tmp/Data/meshes/chesko')
os.makedirs('./tmp/Data/Scripts/Source')
os.makedirs('./tmp/Data/SEQ')
os.makedirs('./tmp/Data/textures/chesko')

# Copy the project files
print "Copying project files..."
with open("./WearableLanterns/WLArchiveManifest.txt") as manifest:
    lines = manifest.readlines()
    for line in lines:
        shutil.copy(".\\WearableLanterns\\" + line.rstrip('\n'), tempdir + line.rstrip('\n'))

# Build the directories
dirname = "./Wearable Lanterns " + user_input + " Release"
if not os.path.isdir(dirname):
    print "Creating new build..."
    os.mkdir(dirname)
else:
    print "Removing old build of same version..."
    shutil.rmtree(dirname)
    os.mkdir(dirname)

os.mkdir(dirname + "/readmes")
os.makedirs(dirname + "/SKSE/Plugins")

# Generate BSA archive
print "Generating BSA archive..."
shutil.copy('./WearableLanterns/Archive.exe', './tmp/Archive.exe')
shutil.copy('./WearableLanterns/WLArchiveBuilder.txt', './tmp/WLArchiveBuilder.txt')
shutil.copy('./WearableLanterns/WLArchiveManifest.txt', './tmp/WLArchiveManifest.txt')
os.chdir("./tmp")
subprocess.call(['./Archive.exe', './WLArchiveBuilder.txt'])
os.chdir("..\\")

# Copy files
shutil.copyfile("./WearableLanterns/Chesko_WearableLantern.esp", dirname + "/Chesko_WearableLantern.esp")
shutil.copyfile("./WearableLanterns/SKSE/Plugins/StorageUtil.dll", dirname + "/SKSE/Plugins/StorageUtil.dll")
shutil.copyfile("./tmp/Chesko_WearableLantern.bsa", dirname + "/Chesko_WearableLantern.bsa")
shutil.copyfile("./WearableLanterns/readmes/wearablelanterns_readme.txt", dirname + "/readmes/wearablelanterns_readme.txt")

# Clean Up
print "Removing temp files..."
shutil.rmtree("./tmp")

# Create release zip
zip_name_ver = user_input.replace(".", "_")
shutil.make_archive("./WearableLanterns_" + zip_name_ver + "_Release", format="zip", root_dir=dirname)
shutil.move("./WearableLanterns_" + zip_name_ver + "_Release.zip", dirname + "/WearableLanterns_" + zip_name_ver + "_Release.zip")
print "Created " + dirname + "/WearableLanterns_" + zip_name_ver + "_Release.zip"
print "Done!"
