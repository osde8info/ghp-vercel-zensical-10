---
title: "m$ wsl 2 oracle linux 8 m$ edge 108 dnf yum rpm install"
date: 2022-12-21
categories: 
  - "osde"
---

if you are using m$ wsl oracle linux (and firefox) there seems to a bug with the m$ edge download page in that it downloads a deb instead of an rpm

https://www.microsoft.com/en-us/edge?form=MA13FJ

however if you use edge to download edge you DO get a choice between deb and rpm !

you can install rpm manually via dnf yum rpm commands

```
## setup ms yum repo 
# rpm --import https://packages.microsoft.com/keys/microsoft.asc
# dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge

## search
# dnf search microsoft-edge
Last metadata expiration check: 1 day, 14:54:20 ago on Mon 26 Dec 2022 10:06:16 PM GMT.
=== Name Matched: microsoft-edge ===
microsoft-edge-beta.x86_64 : Microsoft Edge (beta)
microsoft-edge-dev.x86_64 : Microsoft Edge (dev)
microsoft-edge-stable.x86_64 : Microsoft Edge

## choose (beta, dev or stable) & install edge
# dnf install microsoft-edge-stable

## run edge
$ microsoft-edge
```

i think you can ignore the following errors

```
[3223:3223:1221/153606.557677:ERROR:viz_main_impl.cc(188)] Exiting GPU process due to errors during initialization
[3314:3314:1221/153608.145677:ERROR:viz_main_impl.cc(188)] Exiting GPU process due to errors during initialization
[3389:3389:1221/153608.417876:ERROR:gpu_memory_buffer_support_x11.cc(44)] dri3 extension not supported.
[3246:8:1221/153608.517596:ERROR:command_buffer_proxy_impl.cc(128)] ContextResult::kTransientFailure: Failed to send GpuControl.CreateCommandBuffer.
[3269:8:1221/153608.583355:ERROR:command_buffer_proxy_impl.cc(128)] ContextResult::kTransientFailure: Failed to send GpuControl.CreateCommandBuffer.
Fontconfig error: Cannot load default config file: No such file: (null)
```

see also

- https://www.microsoftedgeinsider.com/en-us/download/?platform=linux

[![](images/image-6.png)](https://osde8info.wordpress.com/wp-content/uploads/2022/12/image-6.png)

[![](images/image.png)](https://osde8info.wordpress.com/wp-content/uploads/2022/12/image.png)
