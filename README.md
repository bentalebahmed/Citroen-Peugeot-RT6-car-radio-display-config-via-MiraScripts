
# Citroen-Peugeot-RT6-car-radio-display-config-via-MiraScripts
Configuration files and installation guide for the RT6 car radio-display for Citroen &amp; Peugeot using [MiraScripts](http://mira308sw.altervista.org/en/index.htm).

## My experience 
This guide comes from my tries and experiments with my car (Citroen C4 phase 2, 2013, 1.6 diesel), which has an RT6 autoradio. The problem was that from time to time the autoradio froze and i had to reboot it with the CD eject button (long press till it turns off), so as a starter I tried to update its firmware from 2.70 to 2.86 (the latest as far as i know). I did not succeed in doing that as the RT6 has an internal micro SD card which was super slow (hence the freezing problem). 

Second try, i bought a new micro SD card (8GB) and got RT6 firmware version 2.86, i ended up with the installation starting but never finishing, after lot and lot of tries that required formatting the sd card, it was damaged, and i found that from forums that sometimes going to a way higher version of the firmware won't work. 

Third try, I used another mirco sd card (16GB, but i could work with 8GB) in order to install another firmware, version 2.80, and the maps (future installation). finally, the installation worked, but i ended up with Peugeot boot screen and radio keyboard buttons not working (I assume they were reconfigured for Peugeot cars, hence the Peugeot boot screen).

Now time to configure those things, and i found something called [MiraScripts](http://mira308sw.altervista.org/fr/index.htm), where i used RT6_MiraScripts and DatExplorer to configure the RT6 for my car and to enable extra features in it.

## Warning
Follow this work at your own risk, I guarantee nothing. It is always a good idea to back up the Miroc SD card of the RT6, and take precautions when disassembling or reassembling any part of the car.

All this work was done using a Windows computer.

## RT6 Firmware update
### Firmware backup
If you are able to clone the internal RT6 SD card, you better do so into another SD card or pen drive (clone not copy-paste), by disassembling the radio-display (check for tutorials on how to do that, plus you will need a set of tools for the job), or get another SD card for the new firmware and keep aside the original SD card from the RT6. So when something goes wrong you will have your usual firmware and the RT6 will work safely.

### User configuration file backup
Another option is to copy some user files (configurations) that are related to your car using [MiraScripts](http://mira308sw.altervista.org/fr/index.htm) (RT6_MiraScripts->USERCOM).
To do so, you will need a pen drive (USB of size 16G minimum), and download  RT6_MiraScripts from [MiraScripts](http://mira308sw.altervista.org/fr/index.htm), the steps are as follows:
- Start by formatting the pen drive as FAT32.
- Extract the files to the root of the pen drive, the USB root should contain only: "CMD", "UPG", "POI", and "POI_VER.PI".

  ![](https://github.com/bentalebahmed/Citroen-Peugeot-RT6-car-radio-display-config-via-MiraScripts/blob/main/Figs/mira%20root.png)

- Go to "CMD" folder and delete everything except for the "RT6_USERCOM" file (script), which is responsible for reading and writing user configuration from and to the RT6. this script will read and write 3 files:
  - "user _ #.dat" (Where # = 1-4) settings, volume, treble, bass, etc.
  - "user_com.dat": common font settings and others.
  - "user_config.dat": various system configurations (where the configurations of the RT6 related to your car are located).

![](https://github.com/bentalebahmed/Citroen-Peugeot-RT6-car-radio-display-config-via-MiraScripts/blob/main/Figs/cmd%20file.png)

- Now you need to delete a file called "System Volume Information" that is created by Windows and it will cause the process to fail, as the RT6 will check for the files, so any missing or additional file will cause a failure. to delete this file, use the ["Remove Sys Vol Inf.bat"](https://github.com/bentalebahmed/Citroen-Peugeot-RT6-car-radio-display-config-via-MiraScripts/blob/main/Remove%20Sys%20Vol%20Inf.bat) by double clicking on it, it will ask for a drive letter, let's say the USB is mounted as G, so you need to write G: in the command line and hit enter, this will delete the file for you, hit enter again or close the command line window.
- Remove the USB and do not re-plug it into the computer as this will make Windows create the "System Volume Information" again and you will have to delete it using the previous step.

![](https://github.com/bentalebahmed/Citroen-Peugeot-RT6-car-radio-display-config-via-MiraScripts/blob/main/Figs/rmv%20sys%20vol%20info%20cmd.png)

- Start your car (you must keep the engine running), and plug the USB into your radio-display. As this is the first time the RT6 will ask you to execute a read USERCOME data command since no user config files are in the USB, answer yes. When it is done reading it will inform you that, now unplug your USB.
- If you plug the USB again the RT6 will ask you to execute a write USERCOME data command, if you answer yes it will write the use config files to the RT6 (here nothing will change as we have the same config files in USB and RT6), if you answer no it will ask to read those files again. 
- Going back to your Windows machine, plug the USB, in the root you will find new files "user _ #.dat" (# for me was 4), "user_com.dat" and "user_config.dat". Save those files in your machine to get back to them if anything fails.

### Firmware installation
Assuming that you backed or cloned the RT6 internal SD card or the user config files.

For the new firmware update, you will need:
- pen drive, formatted as FAT32.
- The new firmware (for me i went from 2.70 to 2.80), a new version of the RT6 update could be found online.
- Extract the firmware content into the USB root, use "Remove Sys Vol Inf.bat" to remove the "System Volume Information" file, refer back to "User configuration file backup" to understand more.
- Start your car (you must keep the engine running) and plug the USB into your radio-display, it will take some time to read the USB (mine took around 4 min), if all goes well it will ask for a firmware update, if you have an error saying "file corrupted or missing" probably you did not copy of content into the root correctly or the "System Volume Information" file was not deleted.
- The update will take from 20 to 40 minutes, if it stops for a long time (in my case more than 1h), you will need to replace the internal SD card, install the new firmware, and configure the RT6.
- Also if the installation goes correctly you will need to reconfigure the RT6 if you find any missing functionality or not the correct configurations for your car.

Keep in mind that while the installation is running the RT6 will turn on and off multiple times, don't panic.

## SD card replacement
You will need:
- New class 10, 8GB SD card(mine 16GB), you don't need to plug it into your Windows machine to format it, as it could be used directly as it is. If installation fails you need to format it (FAT32 format) and remove the "System Volume Information" file.
- Tools to open the radio-display, search online on how to disassemble the RT6 unit of your car.
- Remove the old SD card and place the new one. Keep the old SD safe as you might be able to get the user config files from it.
- Go back to [Firmware installation](https://github.com/bentalebahmed/Citroen-Peugeot-RT6-car-radio-display-config-via-MiraScripts#firmware-installation), and follow the steps.
  
## RT6 configuration
The installation is done, now you need to configure the RT6 if it is not well configured to fit your car. Here we have 2 options, either you have the user config files backed-up and you will write them to the RT6, or you need to do a manual configuration using MiraScripts.

### User config backed-up
You will need:
- your user config files.
- RT6_MiraScripts from [MiraScripts](http://mira308sw.altervista.org/fr/index.htm).
- USB formatted as FAT32.
- Extract the files to the root of the pen drive, the USB root should contain only: "CMD", "UPG", "POI", and "POI_VER.PI".
- Go to "CMD" folder and delete everything except for the "RT6_USERCOM" file.
- Paste your user config files ("user _ #.dat", "user_com.dat" and "user_config.dat") to the root of the USB.
- Remove the "System Volume Information" file.
- Start your car (you must keep the engine running) and plug the USB into your radio-display, the RT6 will ask to execute a write command, answer yes (if it asks for read answer no), if done it will ask for a reboot, you need to reboot the RT6 by long pressing the CD eject button till the display turns off, remove the USB. When it turns on everything should be configured correctly.

You can also use the files found [here](https://github.com/bentalebahmed/Citroen-Peugeot-RT6-car-radio-display-config-via-MiraScripts/tree/main/Custom%20Citroen%20C4%20user%20config%20files) that i have found on the web and another one that i have configured for my car (Citroen C4 phase 2, 2013).

### Manual configuration using MiraScripts
You will need:
- RT6_MiraScripts from [MiraScripts](http://mira308sw.altervista.org/fr/index.htm) and [my custom DatExplorer](https://github.com/bentalebahmed/Citroen-Peugeot-RT6-car-radio-display-config-via-MiraScripts/tree/main/Custom%20DATAEXPLOERE).
- USB formatted as FAT32.
-  Extract the files of RT6_MiraScripts to the root of the pen drive, the USB root should contain only: "CMD", "UPG", "POI", and "POI_VER.PI".
- Go to "CMD" folder and delete everything except for the "RT6_USERCOM" file.
- Remove the "System Volume Information" file.
- Remove the USB and do not re-plug it.
- Start your car (you must keep the engine running), and plug the USB into your radio-display, it will ask to execute a read command, answer yes, as this will copy the current user config files into the USB. Unplug the USB and plug it into your Windows machine.
- Now go back to your Windows machine, using my custom DatExplorer we will modify the config files.

The DatExplorer contains a set of files that defines the configuration options (parameters) that allow the modification of the previously mentioned files as a "*.dat" file. In the Custom DATAEXPLOERE, we find :
- "RT6_2xx-user_N.dat.cfg" file, used to modify the "user _ #.dat" file.
- "RT6_2xx-user_com.dat.cfg" file, used to modify the "user_com.dat".
- "RT6_2xx-user_config.dat.cfg" file, used to modify the "user_config.dat".

You can view the content of the files by opening them with NotePad (or any text and source code editor like VS-code), we observe that it contains a number in between "[]" like "[3]", label (contains the label of the configuration option or sub-option), and at some options, we notice a description (description of the option or sub-option) and a text as "editable=yes", this text allows for the modification of that specific option using the DATAEXPLOERE, if it not there you can not modify it, so not all options has it as we will not modify everything, but feel free to experiment (always at your own risk). if you can't modify an option value, add the "editable=yes" to that option.

#### user_com.dat
In order to modify the user config files, double-click on the "DATEXPLORER.exe", a window will pop up asking for an update, answer no as it never works if you answer yes. Now click on "Load Config" in the top left and search for "RT6_2xx-user_com.dat.cfg" file, then click on "Load DAT" in the top left and search for "user_com.dat" (this is your backed-up file or the ones in this repo), you will have something like this: 

![](https://github.com/bentalebahmed/Citroen-Peugeot-RT6-car-radio-display-config-via-MiraScripts/blob/main/Figs/DAtExplorer.png)

In the "user_com.dat", you will find the option "1.4.54: Vehicle_Brand" which is the option for the brand of your car, this option will change the boot screen for you, by default is set to Peugeot (Vehicle_Brand=4), to change it to Citroen (Vehicle_Brand=1), double click on it "Value" on the left and set it to 1. That's it for the "user_com.dat" configuration, click "Save" on the top right corner and you are done.

#### user_config.dat
Now to the most important file, use "DATEXPLORER.exe" to load the "RT6_2xx-user_config.dat.cfg" config file using "Load Config" and the user data file "user_config.dat" using "Load DAT". the important options for me are:
- "1.4.65:VIN": your car identification number, this should correspond to the number of your car.
- "1.6.97:External temperature": display the external temperature on the main screen (0=deactivate, 1=actiate).
- "1.6.98:Language selection menu": the language selection menu when clicking on the setup button (0=deactivate, 1=actiate).
- "1.6.99:Vehicle configuration menu" the Vehicle configuration menu when clicking on the setup button, contains door selectivity, and light driving options(check all options in "1.16:Vehicle Config data") (0=deactivate, 1=actiate).
- "1.6.102:HARM00", "1.6.102:HARM01", "1.6.102:HARM02", and "1.6.102:HARM03": display themes in display configuration when clicking on the setup button (0=deactivate, 1=actiate).
- "1.8.135:FMUX_Config": this option contains the configuration for the display keyboard buttons, for me, i have this type of keyboard, check the image below,

  ![](https://github.com/bentalebahmed/Citroen-Peugeot-RT6-car-radio-display-config-via-MiraScripts/blob/main/Figs/keyboard%20buttons.png)


When you do a fresh firmware update by default the buttons will not work, you will struggle a bit to find how to scroll to be able to select yes and not for the read-write user com data, also the select (enter) button to press when you scroll for yes or not. the default "1.8.135:FMUX_Config" is as follows:

"01,02,03,04,05,06,07,08,0B,0D,0F,0C,12,13,11,15,16 ,17,18,00,24,25,26,27,28,29,2A,2B,19,1B,1C,1D,1E,2 0,21,22,23,09,2C,2D,2E,2F,30,31,01,03,00,00,00,00, 00,00,00,00,00,00,00,00,"

and it must be changed to:

"01,02,03,04,05,06,07,08,0A,22,21,1F,20,1A,1D,15,16,17,18,19,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,01,02,00,00,00,00,00,00,00,00,00,00,00,00,"

copy and paste without "".
- "1.14.230:VMF/VCCF": the steering wheel buttons configuration, for Citroen, change its value to 3. (Citroen=3, not sure for Peugeot).
- "1.16:Vehicle Config data": all the options related to "1.6.99:Vehicle configuration menu". the options are self-explained and you can experiment with them, keep in mind you may activate and options that are not in your car so it will not work as it should.

When you are done, click "Save" and remove the "System Volume Information" file, plug the USB drive and execute the write command, restart your RT6 with a long press (till it turns off) on the CD eject button, don't forget to remove the USB drive. Now, everything should work, and your RT6 is restored.

Another option you may want to activate is the oil and cooling water temperature in addition to the tire air status (works for certain cars only), and car alerts. To do so check the option "1.12:Trip data", the sub-options are self-explained, and you can set them either to 0=deactivate or 1=actiate.



