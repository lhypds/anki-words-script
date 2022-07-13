import io
import re

# read
file = io.open('C:\\Users\\LIU\\Dropbox\\Words\\202206\\202206.txt', mode='r', encoding='utf-8')
lines = file.readlines()
file.close()

# replace
count = 0
new_lines = []
for line in lines:
    # ignore empty line or no Chinese/Japanese(CJK) answer line
    if len(re.findall(r'[\u31c0-\u9fff]+', line)) == 0: continue
    
    # format line
    # 31C0—31EF CJK Strokes
    # 31F0—31FF Katakana Phonetic Extensions
    # 3200—32FF Enclosed CJK Letters and Months
    # 3300—33FF CJK Compatibility
    # 3400—4DBF CJK Unified Ideographs Extension A
    # 4DC0—4DFF Yijing Hexagram Symbols
    # 4E00—9FFF CJK Unified Ideographs 
    firstCjkChar = re.findall(r'[\u31c0-\u9fff]+', line)[0]
    line = line.replace(' ' + firstCjkChar, ' : ' + firstCjkChar)

    # print line
    count += 1
    print("{}: {}".format(count, line.strip()))
    new_lines.append(line)

# write
file = io.open('C:\\Users\\LIU\\Dropbox\\Words\\202206\\202206_formated.txt', mode='w', encoding='utf-8')
file.writelines(new_lines)
file.close()
