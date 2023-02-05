RM = rm -rf
MD = mkdir -p

PROJ_DIR  = $(CURDIR)

SRCS_DIR  = $(PROJ_DIR)/src
BUILD_DIR = $(PROJ_DIR)/build

OBJS_DIR  = $(BUILD_DIR)/objs

SRCS = $(wildcard $(SRCS_DIR)/*.asm)
OBJS = $(patsubst $(SRCS_DIR)/%.asm, $(OBJS_DIR)/%.o, $(SRCS))

TARGET = $(BUILD_DIR)/main
DIRS = $(BUILD_DIR) $(OBJS_DIR)

LD = ld
ASM = nasm
ASMFLAGS = -f elf64

default: all

all: $(TARGET)

$(DIRS):
	@$(foreach dir, $(DIRS), $(MD) $(dir);)	

$(TARGET): $(DIRS) $(OBJS)
	@$(RM) $(TARGET)
	$(LD) $(OBJS) -o $@

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.asm
	$(ASM) $(ASMFLAGS) $< -o $@

run:
	@$(TARGET)

clean veryclean:
	$(RM) $(BUILD_DIR)

