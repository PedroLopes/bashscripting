//TODO only for ints right now, adjust for floats please

//makefile: gcc map.c -o map

#include <stdio.h> //for argv
#include <string.h>//for strcmp
#include <stdlib.h>//for strtol

// This functio is the Arduino map function
// From: https://docs.arduino.cc/language-reference/en/functions/math/map/
long map(long x, long in_min, long in_max, long out_min, long out_max) {
      return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

int DEBUG = 0;

int main(int argc, char* argv[])
{
    //printf("You have entered %d arguments:\n", argc);
    if (argc == 2) {
       if (strcmp( argv[1], "--help") == 0 ) printf("map(value, fromLow, fromHigh, toLow, toHigh)\n\
	\tvalue: the number to map\n\
	\tfromLow: the lower bound of the value’s current range\n\
	\tfromHigh: the upper bound of the value’s current range\n\
	\ttoLow: the lower bound of the value’s target range\n\
	\ttoHigh: the upper bound of the value’s target range");
        return 0;
    }
    if (argc == 7) {
    DEBUG = 1;
    }
    if (argc >= 6) {
	long value = strtol(argv[1], NULL, 10);
	long fromLow = strtol(argv[2], NULL, 10);
	long fromHigh = strtol(argv[3], NULL, 10);
	long toLow = strtol(argv[4], NULL, 10);
	long toHigh = strtol(argv[5], NULL, 10);
	if (DEBUG) printf("value:\t%lu\nfromLow:\t%lu\nfromHigh:\t%lu\ntoLow:\t%lu\ntoHigh:\t%lu\n",value,fromLow,fromHigh,toLow,toHigh);
       	printf("%lu\n",map(value, fromLow, fromHigh, toLow, toHigh));
	return 0;
    } else return 0; 
}
