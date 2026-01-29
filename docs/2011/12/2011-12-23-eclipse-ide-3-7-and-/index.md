---
title: "Eclipse IDE 3.7 and MySql 5.0"
date: 2011-12-23
categories: 
  - "osde"
tags: 
  - "db"
  - "eclipse"
  - "mysql"
  - "webdev"
---

To get Eclipse IDE 3.7 working with MySql 5.0 you'll need

Data Tools Platform SQL Query Builder

http://market.eclipsesource.com/yoxos/node/org.eclipse.datatools.sqldevtools.sqlbuilder.feature.feature.group

Editor for building SQL queries SQL Query Builder enables you to create, edit, or run SQL statements using the SQL Query Builder graphical interface, which provides access to your database schema and objects so that you can quickly create or edit SQL statements without actually typing any SQL code. Data Tools Platform Enablement for MySQL

http://market.eclipsesource.com/yoxos/node/org.eclipse.datatools.enablement.mysql.feature.feature.group

DTP support for using the MySQL database The Enablement project is intended t...

http://dev.mysql.com/downloads/connector/j/

then

$ tar zxvf mysql-connector-java-5.1.18.tar.gz

\# cp \\ ~/mysql-connector-java-5.1.18/mysql-connector-java-5.1.18-bin.jar \\ /usr/lib/eclipse/plugins/mysql-connector-java-5.1.0-bin.jar

then

run eclipse
