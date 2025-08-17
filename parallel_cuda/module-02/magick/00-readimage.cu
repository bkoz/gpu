#include <Magick++.h> // Include the Magick++ header
#include <iostream>   // For input/output operations

using namespace std;
using namespace Magick;

int main(int argc, char **argv) {
    // Initialize ImageMagick. This must be called once in your application.
    InitializeMagick(*argv); 

    // Construct the Image object.
    Image image;

    try {
        // Read an image file into the image object.
        // Replace "input.jpg" with the path to your image file.
        image.read(argv[1]); 

        // At this point, the image data is loaded into the 'image' object.
        // You can now perform various operations on the image,
        // such as getting its dimensions:
        cout << "Image dimensions: " << image.columns() << "x" << image.rows() << endl;

        // Or write the image to a new file (optional):
        // image.write("output.png");

    } catch (Exception &error_) {
        // Catch and handle any exceptions that occur during image processing.
        cerr << "Caught exception: " << error_.what() << endl;
        return 1; // Indicate an error
    }

    return 0; // Indicate successful execution
}

