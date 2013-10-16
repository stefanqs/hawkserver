#---------------------------------------------
#添加规则
include Rules.mk

#---------------------------------------------
#~~~~~~涉及目录设置
SUB_DIRS = ../HsLogger ../HsGateway ../HsGame ../HsRobot

#---------------------------------------------
#~~~~~~编译标签设置
all: $(SUB_DIRS)

$(SUB_DIRS): force
	$(MAKE) -C $@

#-------------------------------------------------------------------------
#~~~~~~生成依赖文件
depend: force
	-($(foreach dir,$(SUB_DIRS),$(MAKE) -C $(dir) depend;))

#-------------------------------------------------------------------------
#~~~~~~发布编译文件
install: force
	-mkdir -p ./publish
	-mkdir -p ./publish/logger
	-mkdir -p ./publish/game
	-mkdir -p ./publish/game/Config
	-cp -rf $(BIN_DIR)/hslogger ./publish/logger
	-cp -rf $(BIN_DIR)/hsgame   ./publish/game
	-cp -rf $(BIN_DIR)/hsrobot  ./publish/robot
	-cp -rf ../Config/Data		./publish/game/Config

#-------------------------------------------------------------------------
#~~~~~~清理编译文件
clean: force
	$(RM) $(OUT_DIR)
	-($(foreach dir,$(SUB_DIRS),$(MAKE) -C $(dir) clean;))

force:
