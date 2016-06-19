import os
import shutil
import subprocess
import codecs
import requests
from googleapiclient.discovery import build

translate_file_name_header = 'chesko_wearablelantern_'
langs = [['cs', 'czech'], 
         ['fr', 'french'], 
         ['de', 'german'], 
         ['it', 'italian'], 
         ['ja', 'japanese'], 
         ['pl', 'polish'], 
         ['ru', 'russian'], 
         ['es', 'spanish']]

def yandexTranslateValues(vals, lang_code):
    api_key = open('./yandex_api_secret.txt').read()
    
    return_vals = []
    for val in vals:
        r = requests.get('https://translate.yandex.net/api/v1.5/tr.json/translate?key=' + api_key + '&text=' + val + '&lang=en-' + lang_code)
        rv = r.json()['text'][0]
        print rv.encode('utf8')
        return_vals.append(rv)

    return return_vals


def translateValues(vals, lang_code):
    api_key = open('./google_api_secret.txt').read()
    service = build('translate', 'v2', developerKey=api_key)

    translation_output = (service.translations().list(
      source='en',
      target=lang_code,
      q=vals
      ).execute())

    return translation_output

def generateTranslationFile(keys, vals, lang):
    print("Generating " + lang[1] + " MCM translation file...")
    file_contents = ''
    translated_values_cleaned = []

    translated_values = yandexTranslateValues(vals, lang[0])
    for v in translated_values:
        translated_values_cleaned.append(v.replace('\ N', '\n').replace('\ n', '\n').replace('\n', '\\n'))
    
    with open('./tmp/Data/interface/translations/' + translate_file_name_header + lang[1] + '.txt', mode='wb') as output:
        output.write(codecs.BOM_UTF16_LE)
        for key, value in zip(keys, translated_values_cleaned):
            file_contents += (key + '\t' + value + '\n')
    
        output.write((file_contents.encode('utf-16')))

print " "
print "======================================="
print "|  Wearable Lanterns Release Builder  |"
print "======================================="
print " "
user_input = raw_input("Enter the release version: ")

os.chdir("..\\")

if os.path.isdir('./tmp'):
    print "Removing old temp directory..."
    shutil.rmtree("./tmp")

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

# Generate translation files
keys = []
values = []
with open('./WearableLanterns/interface/translations/chesko_wearablelantern_english.txt', 'rb') as f:
    contents = f.read()
    decoded_contents = contents.decode('utf-16').encode('utf-8').split('\r\n')
    for line in decoded_contents:
        split_line = line.split('\t')
        keys.append(split_line[0])
        values.append(split_line[1])

for lang in langs:
    generateTranslationFile(keys, values, lang)

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

# Generate translation files
# get a list of keys
# get a list of strings to translate
# for each language, translate
# write the files

# Generate BSA archive
print "Generating BSA archive..."
shutil.copy('./WearableLanterns/Archive.exe', './tmp/Archive.exe')
shutil.copy('./WearableLanterns/WLArchiveBuilder.txt', './tmp/WLArchiveBuilder.txt')
shutil.copy('./WearableLanterns/WLArchiveManifest.txt', './tmp/WLArchiveManifest.txt')
# Append the translation file entries to the temporary manifest.
with open('./tmp/WLArchiveManifest.txt', 'a') as manifest:
    for lang in langs:
        manifest.write('Interface\\Translations\\' + translate_file_name_header + lang[1] + '.txt\r\n')
os.chdir("./tmp")
subprocess.call(['./Archive.exe', './WLArchiveBuilder.txt'])
os.chdir("..\\")

# Copy files
shutil.copyfile("./WearableLanterns/Chesko_WearableLantern.esp", dirname + "/Chesko_WearableLantern.esp")
shutil.copyfile("./WearableLanterns/SKSE/Plugins/StorageUtil.dll", dirname + "/SKSE/Plugins/StorageUtil.dll")
shutil.copyfile("./tmp/Chesko_WearableLantern.bsa", dirname + "/Chesko_WearableLantern.bsa")
shutil.copyfile("./WearableLanterns/readmes/wearablelanterns_readme.txt", dirname + "/readmes/wearablelanterns_readme.txt")
shutil.copyfile("./WearableLanterns/readmes/wearablelanterns_changelog.txt", dirname + "/readmes/wearablelanterns_changelog.txt")
shutil.copyfile("./WearableLanterns/readmes/wearablelanterns_license.txt", dirname + "/readmes/wearablelanterns_license.txt")

# Clean Up
print "Removing temp files..."
shutil.rmtree("./tmp")

# Create release zip
zip_name_ver = user_input.replace(".", "_")
shutil.make_archive("./WearableLanterns_" + zip_name_ver + "_Release", format="zip", root_dir=dirname)
shutil.move("./WearableLanterns_" + zip_name_ver + "_Release.zip", dirname + "/WearableLanterns_" + zip_name_ver + "_Release.zip")
print "Created " + dirname + "/WearableLanterns_" + zip_name_ver + "_Release.zip"
print "Done!"
