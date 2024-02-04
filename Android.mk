LOCAL_PATH := $(CURDIR)

ifeq ($(TARGET_DEVICE),gauguin)
  subdir_makefiles=$(filter %.rc,$(sort $(wildcard $(LOCAL_PATH)/*)))
  $(info $(subdir_makefiles))
  $(patsubst %,import %,$(subdir_makefiles))
endif

# Set init and its forked children's oom_adj.
write /proc/1/oom_score_adj $(shell cat /proc/1/oom_score_adj)

# Apply strict SELinux checking of PROT_EXEC on mmap/mprotect calls.
write /sys/fs/selinux/checkreqprot $(shell cat /sys/fs/selinux/checkreqprot)

# Set the security context for the init process.
setcon u:r:init:s0

# Set the security context for the ueventd and watchdogd processes.
setcon u:r:ueventd:s0
setcon u:r:watchdogd:s0

# Set the SELinux mode based on the system property.
setenforce $(shell getenforce)
