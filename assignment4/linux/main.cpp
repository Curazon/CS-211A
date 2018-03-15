#include <iostream>
#include <vector>
#include <cmath>
#include <memory>

#include <GL/glew.h>
#include <GL/freeglut.h>

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/transform.hpp>
#include <glm/gtx/string_cast.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtc/matrix_inverse.hpp>

#include "mymath.h"
#include "transforms.h"

void init();

// vertices for triangle
float vertices1[] = {-1.0f, -1.0f, -1.0f,
                     -1.0f, -1.0f, 1.0f,
                     -1.0f, 1.0f, 1.0f,

                     -1.0f, -1.0f, -1.0f,
                     -1.0f, 1.0f, 1.0f,
                     -1.0f, 1.0f, -1.0f,

                     1.0f, 1.0f, 1.0f,
                     1.0f, -1.0f, -1.0f,
                     1.0f, 1.0f, -1.0f,

                     1.0f, -1.0f, -1.0f,
                     1.0f, 1.0f, 1.0f,
                     1.0f, -1.0f, 1.0f,

                     1.0f, -1.0f, 1.0f,
                     -1.0f, -1.0f, -1.0f,
                     1.0f, -1.0f, -1.0f,

                     1.0f, -1.0f, 1.0f,
                     -1.0f, -1.0f, 1.0f,
                     -1.0f, -1.0f, -1.0f,

                     1.0f, 1.0f, 1.0f,
                     1.0f, 1.0f, -1.0f,
                     -1.0f, 1.0f, -1.0f,

                     1.0f, 1.0f, 1.0f,
                     -1.0f, 1.0f, -1.0f,
                     -1.0f, 1.0f, 1.0f,

                     1.0f, 1.0f, -1.0f,
                     -1.0f, -1.0f, -1.0f,
                     -1.0f, 1.0f, -1.0f,

                     1.0f, 1.0f, -1.0f,
                     1.0f, -1.0f, -1.0f,
                     -1.0f, -1.0f, -1.0f,

                     -1.0f, 1.0f, 1.0f,
                     -1.0f, -1.0f, 1.0f,
                     1.0f, -1.0f, 1.0f,

                     1.0f, 1.0f, 1.0f,
                     -1.0f, 1.0f, 1.0f,
                     1.0f, -1.0f, 1.0f
};

float normals1[] = {-1.0f, 0.0f, 0.0f,
                    -1.0f, 0.0f, 0.0f,
                    -1.0f, 0.0f, 0.0f,

                    -1.0f, 0.0f, 0.0f,
                    -1.0f, 0.0f, 0.0f,
                    -1.0f, 0.0f, 0.0f,

                    1.0f, 0.0f, 0.0f,
                    1.0f, 0.0f, 0.0f,
                    1.0f, 0.0f, 0.0f,

                    1.0f, 0.0f, 0.0f,
                    1.0f, 0.0f, 0.0f,
                    1.0f, 0.0f, 0.0f,

                    0.0f, -1.0f, 0.0f,
                    0.0f, -1.0f, 0.0f,
                    0.0f, -1.0f, 0.0f,

                    0.0f, -1.0f, 0.0f,
                    0.0f, -1.0f, 0.0f,
                    0.0f, -1.0f, 0.0f,

                    0.0f, 1.0f, 0.0f,
                    0.0f, 1.0f, 0.0f,
                    0.0f, 1.0f, 0.0f,

                    0.0f, 1.0f, 0.0f,
                    0.0f, 1.0f, 0.0f,
                    0.0f, 1.0f, 0.0f,

                    0.0f, 0.0f, -1.0f,
                    0.0f, 0.0f, -1.0f,
                    0.0f, 0.0f, -1.0f,

                    0.0f, 0.0f, -1.0f,
                    0.0f, 0.0f, -1.0f,
                    0.0f, 0.0f, -1.0f,

                    0.0f, 0.0f, 1.0f,
                    0.0f, 0.0f, 1.0f,
                    0.0f, 0.0f, 1.0f,

                    0.0f, 0.0f, 1.0f,
                    0.0f, 0.0f, 1.0f,
                    0.0f, 0.0f, 1.0f
};

