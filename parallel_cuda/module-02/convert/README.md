# Use CUDA to convert an RGB image to grayscale.

```console
$ ./convertRGBToGrey.exe 
```

```console
Parsing CLI arguments
inputImage: choco-lab.jpg outputImage: grey.jpg currentPartId: test threadsPerBlock: 64
Reading Image From File
Rows: 256 Columns: 256
Allocating GPU device memory
Copying from Host to Device
Executing kernel
grid = 256, 1, 1
block = 1, 64, 4
Copying from Device to Host
Deallocating GPU device memory
Cleaning CUDA device
CPU converting image file to grayscale
Comparing actual and test grayscale pixel arrays
meanImagePixelDifference: 0.000000 scaledMeanDifferencePercentage: 0.000000
Mean difference percentage: 0
coder@e8cf4af059cc:~/project$ ls
choco-lab.jpg        convertRGBToGrey.exe  grey.jpg  output.txt  run.sh
convertRGBToGrey.cu  convertRGBToGrey.hpp  Makefile  README.md   sloth.png
coder@e8cf4af059cc:~/project$ ./convertRGBToGrey.exe
Parsing CLI arguments
inputImage: choco-lab.jpg outputImage: grey.jpg currentPartId: test threadsPerBlock: 64
Reading Image From File
Rows: 256 Columns: 256
Allocating GPU device memory
Copying from Host to Device
Executing kernel
grid = 256, 1, 1
block = 1, 64, 4
Copying from Device to Host
Deallocating GPU device memory
Cleaning CUDA device
CPU converting image file to grayscale
Comparing actual and test grayscale pixel arrays
meanImagePixelDifference: 0.000000 scaledMeanDifferencePercentage: 0.000000
Mean difference percentage: 0
```