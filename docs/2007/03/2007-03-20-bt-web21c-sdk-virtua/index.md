---
title: "BT Web21C SDK virtual phones"
date: 2007-03-20
categories: 
  - "osde"
tags: 
  - "bt"
  - "phones"
  - "sdk"
  - "sip"
  - "telephony"
  - "test"
  - "virtual"
  - "voip"
  - "web21c"
---

[BT Web 21C SDK](http://sdk.bt.com/) have provided some standalone, virtual phones designed to help you with testing your applications. The virtual phones can be used to isolate problems which may arise during typical call states and may even be used to automate your testing.

**Happy** - The cheerful one. Happy and eager to talk whenever you choose.  
\[_Phone initially connects, then disconnects after 60 seconds_\].  

**Bashful** - The shy one. Shy and very soon gets too bashful to talk, then hastily hangs up.  
_\[Phone initially connects, then disconnects after 3 seconds\].  
_

**Grumpy** - The disgruntled one. Always too busy for anyone but himself.  
\[_Phone is always busy_\].  

**Dopey** - The slow one. Has never really grasped the concept of using a telephone, so you never get connected.  
\[_Phone never connects, phone reports problem with status = SERVICE\_UNAVAILABLE_\].  

**Doc** - The clever one. Always in demand, you connect after 10 seconds, but his wise answers only ever take 3 seconds to tell you, then he disconnects.  
\[_Phone connects after a delay of 10 seconds, then disconnects after a further 3 seconds_\].  

**Sneezy** - The respiratorially challenged one. You get connected, but he sneezes after 10 seconds and accidently disconnects the call.  
\[_Phone initially connects, then disconnects after 10 seconds_\].  

**Sleepy** - The sleepy one. You never get connected to this one.  
\[_Phone never connects, after 60 seconds status becomes status = SERVICE\_UNAVAILABLE_\] 

  

**Usage Examples:**

voiceComponent.Caller = CapabilityHelper.GetMockPhone(CapabilityHelper.MockPhone.Happy);  
voiceComponent.Callee = CapabilityHelper.GetMockPhone(CapabilityHelper.MockPhone.Sleepy);

[Read and post comments](http://osde-info.vox.com/library/post/bt-web21c-sdk-virtual-phones.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00d4142324b3685e?_c=feed-atom-full)