float colors2[] = {0.5f, 0.0f, 0.0f, 1.0f,
                   0.5f, 0.0f, 0.0f, 1.0f,
                   0.5f, 0.0f, 0.0f, 1.0f,
                   0.5f, 0.0f, 0.0f, 1.0f,
                   0.5f, 0.0f, 0.0f, 1.0f,
                   0.5f, 0.0f, 0.0f, 1.0f,

                   1.0f, 0.0f, 0.0f, 1.0f,
                   1.0f, 0.0f, 0.0f, 1.0f,
                   1.0f, 0.0f, 0.0f, 1.0f,
                   1.0f, 0.0f, 0.0f, 1.0f,
                   1.0f, 0.0f, 0.0f, 1.0f,
                   1.0f, 0.0f, 0.0f, 1.0f,

                   0.0f, 0.5f, 0.0f, 1.0f,
                   0.0f, 0.5f, 0.0f, 1.0f,
                   0.0f, 0.5f, 0.0f, 1.0f,
                   0.0f, 0.5f, 0.0f, 1.0f,
                   0.0f, 0.5f, 0.0f, 1.0f,
                   0.0f, 0.5f, 0.0f, 1.0f,

                   0.0f, 1.0f, 0.0f, 1.0f,
                   0.0f, 1.0f, 0.0f, 1.0f,
                   0.0f, 1.0f, 0.0f, 1.0f,
                   0.0f, 1.0f, 0.0f, 1.0f,
                   0.0f, 1.0f, 0.0f, 1.0f,
                   0.0f, 1.0f, 0.0f, 1.0f,

                   0.0f, 0.0f, 0.5f, 1.0f,
                   0.0f, 0.0f, 0.5f, 1.0f,
                   0.0f, 0.0f, 0.5f, 1.0f,
                   0.0f, 0.0f, 0.5f, 1.0f,
                   0.0f, 0.0f, 0.5f, 1.0f,
                   0.0f, 0.0f, 0.5f, 1.0f,

                   0.0f, 0.0f, 1.0f, 1.0f,
                   0.0f, 0.0f, 1.0f, 1.0f,
                   0.0f, 0.0f, 1.0f, 1.0f,
                   0.0f, 0.0f, 1.0f, 1.0f,
                   0.0f, 0.0f, 1.0f, 1.0f,
                   0.0f, 0.0f, 1.0f, 1.0f,
};
float colors1[] = {0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
                   0.8, 0.4, 0, 1,
};

std::vector<float> sceneVertices;
std::vector<float> sceneNormals;
std::vector<float> sceneColors;

// shader names
const char *vertexFileName = "vertex.txt";
const char *fragmentFileName = "frag.txt";

// program and shader Id
GLuint p;

// vert attrib locations
GLuint vertexLoc, colorLoc, normalLoc;

// uniform var locations
GLuint projMatrixLoc, viewMatrixLoc, normalMatrixLoc;

GLuint ambientColorLoc, lightColorLoc, lightPositionLoc, ShininessLoc, StrengthLoc, EyeDirectionLoc, ModeLoc;

GLuint textureLoc, samplerLoc;

// vert array obj Id
GLuint vert[3];

// storage for matrices
float projMatrix[16];
float viewMatrix[16];
float normalMatrix[9];

float ambientColor[] = {0.2f, 0.2f, 0.2f, 1.0f};
float lightColor[] = {0.9f, 0.8f, 0.9f};
float lightPosition[] = {3, 3, 0};
float Shininess = 300.0;
float Strength = 0.6;
float EyeDirection[] = {1, 0, 0};
int32_t Mode = 0;

int frame = 0, elapsed_time, timebase = 0;
char s[100];

int viewPosition[3];
float angle = 0.0f;
float angle2 = 0.0f;
int startX;
int startY;

int selectX;
int selectY;
int window_width;
int window_height;
GLuint texID;

bool isAnimationOn = true;
float animationAngle = 0;

// vector opt
// res = a cross b;
void xProduct(float *a, float *b, float *res) {

  res[0] = a[1] * b[2] - b[1] * a[2];
  res[1] = a[2] * b[0] - b[2] * a[0];
  res[2] = a[0] * b[1] - b[0] * a[1];
}

// normalize a vec3
void normalize(float *a) {

  float mag = sqrt(a[0] * a[0] + a[1] * a[1] + a[2] * a[2]);
  a[0] /= mag;
  a[1] /= mag;
  a[2] /= mag;
}

// Matrix Opt. - In Opengl 3 we need to handle our own matrix.
void updateViewMatrix(glm::mat4 lookat) {
  // already column major.
  float *viewMatrixPtr = glm::value_ptr(lookat);
  for (int i = 0; i < 16; ++i) {
    viewMatrix[i] = viewMatrixPtr[i];
  }

  glm::mat3 normal = glm::inverseTranspose(glm::mat3(lookat));

  float *normalMatrixPtr = glm::value_ptr(normal);
  for (int i = 0; i < 9; ++i) {
    normalMatrix[i] = normalMatrixPtr[i];
  }
}

