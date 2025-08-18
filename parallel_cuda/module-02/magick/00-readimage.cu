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
        
        Pixels view(image);

        // malloc image memory
    	unsigned char ** red = new unsigned char*[image.columns()];
        unsigned char ** green = new unsigned char*[image.columns()];
    	unsigned char ** blue = new unsigned char*[image.columns()];

        for(int i = 0; i < image.columns(); ++i) {
                red[i] = new unsigned char[image.rows()];
                green[i] = new unsigned char[image.rows()];
                blue[i] = new unsigned char[image.rows()];
        }

        // Copy pixel data from the Pixels object to the allocated arrays.
        for (int y = 0; y < image.rows(); ++y) {
            for (int x = 0; x < image.columns(); ++x) {
                Color pixel = image.pixelColor(x, y);
                red[x][y] = (int) 255 * (float) pixel.redQuantum() / QuantumRange;
                green[x][y] = 255 * (float) pixel.greenQuantum() / QuantumRange;
                blue[x][y] = 255 * (float) pixel.blueQuantum() / QuantumRange;

                if(x==50 && y==51) {
                    cout << "in memory image sample = " << (int) red[x][y] << ", " << (int) green[y][x] << ", " << (int) blue[y][x] << endl;
                }   
            }
        }

        cout << "in memory image sample = " << (int) red[50][51] << ", " << (int) green[51][50] << ", " << (int) blue[51][50] << endl;

        // Access pixel data using the Pixels object.
        Color pixel_sample; 
        pixel_sample = image.pixelColor(51,50);
        cout << "pixel_sample = " << (float) pixel_sample.redQuantum() / QuantumRange << 
        ", " << (float) pixel_sample.greenQuantum() / QuantumRange << ", " << (float) pixel_sample.blueQuantum() / QuantumRange << endl;

        // Or write the image to a new file (optional):
        image.write("images/output.png");

    } catch (Exception &error_) {
        // Catch and handle any exceptions that occur during image processing.
        cerr << "Caught exception: " << error_.what() << endl;
        return 1; // Indicate an error
    }

    return 0; // Indicate successful execution
}

