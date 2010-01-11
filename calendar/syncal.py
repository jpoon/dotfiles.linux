#!/usr/bin/python

import os
import logging

def main():
    logging.basicConfig(level=logging.INFO)

    gcaldaemon = '/opt/gcaldaemon/bin/sync-now.sh'
    
    rem2ics = '/home/jason/.calendar/rem2ics'
    ical2rem = '/home/jason/.calendar/ical2rem.pl'

    path_calendar = '/home/jason/.calendar/gcal/'
    path_reminders = '/home/jason/.calendar/reminders/'

    calendars = ['academic', 'birthdays']
    calendar_extension = '.ics'
    reminder_extension = '.rem'

    # Remind -> ics
    logging.info('remind -> ics')
    for calendar in calendars:
        cal = path_calendar + calendar + calendar_extension
        rem = path_reminders + calendar + reminder_extension

        logging.debug('\t%s' % calendar)
        os.system('remind -s12 %s | %s > %s ' % (rem, rem2ics, cal))

    # Sync
    logging.info('syncing ical with gcal')
    os.system('%s' % gcaldaemon)

    # ics -> Remind
    logging.info('ics -> remind')
    for calendar in calendars:
        cal = path_calendar + calendar + calendar_extension
        rem = path_reminders + calendar + reminder_extension

        logging.debug('\t%s' % calendar)
        os.system('cat %s | %s --label %s --lead-time 1 > %s' % (cal, ical2rem, calendar, rem))

if __name__ == '__main__':
    main()
