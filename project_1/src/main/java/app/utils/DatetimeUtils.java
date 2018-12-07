package app.utils;

import java.util.Calendar;
import java.util.Date;

public class DatetimeUtils {
    public int getLastDayOfCurrentMonth() {
        Calendar calendar = getCurrentDate();
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        return calendar.get(Calendar.DAY_OF_MONTH);
    }

    public int getCurrentYear() {
        return getCurrentDate().get(Calendar.YEAR);
    }

    private Calendar getCurrentDate() {
        Date date = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        return (Calendar) c.clone();
    }
}
