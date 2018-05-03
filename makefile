TARGET=ffav2cv
CC=g++

#工作路径定义
CURRENT_PATH=./
WORK_DIR_PATH=..
MAIN_TEST_PATH=$(CURRENT_PATH)
FFMPEG_PATH=$(WORK_DIR_PATH)/lib
FFMPEG_INTERFACE_PATH=$(WORK_DIR_PATH)/Src
OPENCV_DIR=/usr/share/opencv3.2
#库文件路径定义
LINK_LIB_PATH=

#头文件定义路径
FFMPEG_H=$(FFMPEG_PATH)/include
FFMPEG_INTERFACE_H=$(WORK_DIR_PATH)/Inc


#源文件路径定义
FFMPEG_INTERFACE_SRC = $(wildcard $(FFMPEG_INTERFACE_PATH)/*.cpp)
MAIN_TEST_SRC=$(wildcard $(MAIN_TEST_PATH)/*.cpp)


#编译中间文件定义
FFMPEG_INTERFACE_OBJ = $(FFMPEG_INTERFACE_SRC:.cpp=.o)
MAIN_TEST_OBJ = $(MAIN_TEST_SRC:.cpp=.o)

#编译选项
CXXFLAGS = -I$(FFMPEG_H) -I$(FFMPEG_INTERFACE_H) -I$(OPENCV_DIR)/include
#CXXFLAGS = -I$(FFMPEG_INTERFACE_H)
#echo $(CXXFLAGS)
# -WI,-Bstatic -$(mysqlName) -WI,-Bdynamic -lpthread -ldl -lrt

.PHONY:all

all:$(TARGET)

$(TARGET):$(FFMPEG_INTERFACE_OBJ) $(MAIN_TEST_OBJ)
	$(CC) -o $ $@	$(FFMPEG_INTERFACE_OBJ) $(MAIN_TEST_OBJ) -L$(OPENCV_DIR)/lib -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_videoio -lopencv_imgcodecs -lswscale -lavutil -Wl,-Bdynamic -lavformat -lavcodec  -ldl -lrt
$(FFMPEG_INTERFACE_OBJ):%.o:%.cpp
	$(CC) -c $(CXXFLAGS) $< -o $@
$(MAIN_TEST_OBJ):%.o:%.cpp
	$(CC) -c $(CXXFLAGS) $< -o $@ 

clean:
	rm -f $(TARGET) $(FFMPEG_INTERFACE_OBJ) $(MAIN_TEST_OBJ) 
