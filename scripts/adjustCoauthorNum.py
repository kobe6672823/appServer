#! /usr/bin/python 
# -*- coding: utf-8 -*-

import MySQLdb
import time, datetime

def __getMidnightTimeStamp(curTime):
    """a method for getting the midnight(0:00am) timestamp"""
    
    year = int(time.strftime('%Y', curTime))
    month = int(time.strftime('%m', curTime))
    day = int(time.strftime('%d', curTime))
    today = datetime.datetime(year, month, day, 0, 0, 0)
    return int(time.mktime(today.timetuple()))


def main():
    """a method for updating all stories' weekCoauthorNum and allCoauthorNum"""

    try:
        print "start to adjust db"
        conn = MySQLdb.connect(host="localhost",user="root",passwd="",db="appServerDB",charset="utf8")
        cursor = conn.cursor(MySQLdb.cursors.DictCursor) 

        #need to count every story's "distinct chapter's author" in the section [lastdayTs, todayTs) and [lastWeekBeginTs, lastWeekEndTs)
        #to update the weekCoauthorNum and allCoauthorNum

        #get the current midnight(0:00am) timestamp
        todayTs = __getMidnightTimeStamp(time.gmtime())
        #get the lastday midnight(0:00am) timestamp
        lastdayTs = todayTs - 1 * 24 * 60 * 60

        #one-week-before end timeStamp
        lastWeekEndTs = todayTs - 2 * 24 * 60 * 60
        #one-week-before begin timeStamp
        lastWeekBeginTs = lastWeekEndTs - 1 * 24 * 60 * 60
   
        n = cursor.execute("select stid, weekCoauthorNum, allCoauthorNum from game_story")
        results = cursor.fetchall()
        for row in results:
            stid = row['stid']
            weekCoauthorNum = int(row['weekCoauthorNum'])
            allCoauthorNum = int(row['allCoauthorNum'])

            #count today current story's distinct coauthor_id num
            sql = "select count(distinct coauthor_id) as 'cc' from game_chapter where storyId=%s and createTime >= %d and createTime < %d" % \
                   (
                    stid,
                    lastdayTs,
                    todayTs
                   )
            n = cursor.execute(sql)
            todayCoauthorNum = int(cursor.fetchall()[0]['cc'])

            #count 7day-before current story's one-day-distinct coauthor_id num
            sql = "select count(distinct coauthor_id) as 'cc' from game_chapter where storyId=%s and createTime >= %d and createTime < %d" % \
                   (
                    stid,
                    lastWeekBeginTs,
                    lastWeekEndTs
                   )
            n = cursor.execute(sql)
            lastCoauthorNum = int(cursor.fetchall()[0]['cc'])

            #update the num
            allCoauthorNum += todayCoauthorNum
            weekCoauthorNum = weekCoauthorNum + todayCoauthorNum - lastCoauthorNum
            sql = "update game_story set allCoauthorNum=%d, weekCoauthorNum=%d where stid=%s" % (allCoauthorNum, weekCoauthorNum, stid)
            cursor.execute(sql)

        conn.commit()
        cursor.close()
        conn.close()
        print "finish adjustment"

#    n = cursor.execute("select * from game_coauthorsstatistics")
#    for row in cursor.fetchall():
#        #sixDBefore fiveDBefore fourDBefore threeDBefore twoDBefore oneDBefore today weekCoauthorsSet weekCoauthorsNum
#        sixSet = set(row['sixDBefore'].split(','))
#        fiveSet = set(row['fiveDBefore'].split(','))
#        fourSet = set(row['fourDBefore'].split(','))
#        threeSet = set(row['threeDBefore'].split(','))
#        twoSet = set(row['twoDBefore'].split(','))
#        oneSet = set(row['oneDBefore'].split(','))
#        todaySet = set(row['today'].split(','))
#        weekSet = set(row['weekCoauthorsSet'].split(','))
#    
#        weekSet = weekSet - sixSet
#        sixSet = fiveSet
#        fiveSet = fourSet
#        fourSet = threeSet
#        threeSet = twoSet
#        twoSet = oneSet
#        oneSet = todaySet
#        todaySet = set()
#
#        sql = "update game_coauthorsstatistics set sixDBefore='%s', fiveDBefore='%s', fourDBefore='%s', threeDBefore='%s', twoDBefore='%s', oneDBefore='%s', today='%s', weekCoauthorsSet='%s', weekCoauthorsNum=%d where id=%d" % \
#            (','.join(sixSet),
#            ','.join(fiveSet),
#            ','.join(fourSet),
#            ','.join(threeSet),
#            ','.join(twoSet),
#            ','.join(oneSet),
#            ','.join(todaySet),
#            ','.join(weekSet),
#            len(weekSet),
#            row['id']
#            )
#        cursor.execute(sql)
#    
#    conn.commit()
#    cursor.close()
#    conn.close()
#    print "finish adjustment"

    except MySQLdb.Error,e:
         print "Mysql Error %d: %s" % (e.args[0], e.args[1])

if __name__ == "__main__":
    main()
