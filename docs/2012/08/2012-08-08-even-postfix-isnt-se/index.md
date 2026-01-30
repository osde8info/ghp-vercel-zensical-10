---
title: "even postfix isnt selinux compliant"
date: 2012-08-08
categories: 
  - "osde"
tags: 
  - "linux"
  - "security"
  - "selinux"
  - "sysadmin"
---

thanks goodness for selinux permissive mode

Summary:

SELinux is preventing postalias (postfix\_master\_t) "write" to ./aliases.db (etc\_t).

Detailed Description:

\[SELinux is in permissive mode, the operation would have been denied but was permitted due to permissive mode.\]

SELinux is preventing postalias (postfix\_master\_t) "write" to ./aliases.db (etc\_t). The SELinux type etc\_t, is a generic type for all files in the directory and very few processes (SELinux Domains) are allowed to write to this SELinux type. This type of denial usual indicates a mislabeled file. By default a file created in a directory has the gets the context of the parent directory, but SELinux policy has rules about the creation of directories, that say if a process running in one SELinux Domain (D1) creates a file in a directory with a particular SELinux File Context (F1) the file gets a different File Context (F2). The policy usually allows the SELinux Domain (D1) the ability to write, unlink, and append on (F2).

But if for some reason a file (./aliases.db) was created with the wrong context, this domain will be denied. The usual solution to this problem is to reset the file context on the target file, restorecon -v './aliases.db'. If the file context does not change from etc\_t, then this is probably a bug in policy.

Please file a bug report (http://bugzilla.redhat.com/bugzilla/enter\_bug.cgi) against the selinux-policy package. If it does change, you can try your application again to see if it works. The file context could have been mislabeled by editing the file or moving the file from a different directory, if the file keeps getting mislabeled, check the init scripts to see if they are doing something to mislabel the file.

Additional Information:

Source Context                user\_u:system\_r:postfix\_master\_t Target Context                user\_u:object\_r:etc\_t Target Objects                ./aliases.db \[ file \] Source                        postalias Source Path                   /usr/sbin/postalias Port                          <Unknown> Host                          localhost.localdomain Source RPM Packages           postfix-2.3.3-2.3.el5\_6 Target RPM Packages Policy RPM                    selinux-policy-2.4.6-327.el5 Selinux Enabled               True Policy Type                   targeted MLS Enabled                   True Enforcing Mode                Permissive Plugin Name                   mislabeled\_file Host Name                     localhost.localdomain Platform                      Linux localhost.localdomain
