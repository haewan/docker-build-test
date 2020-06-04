from __future__ import print_function
import cx_Oracle

# Connect as user "hr" with password "welcome" to the "orclpdb1" service running on this computer.
connection = cx_Oracle.connect("system", "oracle", "49.50.167.17/xe")

cursor = connection.cursor()

print(cursor)
