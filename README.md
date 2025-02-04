# Intel-AX100 Sleep Crash Patch
Band-Aid patch for a severe Intel AX100 driver bug where it crashes after Windows 10 wakes from sleep

# Quick Backstory

I have a TP-Link AX3000 PCIe card and the Bluetooth driver just breaks whenever I put my PC to sleep. The WiFi driver is fine, it's just the Bluetooth one. It seems to be, *in my opinion,* an issue with the Intel AX200 Bluetooth Driver not working well with some motherboards. Since I don't use Bluetooth on my PC too much, I would just disable and re-enable the driver in Device Manager whenever I would need it. "Intel or Gigabyte (my mobo) will fix it in a future driver update" I kept thinking to myself. I now have some BT Speakers and have reached my boiling point doing this manual driver restart **every time I wake my computer**. Everything from drivers to the BIOS has been updated and power settings were check it still breaks. So I instead created a small Powershell Script that does that driver restart automatically. It works so now I will give you guys a step by step on how to do it.

# Future V2 Update

Currently, this is just a copy and paste from my Reddit post. For V2, I will make a proper installation method

# Installation

* Find a permanent place in your computer for the .ps1 script and move it there. I recommend creating a folder in your root directory. IE: C:\Scripts\
* Open the Start Menu and search "**Task Scheduler**" and open it
   * Or you can find it in the **Windows** **Administrative Tools** folder in the Start Menu
   * Or you could press Win+R and type "**taskschd.msc**"
* On the right side, press on "**Create Task**".
   * ***Do not*** *use* "**Create Basic Task**"
* On the **General** tab
   * Name it something relevant like "Bluetooth Sleep Check"
   * Add a description for your future self to read if you want
   * Make sure "**Run with highest privileges**" is checked
   * Switch "**Configure for**" to your Windows version
* On the **Triggers** tab
   * Press New
   * Switch "**Begin the Task**" to ***On workstation unlock***
   * Make sure "**Any use**" is selected
   * Make sure "**Enabled**" on the bottom is checked
   * Press OK
* On the **Actions** tab
   * Press New
   * Make sure "**Action**" is set to ***Start a Program***
   * On "**Program/script**" paste the location of Powershell: *`C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`*
   * On "**Add arguments**" paste this argument list and be sure to put the full location path of your script file, be sure to keep the "" surrounding your path:
      * `-NonInteractive -WindowStyle Hidden -Command & "*your script location*" -ExecutionPolicy Bypass`
      * You can get the full location path by Shift+Right Clicking your script file and selecting "**Copy as path**"
      * IE: `-NonInteractive -WindowStyle Hidden -Command & "C:\Scripts\IntelAX200_BT_SleepFix.ps1" -ExecutionPolicy Bypass`
   * Press OK
* You can change things in the **Conditions** and **Settings** tabs if you want but it's not necessary.
* Press OK

# 🎉Now Windows will disable and re-enable the Bluetooth driver for you! 🎉
## If you have any issues with the script then please submit an issue

![congrats gif](https://media1.tenor.com/m/qidowOYwqScAAAAd/yes-yes-sir.gif)
