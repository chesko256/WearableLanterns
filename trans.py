import os
import shutil
import subprocess
import codecs
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

def translateValues(vals, lang_code):
    api_key = open('../google_api_secret.txt').read()
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

    translated_values = translateValues(vals, lang[0])
    for dict in translated_values['translations']:
        translated_values_cleaned.append(dict['translatedText'].replace('\ N', '\n').replace('\ n', '\n').replace('\n', '\\n'))
    
    with open('./interface/translations/' + translate_file_name_header + lang[1] + '.txt', mode='wb') as output:
        output.write(codecs.BOM_UTF16_LE)
        for key, value in zip(keys, translated_values_cleaned):
            file_contents += (key + '\t' + value + '\n')
    
        output.write((file_contents.encode('utf-16')))

# Generate translation files
keys = []
values = []
with open('./interface/translations/chesko_wearablelantern_english.txt', 'rb') as f:
    contents = f.read()
    decoded_contents = contents.decode('utf-16').encode('utf-8').split('\r\n')
    for line in decoded_contents:
        split_line = line.split('\t')
        keys.append(split_line[0])
        values.append(split_line[1])

for lang in langs:
    generateTranslationFile(keys, values, lang)
