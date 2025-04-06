#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pymysql
import datetime
import pandas as pd
import sys

con = pymysql.connect(host='localhost', user='root', password='63216321', db='Homework1', charset='utf8')
cursor = con.cursor()

insert = input("===================================\n (0) 종료\n (1) 릴레이션 생성 및 데이터 추가\n (2) 제목을 이용한 검색\n (3) 관객수를 이용한 검색\n (4) 개봉일을 이용한 검색\n ===================================\n 원하는 번호를 입력하시오:\n")

while insert != "0":
    if insert == "1":
        cursor.execute("create table if not exists movie (id char(3),title varchar (100),company varchar (50),releasedate date,country varchar (10),totalscreen int,profit numeric (15,2), totalnum int,grade varchar (50),primary key (id));")
    
        with open('movie_data.txt', 'r', encoding='cp949') as data_file:
            for line in data_file:
                data = [col.strip() for col in line.strip().split('|')[1:]]  # Adjusted to match the actual format
                data[3] = datetime.datetime.strptime(data[3], '%Y-%m-%d').date()
                data[5] = int(data[5])  
                data[6] = float(data[6]) 
                data[7] = int(data[7])
                cursor.execute("INSERT INTO movie VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)", data)
                print("movie relation 생성됨")

    elif insert == "2":
        title = input("사용자 입력: ")
        sqlQuery = "SELECT * FROM movie WHERE title LIKE %s"
        cursor.execute(sqlQuery, ('%' + title + '%'))
        rows = cursor.fetchall()
        for row in rows:
            print("|", row[0], "|", row[1], "|", row[2], "|", row[3], "|", row[4], "|", row[5], "|", row[6], "|", row[7], "|", row[8])

    elif insert == "3":
        people = int(input("사용자 입력: "))
        sqlQuery = "SELECT * FROM movie WHERE totalnum >= %s"
        cursor.execute(sqlQuery, (people,))
        rows = cursor.fetchall()
        for row in rows:
            print("|", row[0], "|", row[1], "|", row[2], "|", row[3], "|", row[4], "|", row[5], "|", row[6], "|", row[7], "|", row[8])

    elif insert == "4":
        date1, date2 = input("사용자 입력 (yyyy-mm-dd, yyyy-mm-dd): ").split(',')
        date1 = datetime.datetime.strptime(date1, '%Y-%m-%d')
        date2 = datetime.datetime.strptime(date2, '%Y-%m-%d')

        sqlQuery = "SELECT * FROM movie WHERE releasedate BETWEEN %s AND %s"
        cursor.execute(sqlQuery, (date1, date2))
        rows = cursor.fetchall()
        for row in rows:
            print("|", row[0], "|", row[1], "|", row[2], "|", row[3], "|", row[4], "|", row[5], "|", row[6], "|", row[7], "|", row[8])

    insert = input("원하는 번호를 입력하시오: ")  

con.commit()
con.close()


# In[ ]:




