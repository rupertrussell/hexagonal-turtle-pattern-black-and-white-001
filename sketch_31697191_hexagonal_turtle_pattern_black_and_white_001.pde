// Hexagonal Turtle Pattern Black & White 001
// On Redbubble at: https://www.redbubble.com/people/rupertrussell/works/31697191-hexagonal-turtle-pattern-black-and-white-001
// Code by Rupert Russell 12 May 2018
// as allways this may contain bugs and is not as elegant as it could be
// licence https://choosealicense.com/licenses/mit/
// MIT License

Copyright (c)  2018 Rupert Russell

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

float startX;
float startY;
float endX;
float endY;
float x;
float y;
float h = 150; 
float k = 150;
float r = 40;
boolean start = true;
int count = 0;
double step;
float yGap = 161; // 160

// 2875 × 3900 T-Shirt
// 3502 × 2385 Journal
// 1765 × 2481 notebook
// 2344 × 2467 poster 
// 2940 × 2940 clock
// 5748 × 5748 scarves
// 6310 × 6230 A-Line Dress
// 7632 × 6480 Tapestries
// 2376 × 2024 Travel Mug
// 2700 × 1624 Tall Mug
// 9144 × 6096 extra large print
// 7632 × 6480 Duvet Covers
// 2875 × 3900 Long T-Shirt
// 2696 × 3305 iPad Case
// 4600 × 3000 laptop Skin
// 4600 × 3000 Phone Cases & Skins

int repeatXtimes = floor(4600 / 144) - 1; // width
int repeatYtimes = floor(3305 / 164) - 1; // height

int heightOffset = 3305 - 310 ; // height
int widthOffset = 140;

// How to calculate points on a circle
// Based on code from http://www.mathopenref.com/coordcirclealgorithm...

void setup() {
background(0); 
strokeWeight(9); 
size(4600, 3305); // width x height
smooth();
noLoop();
strokeCap(ROUND);
}

void draw() {
stroke(255);
println("repeatXtimes = " + repeatXtimes);
println("repeatYtimes = " + repeatYtimes);
for (int i = 0; i <= repeatXtimes; i++) {
if (isEven(i)) {
stack(-50 + i * widthOffset, heightOffset, repeatYtimes );
} else {
stack(-50 + i * widthOffset, heightOffset + 80, repeatYtimes + 1);
}
}

save("Phone-Laptop-Case.png");
exit();
} // end draw

void hexagon(int radius) {
count = 0;
start = true;

step = 2 * PI/6; 
for (float theta=0; theta < 2 * PI; theta += step) {
x = h + radius * cos(theta);
y = k - radius * sin(theta); //note 2.
// point(x, y);

if (start == true) {
startX = x;
startY = y;
if (count != 0) {
line(endX, endY, startX, startY);
}
}

if (start == false) {
endX = x;
endY = y;

line(startX, startY, endX, endY);
}
count ++;
if (start == true) {
start = false;
} else {
start = true;
}
} // end void hexagon
}

void stack(float transX, float transY, int num) { 
pushMatrix();
translate(transX, transY);
for (int i = 0; i < num; i++) {
hex();
translate(0, -yGap);
}
popMatrix();
} // end void stack

void hex() {

hexagon(5);
hexagon(7);
hexagon(10);
hexagon(15);
hexagon(20);
hexagon(25);
hexagon(30);
hexagon(50);

hexagon(70);
// hexagon(90);
// hexagon(90);
} // end void hex

boolean isEven(int n) {
return n % 2 == 0;
}

boolean isOdd(int n) {
return n % 2 != 0;
}
