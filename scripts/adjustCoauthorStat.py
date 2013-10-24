#! /usr/bin/python 
# -*- coding: utf-8 -*-

import MySQLdb

try:
    print "start to adjust db"
    conn = MySQLdb.connect(host="localhost",user="root",passwd="",db="appServerDB",charset="utf8")
    cursor = conn.cursor(MySQLdb.cursors.DictCursor) 

    n = cursor.execute("select * from game_coauthorsstatistics")
    for row in cursor.fetchall():
        #sixDBefore fiveDBefore fourDBefore threeDBefore twoDBefore oneDBefore today weekCoauthorsSet weekCoauthorsNum
        sixSet = set(row['sixDBefore'].split(','))
        fiveSet = set(row['fiveDBefore'].split(','))
        fourSet = set(row['fourDBefore'].split(','))
        threeSet = set(row['threeDBefore'].split(','))
        twoSet = set(row['twoDBefore'].split(','))
        oneSet = set(row['oneDBefore'].split(','))
        todaySet = set(row['today'].split(','))
        weekSet = set(row['weekCoauthorsSet'].split(','))
    
        weekSet = weekSet - sixSet
        sixSet = fiveSet
        fiveSet = fourSet
        fourSet = threeSet
        threeSet = twoSet
        twoSet = oneSet
        oneSet = todaySet
        todaySet = set()

        sql = "update game_coauthorsstatistics set sixDBefore='%s', fiveDBefore='%s', fourDBefore='%s', threeDBefore='%s', twoDBefore='%s', oneDBefore='%s', today='%s', weekCoauthorsSet='%s', weekCoauthorsNum=%d where id=%d" % \
            (','.join(sixSet),
            ','.join(fiveSet),
            ','.join(fourSet),
            ','.join(threeSet),
            ','.join(twoSet),
            ','.join(oneSet),
            ','.join(todaySet),
            ','.join(weekSet),
            len(weekSet),
            row['id']
            )
        cursor.execute(sql)
    
    conn.commit()
    cursor.close()
    conn.close()
    print "finish adjustment"

except MySQLdb.Error,e:
     print "Mysql Error %d: %s" % (e.args[0], e.args[1])
