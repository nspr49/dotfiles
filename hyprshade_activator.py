import os
import time
import datetime
from datetime import datetime, timedelta

now = datetime.now()

six_pm_today = now.replace(hour=18, minute=0, second=0, microsecond=0)
#now.replace(hour=20, minute=1, second=0, microsecond=0)

if now > six_pm_today:
    exit(0)

time_until_six_pm = six_pm_today - now

time.sleep(time_until_six_pm.total_seconds())
os.system('hyprshade auto')