glm::mat4 lookatMatrix(float posX, float posY, float posZ, float lookX, float lookY, float lookZ) {
  glm::vec3 campos{posX, posY, posZ};
  glm::vec3 objpos{lookX, lookY, lookZ};
  glm::vec3 up_axis{0, 1, 0};

  glm::vec3 viewdir = objpos - campos;
  glm::vec3 right = glm::normalize(glm::cross(viewdir, up_axis));
  glm::vec3 up = glm::normalize(glm::cross(right, viewdir));

  return glm::lookAt(campos, objpos, up);
}

// Projection Matrix
void buildProjMatrix(float fov, float ratio, float nearP, float farP) {

  float f = 1.0f / tan(fov * (PI / 360.0));
  setIdentMatrix(projMatrix, 4);
  projMatrix[0] = f / ratio;
  projMatrix[1 * 4 + 1] = f;
  projMatrix[2 * 4 + 2] = (farP + nearP) / (nearP - farP);
  projMatrix[3 * 4 + 2] = (2.0f * farP * nearP) / (nearP - farP);
  projMatrix[2 * 4 + 3] = -1.0f;
  projMatrix[3 * 4 + 3] = 0.0f;
}

//Transformation matrix mat with a scaling
void setScale(float *mat, float xScale, float yScale, float zScale) {
  // inputs:  xScale: scale in x direction
  //          yScale: scale in y direction
  //          zScale: scale in z direction
  // output:  mat : Scale matrix

  float values[16] = {
      xScale, 0, 0, 0,
      0, yScale, 0, 0,
      0, 0, zScale, 0,
      0, 0, 0, 1,
  };

  for (int i = 0; i < 16; ++i) {
    mat[i] = values[i];
  }
}

void changeSize(int w, int h) {

  float ratio;

  // place viewport to be the entire window
  glViewport(0, 0, w, h);
  ratio = (1.0f * w) / h;
  buildProjMatrix(53.13f, ratio, 0.1f, 50.0f);
}

void setupBuffers() {

  GLuint buffers[4];

  glGenVertexArrays(1, vert);

  // first triangle
  glBindVertexArray(vert[0]);
  // generate 2 buffers for vert and color
  glGenBuffers(4, buffers);
  // bind buffer for vertices and copy data into buffer
  glBindBuffer(GL_ARRAY_BUFFER, buffers[0]);
  glBufferData(GL_ARRAY_BUFFER, sceneVertices.size() * sizeof(float), sceneVertices.data(), GL_STATIC_DRAW);
  glEnableVertexAttribArray(vertexLoc);
  glVertexAttribPointer(vertexLoc, 3, GL_FLOAT, 0, 0, 0);

  // bind buffer for colors and copy data into buffer
  glBindBuffer(GL_ARRAY_BUFFER, buffers[1]);
  glBufferData(GL_ARRAY_BUFFER, sceneColors.size() * sizeof(float), sceneColors.data(), GL_STATIC_DRAW);
  glEnableVertexAttribArray(colorLoc);
  glVertexAttribPointer(colorLoc, 4, GL_FLOAT, 0, 0, 0);

  // bind buffer for normals and copy data into buffer
  glBindBuffer(GL_ARRAY_BUFFER, buffers[2]);
  glBufferData(GL_ARRAY_BUFFER, sceneNormals.size() * sizeof(float), sceneNormals.data(), GL_STATIC_DRAW);
  glEnableVertexAttribArray(normalLoc);
  glVertexAttribPointer(normalLoc, 3, GL_FLOAT, 0, 0, 0);

}

void setUniforms() {

  // must be called after glUseProgram
  // set the variables for the shader
  glUniformMatrix4fv(projMatrixLoc, 1, false, projMatrix);
  glUniformMatrix4fv(viewMatrixLoc, 1, false, viewMatrix);
  glUniformMatrix3fv(normalMatrixLoc, 1, false, normalMatrix);
  glUniform4fv(ambientColorLoc, 1, ambientColor);
  glUniform3fv(lightColorLoc, 1, lightColor);
  glUniform3fv(lightPositionLoc, 1, lightPosition);
  glUniform1f(ShininessLoc, Shininess);
  glUniform1i(ModeLoc, Mode);
  glUniform1f(StrengthLoc, Strength);
  glUniform3fv(EyeDirectionLoc, 1, EyeDirection);

}

