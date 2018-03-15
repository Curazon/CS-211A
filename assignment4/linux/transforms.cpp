//
// Created by daeyun on 3/13/18.
//

#include "transforms.h"
#include <memory.h>
#include <cmath>

// In this form : a = a * b;
void multiplyMatrix(float *a, float *b) {
  float res[16];

  for (int i = 0; i < 4; ++i) {
    for (int j = 0; j < 4; ++j) {
      res[j * 4 + i] = 0.0f;
      for (int k = 0; k < 4; ++k) {
        res[j * 4 + i] += a[k * 4 + i] * b[j * 4 + k];
      }
    }
  }
  memcpy(a, res, 16 * sizeof(float));
}

// Transformation matrix mat with a translation
void setTransMatrix(float *mat, float x, float y, float z) {
  // inputs:  x: translation in x direction
  //          y: translation in y direction
  //          z: translation in z direction
  // output:  mat : translation matrix
  // inputs:  x: translation in x direction
  //          y: translation in y direction
  //          z: translation in z direction

  float values[16] = {
      1, 0, 0, x,
      0, 1, 0, y,
      0, 0, 1, z,
      0, 0, 0, 1,
  };

  for (int i = 0; i < 16; ++i) {
    mat[i] = values[i];
  }
}

// Generates a rotation matrix.  Angle is in radian.
float *rotationMatrix(float x, float y, float z, float angle) {
  // inputs:  x,y,z: rotation vector
  //          angle:  angle of rotation arount vector(x,y,z)
  // output:  returns rotation matrix

  // Based on the code from this page.
  // http://www.programming-techniques.com/2012/03/3d-rotation-algorithm-about-arbitrary.html

  double L = (x * x + y * y + z * z);
  double radian = angle * M_PI / 180.0;
  double u2 = x * x;
  double v2 = y * y;
  double w2 = z * z;

  double mat[4][4];
  mat[0][0] = (u2 + (v2 + w2) * std::cos(radian)) / L;
  mat[0][1] = (x * y * (1 - std::cos(radian)) - z * std::sqrt(L) * std::sin(radian)) / L;
  mat[0][2] = (x * z * (1 - std::cos(radian)) + y * std::sqrt(L) * std::sin(radian)) / L;
  mat[0][3] = 0.0;

  mat[1][0] = (x * y * (1 - std::cos(radian)) + z * std::sqrt(L) * std::sin(radian)) / L;
  mat[1][1] = (v2 + (u2 + w2) * std::cos(radian)) / L;
  mat[1][2] = (y * z * (1 - std::cos(radian)) - x * std::sqrt(L) * std::sin(radian)) / L;
  mat[1][3] = 0.0;

  mat[2][0] = (x * z * (1 - std::cos(radian)) - y * std::sqrt(L) * std::sin(radian)) / L;
  mat[2][1] = (y * z * (1 - std::cos(radian)) + x * std::sqrt(L) * std::sin(radian)) / L;
  mat[2][2] = (w2 + (u2 + v2) * std::cos(radian)) / L;
  mat[2][3] = 0.0;

  mat[3][0] = 0.0;
  mat[3][1] = 0.0;
  mat[3][2] = 0.0;
  mat[3][3] = 1.0;

  auto *ret = new float[16];
  for (int i = 0; i < 4; ++i) {
    for (int j = 0; j < 4; ++j) {
      ret[i * 4 + j] = (float) mat[i][j];
    }
  }
  return ret;
}

// sets the square matrix mat to the ID matrix,
void setIdentMatrix(float *mat, int size) {
  // input: size: size of the matrix (for example size=4 means 4 by 4 matrix)
  // output: mat: Identity matrix

  for (int i = 0; i < size; ++i) {
    for (int j = 0; j < size; ++j) {
      if (j == i) {
        mat[j * size + i] = 1;
      } else {
        mat[j * size + i] = 0;
      }
    }
  }
}

