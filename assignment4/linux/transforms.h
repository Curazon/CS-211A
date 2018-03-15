//
// Created by daeyun on 3/13/18.
//

#ifndef CS211A_HW4_TRANSFORMS_H
#define CS211A_HW4_TRANSFORMS_H

#define PI       3.14159265358979323846

void multiplyMatrix(float *a, float *b);
void setTransMatrix(float *mat, float x, float y, float z);
float *rotationMatrix(float x, float y, float z, float angle);
void setIdentMatrix(float *mat, int size);

#endif //CS211A_HW4_TRANSFORMS_H
