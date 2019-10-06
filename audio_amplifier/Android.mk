# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
    external/expat/lib \
    external/tinyalsa/include \
    external/tinycompress/include \
    hardware/libhardware/include \
    system/media/audio/include \
    system/media/audio_utils/include \
    system/media/audio_route/include \
    system/media/audio_effects/include \
    vendor/qcom/opensource/audio-hal/primary-hal/hal \
    vendor/qcom/opensource/audio-hal/primary-hal/hal/audio_extn \
    vendor/qcom/opensource/audio-hal/primary-hal/hal/msm8974

LOCAL_HEADER_LIBRARIES += generated_kernel_headers
LOCAL_C_INCLUDES += hardware/libhardware/include
#LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
#LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/techpack/audio/include
#LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/vendor/qcom/opensource/audio-kernel/include

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libcutils \
    audio.primary.$(TARGET_BOARD_PLATFORM)

LOCAL_SRC_FILES := audio_amplifier.c

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_ANC_HEADSET)),true)
    LOCAL_CFLAGS += -DANC_HEADSET_ENABLED
endif

LOCAL_MODULE := audio_amplifier.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional

LOCAL_VENDOR_MODULE := true

include $(BUILD_SHARED_LIBRARY)
