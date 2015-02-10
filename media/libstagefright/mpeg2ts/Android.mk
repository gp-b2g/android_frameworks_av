LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=                 \
        AnotherPacketSource.cpp   \
        ATSParser.cpp             \
        ESQueue.cpp               \
        MPEG2PSExtractor.cpp      \
        MPEG2TSExtractor.cpp      \

LOCAL_C_INCLUDES:= \
	$(TOP)/frameworks/av/media/libstagefright \
	$(TOP)/frameworks/native/include/media/openmax

LOCAL_MODULE:= libstagefright_mpeg2ts

ifeq ($(TARGET_ARCH),arm)
    LOCAL_CFLAGS += -Wno-psabi
endif

ifeq ($(TARGET_HAS_VPP),true)
 LOCAL_CFLAGS += -DTARGET_HAS_VPP
endif

include $(BUILD_STATIC_LIBRARY)