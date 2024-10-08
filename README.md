# mac-specs
![Screenshot of terminal running script](example.png)
## Overview
This script retrieves system specifications and battery health from the Mac terminal. This script was written for efficient documentation of MacBooks in recovery mode. 

## Usage

This script is intended to be used with `curl` and `bash` to reduce the time and effort spent with each machine. 

`curl https://raw.githubusercontent.com/RealArtsn/mac-specs/main/specs.sh | bash`
## QR Code
In addition, a QR scanner can be used with some models to reduce manual input. The following QR code contains the curl request and pipe to bash:

![QR Code](qr.png "curl https://raw.githubusercontent.com/RealArtsn/mac-specs/main/specs.sh | bash")

## Generating QR Codes
QR codes can be generated with `generate_qr.py`. This python script depends on the `segno` package. `python generate_qr.py` 

## Issues
`curl` has been observed to fail in recovery mode with `curl: (4) A requested feature, protocol or option was not found built-in in this libcurl due to a build-time decision.` on the following models:

**2017 MacBook Pro (A1708)**\
**2017 MacBook Pro (A1706)**