# This script generates a QR code containing the script in its entirety.

import segno
import os, re

def main():
    QR_DIR = 'QRs'
    with open('specs.sh') as f:
        try:
            os.mkdir(QR_DIR)
        except FileExistsError:
            pass
        full_script = f.read()
        golf_script = re.sub(r';;*', ';', re.sub(r'#.*', '', full_script).replace('\\\n', ' ').replace('\n', ';').replace('then;', 'then').replace('else;', 'else'))
        # with open('golf.sh', 'w') as g:
        #     g.write(golf_script)
        generate_qr(f'{QR_DIR}/curl_qr.png','curl https://raw.githubusercontent.com/RealArtsn/mac-specs/main/specs.sh | bash')
        generate_qr(f'{QR_DIR}/full_qr.png', golf_script)

def generate_qr(path, contents, scale=5):
    qr = segno.make_qr(contents)
    qr.save(path, scale=scale)
    print(f'{path} generated.')

main()