void renderScene() {
  frame++;

  if (isAnimationOn) {
    animationAngle += 0.02;
    animationAngle = std::fmod(animationAngle, static_cast<float>(M_PI) * 2);
  }

  glm::vec3 campos{10, 0, 0};
  glm::mat4 rot1 = glm::rotate<float>(glm::radians<float>(angle), glm::vec3 {0, 1, 0});
  glm::mat4 rot2 = glm::rotate<float>(glm::radians<float>(angle2), glm::vec3 {0, 0, -1});
  glm::mat4 animRot = glm::rotate<float>(animationAngle, glm::vec3 {0, 0, 1});

  glm::mat4 lookat = lookatMatrix(campos.x, campos.y, campos.z, 0, 0, 0);
  lookat = lookat * rot2 * rot1 * animRot;

  updateViewMatrix(lookat);

  elapsed_time = glutGet(GLUT_ELAPSED_TIME);
  if (elapsed_time - timebase > 100) {
    sprintf(s, "FPS:%4.2f",
            frame * 1000.0 / (elapsed_time - timebase)
    );
    timebase = elapsed_time;
    frame = 0;
  }

  glutSetWindowTitle(s);
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  glUseProgram(p);
  setUniforms();

  glBindVertexArray(vert[0]);
  glDrawArrays(GL_TRIANGLES, 0, sceneVertices.size() * sizeof(float));

  setUniforms();

  glBindVertexArray(vert[1]);
  glDrawArrays(GL_TRIANGLES, 0, sceneVertices.size() * sizeof(float));

  glutSwapBuffers();
}

void printShaderInfoLog(GLuint obj) {
  int infologLength = 0;
  int charsWritten = 0;
  char *infoLog;

  glGetShaderiv(obj, GL_INFO_LOG_LENGTH, &infologLength);

  if (infologLength > 0) {
    infoLog = (char *) malloc(infologLength);
    glGetShaderInfoLog(obj, infologLength, &charsWritten, infoLog);
    printf("%s\n", infoLog);
    free(infoLog);
  }
}

void printProgramInfoLog(GLuint obj) {
  int infologLength = 0;
  int charsWritten = 0;
  char *infoLog;

  glGetProgramiv(obj, GL_INFO_LOG_LENGTH, &infologLength);

  if (infologLength > 0) {
    infoLog = (char *) malloc(infologLength);
    glGetProgramInfoLog(obj, infologLength, &charsWritten, infoLog);
    printf("%s\n", infoLog);
    free(infoLog);
  }
}

GLuint initShaders() {

  char *vertShader = NULL, *fragShader = NULL;

  GLuint p, v, f;

  v = glCreateShader(GL_VERTEX_SHADER);
  f = glCreateShader(GL_FRAGMENT_SHADER);
  vertShader = getTxtFile(vertexFileName);
  fragShader = getTxtFile(fragmentFileName);
  const char *vv = vertShader;
  const char *ff = fragShader;
  glShaderSource(v, 1, &vv, NULL);
  glShaderSource(f, 1, &ff, NULL);
  free(vertShader);
  free(fragShader);

  glCompileShader(v);
  glCompileShader(f);
  printShaderInfoLog(v);
  printShaderInfoLog(f);
  p = glCreateProgram();
  glAttachShader(p, v);
  glAttachShader(p, f);
  glBindFragDataLocation(p, 0, "outputF");
  glLinkProgram(p);
  printProgramInfoLog(p);
  vertexLoc = glGetAttribLocation(p, "position");
  colorLoc = glGetAttribLocation(p, "color");
  normalLoc = glGetAttribLocation(p, "normal");
  projMatrixLoc = glGetUniformLocation(p, "projMatrix");
  viewMatrixLoc = glGetUniformLocation(p, "viewMatrix");
  normalMatrixLoc = glGetUniformLocation(p, "normalMatrix");
  ambientColorLoc = glGetUniformLocation(p, "Ambient");
  lightColorLoc = glGetUniformLocation(p, "LightColor");
  lightPositionLoc = glGetUniformLocation(p, "LightPosition");
  ShininessLoc = glGetUniformLocation(p, "Shininess");
  ModeLoc = glGetUniformLocation(p, "Mode");
  StrengthLoc = glGetUniformLocation(p, "Strength");
  EyeDirectionLoc = glGetUniformLocation(p, "EyeDirection");

  return (p);
}

float deltaAngle = 0.0f;
int xOrigin = -1;

