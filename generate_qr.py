# This script generates a QR code containing the script in its entirety.

import segno
import os

def main():
    QR_DIR = 'QRs'
    with open('specs.sh') as f:
        try:
            os.mkdir(QR_DIR)
        except FileExistsError:
            pass        
        generate_qr(f'{QR_DIR}/curl_qr.png','curl https://raw.githubusercontent.com/RealArtsn/mac-specs/main/specs.sh | bash')
        generate_qr(f'{QR_DIR}/full_qr.png', f.read().replace('\n', ';'))

def generate_qr(path, contents, scale=5):
    qr = segno.make_qr(contents)
    qr.save(path, scale=scale)
    print(f'{path} generated.')

main()