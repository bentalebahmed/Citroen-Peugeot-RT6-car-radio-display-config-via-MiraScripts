
# Citroen-Peugeot-RT6-car-radio-display-config-via-MiraScripts
Configuration files and installation guide for the RT6 car radio-display for Citroen &amp; Peugeot using MiraScripts.

## My experience 
This guide comes from my tries and experiments with my car (Citroen C4 phase 2), which has an RT6 autoradio. The problem was that from time to time the autoradio froze and i had to reboot it with the CD eject button (long press till it turns off), so as a starter I tried to update its firmware from 2.70 to 2.86 (the latest as far as i know). I did not succeed in doing that as the RT6 has an internal micro SD card which was super slow (hence the freezing problem). 

Second try, i bought a new micro SD card (8GB) and got RT6 firmware version 2.86, i ended up with the installation starting but never finishing, after lot and lot of tries that required formatting the sd card, it was damaged, and i found that from forums that sometimes going to a way higher version of the firmware won't work. 

Third try, I used another mirco sd card (16GB, but i could work with 8GB) in order to install another firmware, version 2.80, and the maps (future installation). finally, the installation worked, but i ended up with Peugeot boot screen and radio keyboard buttons not working (I assume they were reconfigured for Peugeot cars, hence the Peugeot boot screen).

Now time to configure those things, and i found something called [MiraScripts](http://mira308sw.altervista.org/fr/index.htm), where i used RT6_MiraScripts and DatExplorer to configure the RT6 for my car and to enable extra features in it.

## Warning
Follow this work at your own risk, I guarantee nothing. It is always a good idea to back up the Miroc SD card of the RT6, and take precautions when disassembling or reassembling any part of the car.

All this work was done using a Windows computer.

## Firmware update
### RT6 firmware backup
If you are able to clone the internal RT6 SD card, you better do so by disassembling the radio-display (check for tutorials on how to do that, plus you will need a set of tools for the job), or get another SD card for the new firmware and keep aside the original SD card from the RT6. So when something goes wrong you will have your usual firmware and the RT6 will work safely.

### RT6 user file configuration backup
Another option is to copy some user files (configurations) that are related to your car using [MiraScripts](http://mira308sw.altervista.org/fr/index.htm) (RT6_MiraScripts->USERCOM).
To do so, you will need a pen drive (USB of size 16G minimum), and download  RT6_MiraScripts from [MiraScripts](http://mira308sw.altervista.org/fr/index.htm), the steps are as follows:
- Start by formatting the pen drive as FAT32.
- Extract the files to the root of the pen drive, the USB root should contain only: "CMD", "UPG", "POI", and "POI_VER.PI".
- Go to "CMD" folder and delete everything except for the "RT6_USERCOM" file (script), which is responsible for reading and writing user configuration from and to the RT6. this script will read and write 3 files:
  - "user _ #.dat" (Where # = 1-4) settings, volume, treble, bass, etc.
  - "user_com.dat": common font settings and others.
  - "user_config.dat": various system configurations (where the configurations of the RT6 related to your car are located).
- Now you need to delete a file called "System Volume Information" that is created by Windows and it will cause the process to fail, as the RT6 will check for the files, so any missing or additional file will cause a failure. to delete this file, use the "Remove Sys Vol Inf.bat" by double clicking on it, it will ask for a drive letter, let's say the USB is mounted as G, so you need to write G: in the command line and hit enter, this will delete the file for you, hit enter again or close the command line window.
- Remove the USB and do not re-plug it into the computer as this will make Windows create the "System Volume Information" again and you will have to delete it using the previous step.
- Start your car (you must keep the engine running), and plug the USB into your radio-display. As this is the first time the RT6 will ask you to execute a read USERCOME data command since no user config files are in the USB, answer yes. When it is done reading it will inform you that, now unplug your USB.
- If you plug the USB again the RT6 will ask you to execute a write USERCOME data command, if you answer yes it will write the use config files to the RT6 (here nothing will change as we have the same config files in USB and RT6), if you answer no it will ask to read those files again. 
- Going back to your Windows machine, plug the USB, in the root you will find new files "user _ #.dat" (# for me was 4), "user_com.dat" and "user_config.dat". Save those files in your machine to get back to them if anything fails.