//This event will trigger when you have a mouse button pressed down.
void mouseMove(int x, int y) {
  // x and y is the mouse position.
  //printf("%d ,  %d \n",x,y);
  int motionMode = 1;
  switch (motionMode) {
    case 0:
      /* No mouse button is pressed... do nothing */
      /* return; */
      break;

    case 1:
      /* rotating the view*/
      angle = angle + (x - startX) / 2;
      angle2 = angle2 + (y - startY) / 2;
      startX = x;
      startY = y;
      break;

    case 2:

      break;

    case 3:

      break;
  }

}

void keyPress(unsigned char key, int x, int y) {
  std::cout << "keyPress: " << key << std::endl;
  if (key == 'a') {
    Mode = -1;
  } else if (key == 'p') {
    Mode = 0;
  } else if (key == 'g') {
    Mode = 1;
  } else if (key == ' ') {
    isAnimationOn = !isAnimationOn;
  }
}

//This event occur when you press a mouse button.
void mouseButton(int button, int state, int x, int y) {
  startX = x;
  startY = y;
  selectX = x;
  selectY = y;
  //printf("%d , %d",selectX,selectY);
  // only start motion if the left button is pressed
  if (button == GLUT_LEFT_BUTTON) {
    // when the button is released
    if (state == GLUT_UP) {
      window_width = glutGet(GLUT_WINDOW_WIDTH);
      window_height = glutGet(GLUT_WINDOW_HEIGHT);

      GLbyte color[4];
      GLfloat depth;
      GLuint index;

      glReadPixels(x, window_height - y - 1, 1, 1, GL_RGBA, GL_UNSIGNED_BYTE, color);
      glReadPixels(x, window_height - y - 1, 1, 1, GL_DEPTH_COMPONENT, GL_FLOAT, &depth);
      glReadPixels(x, window_height - y - 1, 1, 1, GL_STENCIL_INDEX, GL_UNSIGNED_INT, &index);

      printf("Clicked on pixel %d, %d, color %02hhx%02hhx%02hhx%02hhx, depth %f, stencil index %u\n",
             x, y, color[0], color[1], color[2], color[3], depth, index);
    } else  // state = GLUT_DOWN
    {
    }
  }
}

void init() {
  viewPosition[0] = 0;
  viewPosition[1] = 0;
  viewPosition[2] = 11;

}

int main(int argc, char **argv) {
  // spinner
  for (int i = 0; i < 36; ++i) {
    sceneVertices.push_back(vertices1[i * 3]);
    sceneVertices.push_back(vertices1[i * 3 + 1]);
    sceneVertices.push_back(vertices1[i * 3 + 2]);

    sceneNormals.push_back(normals1[i * 3]);
    sceneNormals.push_back(normals1[i * 3 + 1]);
    sceneNormals.push_back(normals1[i * 3 + 2]);
  }
  for (int i = 0; i < 36 * 4; ++i) {
    sceneColors.push_back(colors1[i]);
  }

  // revolver
  for (int i = 0; i < 36; ++i) {
    glm::vec3 xyz(vertices1[i * 3], vertices1[i * 3 + 1], vertices1[i * 3 + 2]);
    xyz *= 0.5;
    xyz[1] += 3;

    sceneVertices.push_back(xyz.x);
    sceneVertices.push_back(xyz.y);
    sceneVertices.push_back(xyz.z);

    sceneNormals.push_back(normals1[i * 3]);
    sceneNormals.push_back(normals1[i * 3 + 1]);
    sceneNormals.push_back(normals1[i * 3 + 2]);
  }
  for (int i = 0; i < 36 * 4; ++i) {
    sceneColors.push_back(colors2[i]);
  }



  // sets up glut
  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
  glutInitWindowPosition(100, 100);
  glutInitWindowSize(640, 480);
  glutCreateWindow("ICS Graphics");
  glutSetWindowTitle(s);
  // call back functions
  glutDisplayFunc(renderScene);
  glutIdleFunc(renderScene);
  glutReshapeFunc(changeSize);

  glutMouseFunc(mouseButton);
  glutMotionFunc(mouseMove);
  glutKeyboardFunc(keyPress);

  // check if a particular extension is available on your platform
  glewInit();
  if (glewIsSupported("GL_VERSION_3_3"))
    printf("OpenGL 3.3 is supported\n");
  else {
    printf("OpenGL 3.3 not supported\n");
    exit(1);
  }
  glEnable(GL_DEPTH_TEST);

  glClearColor(1.0, 1.0, 1.0, 1.0);
  init();

  p = initShaders();
  setupBuffers();
  glutMainLoop();

  return (0);
}