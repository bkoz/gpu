//
// Convert a raw rgba image file to jpeg.
//
// magick -size 100x50 -depth 16 rgba:memory_image.raw output_file.jpg
//
#include <Magick++.h>
#include <iostream>
#include <vector> // For simulating a memory buffer

using namespace std;
using namespace Magick;

int main(int argc, char **argv) {
    // Initialize the ImageMagick library
    InitializeMagick(*argv);

    // 1. Simulate having raw image data in memory
    // Create a small, simple image and store its raw pixel data
    // in a buffer. In a real application, this data could be from a sensor,
    // a network stream, a file loaded into memory, etc.
    const size_t width = 100;
    const size_t height = 50;
    
    // Each pixel is RGBA, 8 bytes per pixel
    vector<unsigned short> rawPixels(width * height * 4); 

    // Fill the buffer with some simple pixel data (e.g., a blue rectangle)
    for (size_t i = 0; i < width * height; ++i) {
        rawPixels[i * 4 + 0] = 65535; // Red
        rawPixels[i * 4 + 1] = 25535; // Green
        rawPixels[i * 4 + 2] = 65535; // Blue
        rawPixels[i * 4 + 3] = 65535; // Alpha (fully opaque)
    }

    cout << "rawPixels.size() = " << rawPixels.size() << " sizeof(ushort) = " << sizeof(unsigned short) <<  endl;

    // 2. Create the Blob from the memory pointer and size
    // The Blob constructor takes a pointer to the data and its length.
    // In this case, use the data() method of std::vector to get a pointer
    // to the underlying buffer and its size() for the length.
    Blob rawImageBlob(rawPixels.data(), rawPixels.size() * sizeof(unsigned short));

    // 3. Create an Image object from the Blob
    // When reading raw pixel data, specify the image
    // dimensions (size) and the pixel format (magick, or color map)
    // since the raw data itself doesn't contain this information.
    Image image;
    try {
        image.size(Geometry(width, height));
	// Specify the pixel format (Red, Green, Blue, Alpha)
        image.magick("RGBA"); 
        image.read(rawImageBlob);
	// Convert the image from rgba to jpeg.
	image.magick("JPEG"); 

        // At this point, the 'image' object contains the image data.
        cout << "Image successfully created from memory pointer." << endl;
        cout << "Image size: " << image.columns() << "x" << image.rows() << endl;

        // Example: Save the image to a file to verify
        image.write("memory_image.jpg");
    } catch (Magick::Exception &error_) {
        cerr << "Error creating image from memory: " << error_.what() << endl;
        return 1;
    }

    return 0;
}


