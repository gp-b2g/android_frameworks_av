LOCAL_PATH:= $(call my-dir)

#
# libmediaplayerservice
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=               \
    ActivityManager.cpp         \
    Crypto.cpp                  \
    HDCP.cpp                    \
    MediaPlayerFactory.cpp      \
    MediaPlayerService.cpp      \
    MediaRecorderClient.cpp     \
    MetadataRetrieverClient.cpp \
    MidiFile.cpp                \
    MidiMetadataRetriever.cpp   \
    RemoteDisplay.cpp           \
    StagefrightPlayer.cpp       \
    StagefrightRecorder.cpp     \
    TestPlayerStub.cpp          \

LOCAL_SHARED_LIBRARIES :=       \
    libbinder                   \
    libcamera_client            \
    libcutils                   \
    libdl                       \
    libgui                      \
    libmedia                    \
    libmedia_native             \
    libsonivox                  \
    libstagefright              \
    libstagefright_foundation   \
    libstagefright_omx          \
    libstagefright_wfd          \
    libutils                    \
    libdl                       \
    libvorbisidec               \

LOCAL_STATIC_LIBRARIES :=       \
    libstagefright_nuplayer     \
    libstagefright_rtsp         \
    libmedia_helper             \

LOCAL_C_INCLUDES :=                                                 \
    $(call include-path-for, graphics corecg)                       \
    $(TOP)/frameworks/av/media/libstagefright/include               \
    $(TOP)/frameworks/av/include/media                              \
    $(TOP)/frameworks/av/media/libstagefright/rtsp                  \
    $(TOP)/frameworks/av/media/libstagefright/wifi-display          \
    $(TOP)/frameworks/native/include/media/openmax                  \
    $(TOP)/external/tremolo/Tremolo

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
    ifeq ($(TARGET_QCOM_MEDIA_VARIANT),caf)
    LOCAL_C_INCLUDES += \
            $(TOP)/hardware/qcom/media-caf/mm-core/inc
    else
    LOCAL_C_INCLUDES += \
            $(TOP)/hardware/qcom/media/mm-core/inc
    endif
endif

# Hack to use intel AVC Encoder for camera.
ifeq ($(TARGET_NO_METADATA_ON_AVC_ENC),true)
    LOCAL_CFLAGS += -DNO_METADATA_ON_AVC_ENC
endif

#VPP support on MRFLD only
ifeq ($(TARGET_HAS_VPP), true)
    LOCAL_CFLAGS += -DGFX_BUF_EXT
endif

LOCAL_MODULE:= libmediaplayerservice

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))
