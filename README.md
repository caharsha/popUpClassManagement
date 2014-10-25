Pop-up Class Management
====================

Manage registration,check-ins for pop-up courses offered by EIC, TAMU for equipment use in labs. Automate remainders for students taking this class and generate reports.

===================
Detailed description

There are one/two hour classes offered by the EIC to train students on equipments contained in the lab, often several times during the semester. The existing implementation for managing these courses uses EventBrite. Students register for a course and are sent a confirmation email containing the time of the class, the location and a map of the location. They then check-in when they attend class and this is polled manually into excel and then manually worked on to generate reports.

Our project is to work on an independent implementation which improves upon the existing in the following. 
Add a check for a valid TAMU ID for registration rather than just a valid email (which in turn validates that the student is a current Engineering student and helps track students across multiple semesters).
Provide a more detailed course description including prerequisites prior to registration. 
Add automatic reminders for multiple occurring classes.
Automate the check-in process (to check for students who had registered for a particular class and failed to show up for the same) and provisions to evaluate certain special conditions like which students have taken sufficient classes to become an EIC expert or an EIC inventeer.
A calendar that lists all of the pop up classes that can be displayed electronically.
Automate their excel work and report generation.

