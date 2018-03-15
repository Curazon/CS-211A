#include <gtest/gtest.h>
#include <iostream>
#include <cmath>

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/string_cast.hpp>
#include <glm/gtx/transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include "transforms.h"

TEST(SanityCheck, OneEqualsOne) {
  ASSERT_EQ(1, 1);
}

TEST(Transforms, RotationMatrixIdentity) {
  float values[16] = {
      1, 0, 0, 0,
      0, 1, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 1,
  };

  {
    float *mat = rotationMatrix(1, 1, 1, 0);
    for (int i = 0; i < 16; ++i) {
      ASSERT_TRUE(std::fabs(mat[i] - values[i]) < 1e-7);
    }
    delete[] mat;
  }
  {
    float *mat = rotationMatrix(0, 1, 0, 0);
    for (int i = 0; i < 16; ++i) {
      ASSERT_TRUE(std::fabs(mat[i] - values[i]) < 1e-7);
    }
    delete[] mat;
  }
  {
    float *mat = rotationMatrix(0, 0, 1, 0);
    for (int i = 0; i < 16; ++i) {
      ASSERT_TRUE(std::fabs(mat[i] - values[i]) < 1e-7);
    }
    delete[] mat;
  }
  {
    float *mat = rotationMatrix(1, 0, 0, 0);
    for (int i = 0; i < 16; ++i) {
      ASSERT_TRUE(std::fabs(mat[i] - values[i]) < 1e-7);
    }
    delete[] mat;
  }
}

TEST(Transforms, RotationMatrix) {
  float values[16] = {
      0.98589291, -0.13705796, 0.09607434, 0.,
      0.1413986, 0.9891484, -0.03989846, 0.,
      -0.08956337, 0.05292039, 0.9945742, 0.,
      0., 0., 0., 1.
  };
  float *mat = rotationMatrix(1, 2, 3, 10);
  for (int i = 0; i < 16; ++i) {
    ASSERT_FLOAT_EQ(mat[i], values[i]);
  }
  delete[] mat;

  // Transpose
  mat = rotationMatrix(1, 2, 3, -10);
  for (int j = 0; j < 4; ++j) {
    for (int i = 0; i < 4; ++i) {
      ASSERT_FLOAT_EQ(mat[i * 4 + j], values[j * 4 + i]);
    }
  }
  delete[] mat;
}

TEST(Transforms, GLMRotationMatrix) {
  float values[16] = {
      0.98589291, -0.13705796, 0.09607434, 0.,
      0.1413986, 0.9891484, -0.03989846, 0.,
      -0.08956337, 0.05292039, 0.9945742, 0.,
      0., 0., 0., 1.
  };

  // Transpose because glm is column major by default.
  glm::mat4 mat = glm::transpose(glm::rotate<float>(glm::radians<float>(10), glm::vec3 {1, 2, 3}));
  float *matPtr = glm::value_ptr(mat);

  for (int i = 0; i < 16; ++i) {
    ASSERT_FLOAT_EQ(matPtr[i], values[i]);
  }
}

TEST(GLM, Lookat) {
  glm::vec3 campos{10, 10, 10};
  glm::vec3 objpos{0, 0, 0};
  glm::vec3 up{-0.40824829, -0.40824829, 0.81649658};
  glm::mat4 mat = glm::lookAt(campos, objpos, up);
}

int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}