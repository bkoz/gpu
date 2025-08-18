#include <Magick++.h> // Include the Magick++ header
#include <iostream>   // For input/output operations

using namespace std;
using namespace Magick;

int main(int argc, char **argv) {

int rows = 256;
int columns = 256;

InitializeMagick(*argv);

unsigned char * gray = new unsigned char[rows * columns];

for (int i = 0; i < rows * columns; i++) {
    gray[i] = static_cast<unsigned char>(i % 256);     // Grayscale value  
    cout << "pixel[" << i << "] = " << (int) gray[i] << endl;
}

cout << "sample pixel = " << (int) gray[256 * 256 - 1] << endl;

// Use ImageMagick++ to create a Blob from the grayscale image data
Blob blob(gray, rows * columns);

Image image(columns, rows, "GRAY", CharPixel, gray);
image.write("gray.png");

}

