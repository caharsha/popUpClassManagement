Pop-up Class Management
========================

Detailed description

There are one/two hour classes offered by the EIC to train students on equipments contained in the lab, often several times during the semester. The existing implementation for managing these courses uses EventBrite. Students register for a course and are sent a confirmation email containing the time of the class, the location and a map of the location. They then check-in when they attend class and this is polled manually into excel and then manually worked on to generate reports.

Our project is to work on an independent implementation which improves upon the existing. Top of the priority list is the creation of a database to keep record of each student attending those classes and measure their progress. On equal footing is the need to automate the excel work and report generation. Other requirement from the administrative point is to send automatic email reminders to all the students who have registered for a class(the process that is done manually). A few other features suggested for implementation at low priority are the checks for a valid TAMU ID for registration rather than just a valid email (which in turn validates that the student is a current Engineering student and helps track students across multiple semesters).

