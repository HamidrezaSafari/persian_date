# this is a test commment
require "date"

class DateTime

    GDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    JDaysInMonth = [31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29]

    def to_persian
      
      tmp=0
      gy = self.year - 1600
      gm = self.month - 1
      gd = self.day - 1
      g_day_no = 365*gy + (gy+3)/4 - (gy+99)/100 + (gy+399)/400
      gm.times { |i| g_day_no += GDaysInMonth[i] }
      g_day_no += 1 if gm > 1 && ((gy%4 == 0 && gy%100 != 0) || (gy%400 == 0))
      g_day_no += gd
  
      j_day_no = g_day_no-79
      j_np = j_day_no/12053
      j_day_no %= 12053
      jy = 979 + 33 * j_np + 4*(j_day_no/1461)
      j_day_no %= 1461
  
      if (j_day_no >= 366)
         jy += (j_day_no - 1)/365
         j_day_no = (j_day_no - 1) % 365
      end
  
      11.times do |i|
        if j_day_no >= JDaysInMonth[i]
          j_day_no -= JDaysInMonth[i]
          tmp = i + 1
        else
          tmp = i
          break
        end
      end
      jm = tmp + 1
      jd = j_day_no + 1
  
      [jy, jm, jd]
    end
end
