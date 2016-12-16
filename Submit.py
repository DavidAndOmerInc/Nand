# To use this script use python3 run this script from "nand2tetris/projects/".
# Fill the next variable with your and your partner details.

PAIR = True  # Change to 'False' if you work alone.

# First
FIRST_USER_NAME = "david"
FIRST_FULL_NAME = "David Wies"
FIRST_ID = "311511802"
FIRST_EMAIL = "david.weis@mail.huji.ac.il"

# Second
SECOND_USER_NAME = "omer"
SECOND_FULL_NAME = "Omer Shacham"
SECOND_ID = "20403472"
SECOND_EMAIL = "omer.shacham@mail.huji.ac.il"

ends = {'.py', '.jack'}  # Write the ends of the type of files that you want to submit here.

submit = {'Assembler', 'Makefile'}

dont_submit = {}  # Write the names of files you dont want to submit here.

# Note: This isn't an offical program and may contain bugs or create the files in different format
# than the course staff want. The use of this program is on your own responseility.

# Create by David Wies


# -------------------------------------------- Don't touch the code ---------------------------------------------

import os
import sys
import tarfile


def to_add(filename):
    for end_file in ends:
        if filename.endswith(end_file) and not dont_add(filename):
            return True
    return filename in submit


def dont_add(filename):
    for name in dont_submit:
        if filename == name:
            return True
    return False


def run_over_folder(address, to_do_readme, indentation=0):
    folder_files = ''
    to_submit = ''
    files = os.listdir(address)
    for file_name in files:
        if os.path.isdir(address + '/' + file_name):
            inner_files, inner_submit = run_over_folder(address + '/' + file_name, to_do_readme, indentation + 1)
            if len(inner_submit) > 0:
                folder_files += '\t' * indentation + file_name + ':\n'
                folder_files += inner_files
                to_submit += inner_submit
        elif to_add(file_name):
            if to_do_readme:
                description = input('Enter description for ' + file_name + ' (enter "--skip" to skip the file): ')
                if description == '--skip':
                    continue
                folder_files += '\t' * indentation + file_name + ' - ' + description + '\n'
            to_submit += address + '/' + file_name + ' '
    return folder_files, to_submit


if __name__ == "__main__":
    ex_number = input('Which project do you want to submit? ')
    while not ex_number.isdigit():
        if ex_number == 'exit':
            exit(0)
        ex_number = input("The given input wasn't number, please enter the number of"
                          ' the project that you want to submit? ')
    if len(ex_number) == 1:
        ex = '0' + str(ex_number)
    else:
        ex = str(ex_number)
    do_readme = not (os.path.isfile(ex + '/README'))
    readme = None
    if not do_readme:
        overwrite_readme = input('Do you want to overwrite the readme? (Enter "yes" or "no") ')
        if overwrite_readme == 'yes':
            do_readme = True
    if do_readme:
        try:
            readme = open(ex + '/README', 'w')
        except FileNotFoundError:
            print('There is no project with that name.', file=sys.stderr)
            exit(-1)
        if PAIR:
            readme.write(FIRST_USER_NAME + ', ' + SECOND_USER_NAME + '\n')
            readme.write('===============================================================================' + '\n')
            readme.write(FIRST_FULL_NAME + ', ID ' + FIRST_ID + ', ' + FIRST_EMAIL + '\n')
            readme.write(SECOND_FULL_NAME + ', ID ' + SECOND_ID + ', ' + SECOND_EMAIL + '\n')
        else:
            readme.write(FIRST_USER_NAME + '\n')
            readme.write('===============================================================================' + '\n')
            readme.write(FIRST_FULL_NAME + ', ID ' + FIRST_ID + ', ' + FIRST_EMAIL + '\n')
        readme.write('===============================================================================' + '\n' + '\n')
        readme.write('                           Project ' + ex_number + ' - An HDL File' + '\n')
        readme.write('                           -----------------------\n\n\n')
        readme.write('Submitted Files\n---------------\n')
        readme.write('README - This file.\n')
    files_to_readme, files_to_submit = run_over_folder(ex, do_readme)
    if do_readme:
        readme.write(files_to_readme)
        remark = input('Enter the remarks separated by hash tag: ')
        if len(remark) > 0:
            readme.write('\n\nRemarks\n-------\n')
            remarks = remark.split('#')
            for remark in remarks:
                readme.write('* ' + remark + '\n')
        readme.close()
    os.chdir(ex)
    tar = tarfile.open('project' + ex_number + '.tar', 'w')
    files_to_submit = files_to_submit.split(' ')[:-1]
    for file in files_to_submit:
        tar.add(file[len(ex) + 1:])
    tar.add('README')
    tar.close()
