# Copyright (C) 2008 The Android Open Source Project
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

L_DEFS := -DHAVE_CONFIG_H -UAF_INET6
L_CFLAGS := $(L_DEFS)

L_COMMON_HDR := Condition.h gnu_getopt.h Locale.h Reporter.h Thread.h config.win32.h headers.h Mutex.h service.h util.h Extractor.h inet_aton.h report_CSV.h snprintf.h version.h gettimeofday.h List.h report_default.h SocketAddr.h \
Client.hpp Listener.hpp Server.hpp Timestamp.hpp delay.hpp PerfSocket.hpp Settings.hpp

L_COMMON_SRC := Extractor.c Locale.c Reporter.c sockets.c gnu_getopt.c ReportCSV.c service.c stdio.c gnu_getopt_long.c ReportDefault.c SocketAddr.c tcp_window_size.c \
Client.cpp List.cpp main.cpp Server.cpp Launch.cpp Listener.cpp PerfSocket.cpp Settings.cpp

L_COMMON_COMPAT := headers_slim.h error.c inet_ntop.c signal.c string.c gettimeofday.c inet_pton.c snprintf.c Thread.c delay.cpp

iperf_SOURCES := $(L_COMMON_HDR) $(L_COMMON_SRC) $(L_COMMON_COMPAT)

include $(CLEAR_VARS)
LOCAL_MODULE := iperf
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := tests eng
LOCAL_CFLAGS := $(L_CFLAGS)
LOCAL_SRC_FILES := $(iperf_SOURCES)
include $(BUILD_EXECUTABLE)

